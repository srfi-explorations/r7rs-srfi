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

    stages {
        stage('Init') {
            steps {
                sh "make srfi-test"
                sh "sh bats.sh"
            }
        }

        stage('Tests') {
            steps {
                script {
                    '1 2 5 8 11 14 16 19 25 26 27 28 29 31 37 38 39 41 42 43 48 51 60 63 64 66 69 87 95 111 113 115 116 128 145 180 197 227'.split().each { SRFI ->
                        'capyscheme chibi chicken cyclone foment gauche gambit guile kawa larceny loko meevax mit-scheme mosh racket sagittarius skint stklos tr7 ypsilon'.split().each { SCHEME ->
                            catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                stage("${SRFI} - ${SCHEME}") {
                                    sh "make SRFI=${SCHEME} SCHEME=${SCHEME} test-docker"
                                }
                            }
                        }
                    }
                }
            }
        }

        stage('Tier 2 R7RS') {
            steps {
                script {
                    'capyscheme cyclone gambit guile loko meevax skint tr7'.split().each { SCHEME ->
                        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                            stage("${SCHEME}") {
                                sh "make TIER=2 SRFI=64 SCHEME=${SCHEME} all install"
                                sh "make TIER=2 BATS_JOBS=4 SCHEME=${SCHEME} test-implementation"
                            }
                        }
                    }
                }
            }
        }

        stage('Tier 3 R7RS') {
            steps {
                script {
                    'foment mit-scheme larceny'.split().each { SCHEME ->
                        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                            stage("${SCHEME}") {
                                sh "make TIER=3 SRFI=64 SCHEME=${SCHEME} all install"
                                sh "make TIER=3 BATS_JOBS=4 SCHEME=${SCHEME} test-implementation"
                            }
                        }
                    }
                }
            }
        }

    }
    post {
        success {
            archiveArtifacts artifacts: "out/tests/*/*.log", allowEmptyArchive: true
        }
        always {
            cleanWs()
        }
    }
}
