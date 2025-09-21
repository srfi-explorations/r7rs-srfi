pipeline {

    agent {
        dockerfile {
            label 'agent1'
            filename 'Dockerfile.jenkins'
            args '--user=root --privileged -v /var/run/docker.sock:/var/run/docker.sock'
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

        stage ('Init and warmup cache') {
            steps {
                sh "rm -rf srfi-test"
                sh "make srfi-test"
                sh "make SRFI=64 TIMEOUT=3 test-all"
            }
        }

        stage('Tests') {
            steps {
                script {
                    def srfis = sh(script: "cat srfis.scm | sed 's/(//' | sed 's/)//' | sed 's/13//'", returnStdout: true).split()

                    if("${params.ONLY_SRFI}" != "any") { srfis = ["${params.ONLY_SRFI}"] }
                    if("${params.ONLY_SRFI}" == "13") { srfis = [] }

                    parallel srfis.collectEntries { SRFI ->
                        [(SRFI): {
                                stage("${SRFI}") {
                                    catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                        sh "make SRFI=${SRFI} test-all > report-${SRFI}.md"
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
                            stage("13") {
                                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                    sh "make SRFI=13 test-all > report-${SRFI}.md"
                                }
                            }
                    }
                }
            }
        }
    }

    post {
        success {
            archiveArtifacts('report*.md')
        }
    }
}

