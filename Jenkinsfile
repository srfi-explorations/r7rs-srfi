pipeline {

    agent {
        docker {
            image 'debian:trixie'
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
                sh "apt-get update && apt-get install -y git make gcc sudo docker.io"
                sh "git clone https://codeberg.org/Schemeists/apt-packages.git --depth=1"
                sh "make -C apt-packages install-repository"
                sh "apt-get update && install -y chibi-next"
                sh "snow-chibi install --impls=chibi retropikzel.test-r7rs"
                sh "make srfi-test"

            }
        }

        stage('Tests') {
            steps {
                script {
                    '1 2 5 8 11 14 16 19 25 26 27 28 29 31 37 38 39 41 42 43 48 51 60 63 64 66 69 87 95 111 113 115 116 128 145 180 197 227'.split().each { SRFI ->
                        'capyscheme chibi chicken cyclone foment gauche gambit guile kawa larceny loko meevax mit-scheme mosh racket sagittarius skint stklos tr7 ypsilon'.split().each { SCHEME ->
                            catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                stage("SRFI-${SRFI} - ${SCHEME}") {
                                    sh "make SRFI=${SRFI} SCHEME=${SCHEME} test-docker"
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
