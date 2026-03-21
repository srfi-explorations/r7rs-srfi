pipeline {

    agent {
        dockerfile {
            label 'agent1'
            filename 'Dockerfile.jenkins'
            args '--user=root --privileged -v /var/run/docker.sock:/var/run/docker.sock'
            reuseNode true
        }
    }

    options {
        disableConcurrentBuilds()
            buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10'))
    }

    parameters {
        string(name: 'R6RS_SCHEMES', defaultValue: 'capyscheme chezscheme ironscheme sagittarius', description: 'Test SRFIs')
        string(name: 'R7RS_SCHEMES', defaultValue: 'capyscheme chibi chicken foment gauche kawa mosh racket sagittarius skint stklos tr7 ypsilon', description: 'Test SRFIs')
        string(name: 'SRFIS', defaultValue: '64 2 60 145 180', description: 'Test SRFIs')
    }

    stages {
        stage('Clean and build testfiles') {
            steps {
                sh "make clean"
                sh "rm -rf srfi-test"
                sh "make srfi-test"
            }
        }

        stage('Tests') {
            steps {
                script {
                    params.SRFIS.split().each { SRFI ->
                        stage("SRFI-${SRFI} R6RS") {
                            params.R6RS_SCHEMES.split().each { SCHEME ->
                                stage("${SCHEME}") {
                                    catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                        sh "timeout 600 make SCHEME=${SCHEME} RNRS=r6rs SRFI=${SRFI} test-docker"
                                    }
                                }
                            }
                        }
                        stage("SRFI-${SRFI} R7RS") {
                            params.R7RS_SCHEMES.split().each { SCHEME ->
                                stage("${SCHEME}") {
                                    catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                        sh "timeout 600 make SCHEME=${SCHEME} RNRS=r7rs SRFI=${SRFI} test-docker"
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}

