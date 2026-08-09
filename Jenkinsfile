pipeline {

    agent {
        dockerfile {
            label 'docker-x86_64'
            filename 'Dockerfile.jenkins'
            args '-t --user=root --privileged -v /var/run/docker.sock:/var/run/docker.sock'
            reuseNode true
        }
    }

    triggers {
      GenericTrigger(
        genericVariables: [[key: 'ref', value: '$.ref']],
        causeString: 'Triggered on $ref',
        printContributedVariables: true,
        printPostContent: true,
        silentResponse: false,
        shouldNotFlatten: false,
        regexpFilterText: '$ref',
        regexpFilterExpression: 'refs/heads/' + BRANCH_NAME
      )
    }

    options {
        disableConcurrentBuilds()
        buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10'))
    }

    environment {
        R6RS_SCHEMES="capyscheme chezscheme ironscheme sagittarius"
        R7RS_SCHEMES="capyscheme chibi chicken gauche kawa mosh racket sagittarius skint stklos tr7 ypsilon"
        SRFIS="1 2 5 8 11 14 16 19 25 26 27 28 29 31 37 38 39 41 42 43 48 51 60 63 64 66 69 87 95 111 113 115 116 128 145 180 197 227 235"
        PWD="${WORKSPACE}"
    }

    stages {
        stage('Init') {
            steps {
                sh "rm -rf srfi-test"
                sh "make srfi-test"

            }
        }

        stage('Tests') {
            steps {
                script {
                    def r6rsStages = [:]
                    def r7rsStages = [:]

                    env.SRFIS.split().each { SRFI ->
                        stage("SRFI-${SRFI} R6RS") {
                            env.R6RS_SCHEMES.split().each { SCHEME ->
                                r6rsStages["${SCHEME}"] = {
                                    stage("${SCHEME}") {
                                            catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                            sh "timeout 1200 make SCHEME=${SCHEME} RNRS=r6rs SRFI=${SRFI} test-docker; chmod -R 776 ."
                                            archiveArtifacts artifacts: ".tmp/${SCHEME}-${SRFI}/*.log", allowEmptyArchive: true, fingerprint: true

                                        }
                                    }
                                }
                            }
                            parallel r6rsStages
                        }
                        stage("SRFI-${SRFI} R7RS") {
                            env.R7RS_SCHEMES.split().each { SCHEME ->
                                r7rsStages["${SCHEME}"] = {
                                    stage("${SCHEME}") {
                                        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                            sh "timeout 1200 make SCHEME=${SCHEME} RNRS=r7rs SRFI=${SRFI} test-docker; chmod -R 776 ."
                                            archiveArtifacts artifacts: ".tmp/${SCHEME}-${SRFI}/*.log", allowEmptyArchive: true, fingerprint: true
                                        }
                                    }
                                }
                            }
                            parallel r7rsStages
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
