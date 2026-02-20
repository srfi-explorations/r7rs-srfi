pipeline {

    agent {
        dockerfile {
            label 'docker-x86_64'
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
        string(name: 'R6RS_SCHEMES', defaultValue: 'capyscheme chezscheme guile ikarus ironscheme loko mosh racket sagittarius ypsilon', description: 'Test SRFIs')
        string(name: 'R7RS_SCHEMES', defaultValue: 'capyscheme chibi chicken cyclone foment gambit gauche kawa loko meevax mit-scheme mosh racket sagittarius skint stklos tr7 ypsilon', description: 'Test SRFIs')
        string(name: 'SRFIS', defaultValue: '64', description: 'Test SRFIs')
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
                                        sh "timeout 600 make SCHEME=${SCHEME} RNRS=r6rs SRFI=${SRFI} run-test-docker"
                                    }
                                }
                            }
                        }
                        stage("SRFI-${SRFI} R7RS") {
                            params.R7RS_SCHEMES.split().each { SCHEME ->
                                stage("${SCHEME}") {
                                    catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                        sh 'find . -name "*.so" -delete'
                                        sh "timeout 600 make SCHEME=${SCHEME} RNRS=r7rs SRFI=${SRFI} run-test-docker"
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
            sh "make report"
            sh "chmod -R 755 ." // HTML publish will fail without this
            publishHTML (target : [allowMissing: false,
                    alwaysLinkToLastBuild: true,
                    keepAll: true,
                    reportDir: '',
                    reportFiles: 'report.html',
                    reportName: 'r7rs-srfi-test-results',
                    reportTitles: 'r7rs-srfi-test-results'])
            archiveArtifacts(artifacts: '*.log', allowEmptyArchive: true, fingerprint: true)
        }
    }
}

