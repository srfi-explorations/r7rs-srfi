pipeline {

    agent {
        dockerfile {
            filename 'Dockerfile.jenkins'
            label 'docker-x86_64'
            args '--user=root --privileged -v /var/run/docker.sock:/var/run/docker.sock'
            reuseNode true
        }
    }

    triggers {
        cron '0 22 * * *'
    }

    options {
        disableConcurrentBuilds()
        buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10'))
    }

    parameters {
        string(name: 'R6RS_SCHEMES', defaultValue: 'capyscheme chezscheme ikarus ironscheme sagittarius', description: 'Test SRFIs')
        string(name: 'R7RS_SCHEMES', defaultValue: 'capyscheme chibi cyclone foment gauche gambit kawa meevax mit-scheme mosh racket sagittarius skint stklos tr7 ypsilon', description: 'Test SRFIs')
        string(name: 'SRFIS', defaultValue: '1 2 4 5 8 11 13 14 16 19 27 28 31 37 38 39 41 42 43 44 48 51 54 60 63 64 69 87 95 11 113 115 116 128 145 180 227', description: 'Test SRFIs')
    }

    stages {

        stage('Clean and build testprograms') {
            steps {
                sh "rm -rf logs"
                sh "rm -rf srfi-test"
                sh "make srfi-test"
                sh "cd srfi-test && chibi-scheme convert.scm"
            }
        }

        stage('Tests') {
            steps {
                script {
                    params.SRFIS.split().each { SRFI ->
                        stage("SRFI-${SRFI} R6RS") {
                            params.R6RS_SCHEMES.split().each { SCHEME ->
                                stage("${SCHEME}") {
                                    options {
                                        timeout(time: 10, unit: 'MINUTES')
                                    }
                                    catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                        sh "make SCHEME=${SCHEME} RNRS=r6rs SRFI=${SRFI} test-docker"
                                        sh "ls .tmp"
                                    }
                                }
                            }
                        }
                        stage("SRFI-${SRFI} R7RS") {
                            params.R7RS_SCHEMES.split().each { SCHEME ->
                                stage("${SCHEME}") {
                                    options {
                                        timeout(time: 10, unit: 'MINUTES')
                                    }
                                    catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                        sh "make SCHEME=${SCHEME} RNRS=r7rs SRFI=${SRFI} test-docker"
                                        sh "ls .tmp"
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        stage('Artifacts') {
            steps {
                archiveArtifacts artifacts: "logs/*/*.log", fingerprint: true, allowEmptyArchive: true
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}
