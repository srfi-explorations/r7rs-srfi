pipeline {

    agent {
        dockerfile {
            filename 'Dockerfile.test'
            label 'docker-x86_64'
            args '--user=root'
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

        stage('Tier 1 R7RS') {
            steps {
                script {
                    'chibi chicken gauche kawa mosh racket sagittarius stklos ypsilon'.split().each { SCHEME ->
                        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                            stage("${SCHEME}") {
                                sh "make TIER=1 SRFI=64 SCHEME=${SCHEME} all install"
                                sh "make TIER=1 BATS_JOBS=4 SCHEME=${SCHEME} test-implementation"
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
