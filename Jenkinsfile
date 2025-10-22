pipeline {

    agent {
        dockerfile {
            label 'docker-x86_64'
            filename 'Dockerfile.jenkins'
            args '--user=root --privileged -v /var/run/docker.sock:/var/run/docker.sock'
        }
    }

    triggers{
        cron('0 1 * * *')
    }

    options {
        disableConcurrentBuilds()
            buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10'))
    }

    parameters {
        string(name: 'SRFIS', defaultValue: '1 2 4 5 8 11 14 39 60 64 69', description: 'Build SRFIs')
    }

    stages {

        stage('Init') {
            steps {
                sh "make srfi-test"
            }
        }

        stage('Tests') {
            steps {
                script {
                    def schemes = sh(script: 'compile-r7rs --list-r7rs-schemes', returnStdout: true).split()
                    params.SRFIS.split().each { SRFI ->
                        schemes.collectEntries { SCHEME ->
                            stage("${SCHEME} ${SRFI} test docker") {
                                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                    sh "timeout 300 make SCHEME=${SCHEME} SRFI=${SRFI} test-docker"
                                    sh "make clean"
                                    archiveArtifacts artifacts: "logs/${SCHEME}/*.log", allowEmptyArchive: true, fingerprint: true
                                }
                            }

                            stage("${SCHEME} ${SRFI} test install") {
                                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                    sh "timeout 60 make SCHEME=${SCHEME} SRFI=${SRFI} SNOW_CHIBI_ARGS=--always-yes build install"
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

