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
        string(name: 'SRFIS', defaultValue: '1 2 4 5 8 11 14 39 41 60 64 69 145 180', description: 'Build SRFIs')
    }

    stages {

        stage('Init and warmup') {
            steps {
                sh "rm -rf srfi-test"
                sh "make srfi-test"
            }
        }

        stage('R6RS Tests') {
            steps {
                script {
                    def schemes = sh(script: 'compile-scheme --list-r6rs-schemes', returnStdout: true).split()
                    params.SRFIS.split().each { SRFI ->
                        stage("SRFI-${SRFI}") {
                            parallel schemes.collectEntries { SCHEME ->
                                [(SCHEME): {
                                    stage("${SCHEME}") {
                                        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                            sh "timeout 60 make SCHEME=${SCHEME} SRFI=${SRFI} test-r6rs-docker 2>&1 | tee output.txt"
                                            def failures = sh(script: 'grep --ignore-case "# of failures" output.txt || echo no', returnStdout: true)
                                            if (failures != "no") {
                                                currentStage.result = 'UNSTABLE'
                                            }
                                        }
                                    }
                                }]
                            }
                        }
                    }
                }
            }
        }

        stage('R7RS Tests') {
            steps {
                script {
                    def schemes = sh(script: 'compile-scheme --list-r7rs-schemes', returnStdout: true).split()
                    params.SRFIS.split().each { SRFI ->
                        stage("SRFI-${SRFI}") {
                            parallel schemes.collectEntries { SCHEME ->
                                [(SCHEME): {
                                    stage("${SCHEME}") {
                                        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                            sh "timeout 60 make SCHEME=${SCHEME} SRFI=${SRFI} test-r7rs-docker"
                                            def failures = sh(script: 'grep --ignore-case "# of failures" output.txt || echo no', returnStdout: true)
                                            if (failures != "no") {
                                                currentStage.result = 'UNSTABLE'
                                            }
                                        }
                                    }
                                }]
                            }
                        }
                    }
                }
            }
        }
    }
}

