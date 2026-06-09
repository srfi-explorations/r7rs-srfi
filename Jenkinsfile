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

        stage('Clean and build testprograms') {
            steps {
                sh "rm -rf logs"
                sh "rm -rf srfi-test"
                sh "make srfi-test"
            }
        }

        stage('Tests R7RS') {
            steps {
                script {
                    'capyscheme chibi chicken foment gauche kawa mit-scheme mosh racket sagittarius skint stklos tr7 ypsilon'.split().each { SCHEME ->
                        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                            stage("${SCHEME}") {
                                sh "make SRFI=64 SCHEME=${SCHEME} all install"
                                sh "make BATS_JOBS=16 SCHEME=${SCHEME} test-implementation"
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
