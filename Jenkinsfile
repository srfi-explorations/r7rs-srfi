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
        stage('Init') {
            steps {
                sh 'echo "deb https://mirror.hetzner.com/debian/packages  trixie" > /etc/apt/sources.list.d/hetzner-mirror.list'
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
