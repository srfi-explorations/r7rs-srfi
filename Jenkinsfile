pipeline {

    agent {
        dockerfile {
            label 'agent1'
            filename 'Dockerfile.jenkins'
            args '--user=root --privileged -v /var/run/docker.sock:/var/run/docker.sock'
            reuseNode true
        }
    }

    triggers {
        cron '5 4 * * *'
        GenericTrigger(
                    genericVariables: [
                    [key: 'ref', value: '$.ref']
                    ],

                    causeString: 'Triggered on $ref',

                    printContributedVariables: true,
                    printPostContent: true,

                    silentResponse: false,

                    shouldNotFlatten: false,

                    regexpFilterText: '$ref',
                    regexpFilterExpression: 'refs/heads/' + BRANCH_NAME)
    }

    options {
        disableConcurrentBuilds()
            buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10'))
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
                    def r6rs_schemes = readFile 'test_r6rs_schemes.txt'
                    def r7rs_schemes = readFile 'test_r7rs_schemes.txt'
                    def srfis = readFile 'test_srfis.txt'

                    srfis.split().each { SRFI ->
                        stage("SRFI-${SRFI} R6RS") {

                            r6rs_schemes.split().each { SCHEME ->
                                stage("${SCHEME}") {
                                    catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                        sh "timeout 600 make SCHEME=${SCHEME} RNRS=r6rs SRFI=${SRFI} test-docker"
                                    }
                                }
                            }
                        }
                        stage("SRFI-${SRFI} R7RS") {
                            r7rs_schemes.split().each { SCHEME ->
                                stage("${SCHEME}") {
                                    catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                        sh "timeout 600 make SCHEME=${SCHEME} RNRS=r7rs SRFI=${SRFI} test-docker"
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
        always {
            cleanWs()
        }
    }
}

