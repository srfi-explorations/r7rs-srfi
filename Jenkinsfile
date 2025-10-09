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
        string(name: 'SRFIS', defaultValue: '2 4 5 8 11 14 39 60 64 69', description: 'Build SRFIs')
    }

    stages {
        stage('Tests') {
            steps {
                script {
                    def schemes = sh(script: 'compile-r7rs --list-r7rs-schemes', returnStdout: true).split()
                    params.SRFIS.split().each { SRFI ->
                        schemes.each { SCHEME ->
                            stage("${SCHEME} ${SRFI}") {
                                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                    sh "make SCHEME=${SCHEME} SRFI=${SRFI} package install"
                                    sh "make SCHEME=${SCHEME} SRFI=${SRFI} test-docker"
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

