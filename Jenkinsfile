pipeline {

    agent {
        dockerfile {
            label 'docker-x86_64'
            filename 'Dockerfile.jenkins'
            args '--user=root --privileged -v /var/run/docker.sock:/var/run/docker.sock'
            reuseNode true
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
        string(name: 'SRFIS', defaultValue: '1 2 4 5 8 11 14 39 41 60 64 69', description: 'Build SRFIs')
    }

    stages {

        stage('Init and warmup') {
            steps {
                sh "make srfi-test"
                sh "make test-docker"
            }
        }

        stage('Tests') {
            steps {
                script {
                    def schemes = sh(script: 'compile-r7rs --list-r7rs-schemes', returnStdout: true).split()
                    params.SRFIS.split().each { SRFI ->
                        stage("SRFI-${SRFI}") {
                            parallel schemes.collectEntries { SCHEME ->
                                [(SCHEME): {
                                    stage("${SCHEME}") {
                                        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                            sh "timeout 600 make SCHEME=${SCHEME} SRFI=${SRFI} test-docker"
                                            archiveArtifacts artifacts: "logs/${SCHEME}/*.log", allowEmptyArchive: true, fingerprint: true
                                        }
                                    }
                                }]
                            }
                        }
                    }
                }
            }
        }
    }
}

