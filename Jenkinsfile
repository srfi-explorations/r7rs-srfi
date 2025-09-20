pipeline {

    agent {
        docker {
            image 'docker:dind-rootless'
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
        string(name: 'ONLY_SRFI', defaultValue: 'any', description: 'Build only SRFI number')
    }

    stages {
        stage('Tests') {
            steps {
                script {
                    def implementations = sh(script: 'docker run retropikzel1/compile-r7rs sh -c "compile-r7rs --list-r7rs-schemes"', returnStdout: true).split()
                    def srfis = sh(script: "cat /tmp/srfis.txt | sed 's/(//' | sed 's/)//' | sed 's/13//'", returnStdout: true).split()

                    if("${params.ONLY_SRFI}" != "any") { srfis = ["${params.ONLY_SRFI}"] }
                    if("${params.ONLY_SRFI}" == "13") { srfis = [] }

                    parallel implementations.collectEntries { SCHEME ->
                        [(SCHEME): {
                                srfis.each { SRFI ->
                                    stage("${SCHEME} ${SRFI}") {
                                        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                            sh "make clean"
                                            sh "COMPILE_R7RS=${SCHEME} test-r7rs --use-docker-heads -A . -o .make/test-${SRFI} srfi-test/r7rs-programs/${SRFI}.scm >> report.md"
                                        }
                                    }
                                }
                            }
                        ]
                    }
                }
            }
        }

        stage('Test SRFI-13') {
            steps {
                script {
                    if("${params.ONLY_SRFI}" == "any" || "${params.ONLY_SRFI}" == "13") {
                        def implementations = sh(script: 'docker run retropikzel1/compile-r7rs sh -c "compile-r7rs --list-r7rs-schemes"', returnStdout: true).split()
                        def srfis = sh(script: "cat /tmp/srfis.txt | sed 's/(//' | sed 's/)//' | sed 's/13//'", returnStdout: true).split()
                        def SRFI="13"

                        implementations.each { SCHEME ->
                            stage("${SCHEME} 13") {
                                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                    sh "make clean"
                                    sh "COMPILE_R7RS=${SCHEME} test-r7rs --use-docker-heads -A . -o .make/test-${SRFI} srfi-test/r7rs-programs/${SRFI}.scm >> report.md"
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
            archiveArtifacts('report.md')
        }
    }
}

