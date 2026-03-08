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
        string(name: 'R6RS_SCHEMES', defaultValue: 'capyscheme chezscheme guile ikarus ironscheme larceny loko mosh racket sagittarius ypsilon', description: 'Test SRFIs')
        string(name: 'R7RS_SCHEMES', defaultValue: 'capyscheme chibi chicken cyclone foment gauche gambit guile kawa larceny loko meevax mit-scheme mosh racket sagittarius skint stklos tr7 ypsilon', description: 'Test SRFIs')
        string(name: 'SRFIS', defaultValue: '64 60 145 180', description: 'Test SRFIs')
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
                                        sh 'find . -name "*.so" -delete'
                                        sh 'rm -rf logs/*.json'
                                        sh "timeout 600 make SCHEME=${SCHEME} RNRS=r6rs SRFI=${SRFI} run-test-docker"
                                        archiveArtifacts(artifacts: "logs/*.json", allowEmptyArchive: true, fingerprint: true)
                                    }
                                }
                            }
                        }
                        stage("SRFI-${SRFI} R7RS") {
                            params.R7RS_SCHEMES.split().each { SCHEME ->
                                stage("${SCHEME}") {
                                    catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                        sh 'find . -name "*.so" -delete'
                                        sh 'rm -rf logs/*.json'
                                        sh "timeout 600 make SCHEME=${SCHEME} RNRS=r7rs SRFI=${SRFI} run-test-docker"
                                        archiveArtifacts(artifacts: "logs/*.json", allowEmptyArchive: true, fingerprint: true)
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
        success {
            archiveArtifacts(artifacts: 'logs/*.log', allowEmptyArchive: true, fingerprint: true)
            cleanWs()
        }
        failure {
            cleanWs()
        }
    }
}

