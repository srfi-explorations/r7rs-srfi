pipeline {

    agent {
        dockerfile {
            label 'agent1'
            filename 'Dockerfile.jenkins'
            args '--user=root --privileged -v /var/run/docker.sock:/var/run/docker.sock'
            reuseNode true
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
        string(name: 'SRFIS', defaultValue: '1 2 4 5 8 11 13 14 27 39 41 60 63 64 69 95 111 113 115 116 180', description: 'Test SRFIs')
    }

    stages {

        stage('Init and warmup') {
            steps {
                sh "rm -rf srfi-test"
                sh "make srfi-test"
            }
        }

        stage('Tests') {
            parallel {

                stage('R6RS') {
                    steps {
                        script {
                            def schemes = sh(script: 'compile-scheme --list-r6rs-except larceny', returnStdout: true).split()
                                params.SRFIS.split().each { SRFI ->
                                    stage("SRFI-${SRFI}") {
                                        schemes.each { SCHEME ->
                                            stage("${SCHEME}") {
                                                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                                    sh "TIMECMD=\"/usr/bin/time -v\" timeout 120 make SCHEME=${SCHEME} SRFI=${SRFI} test-r6rs-docker"
                                                }
                                            }
                                        }
                                    }
                                }
                        }
                    }
                }

                stage('R7RS') {
                    steps {
                        script {
                            def schemes = sh(script: 'compile-scheme --list-r7rs-except larceny meevax tr7', returnStdout: true).split()
                                params.SRFIS.split().each { SRFI ->
                                    stage("SRFI-${SRFI}") {
                                        schemes.each { SCHEME ->
                                            stage("${SCHEME}") {
                                                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                                    sh "TIMECMD=\"/usr/bin/time -v\" timeout 120 make SCHEME=${SCHEME} SRFI=${SRFI} test-r7rs-docker"
                                                }
                                            }
                                        }
                                    }
                                }
                        }
                    }
                }
            }
        }
    }
}

