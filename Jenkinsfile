pipeline {

    agent {
        label 'linux'
    }

    triggers{
        cron('0 1 * * *')
    }

    options {
        buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10'))
    }

    stages {
        stage("Prepare") {
            steps {
                sh "docker build --build-arg SCHEME=${SCHEME} --tag=r7rs-srfi-test-prepare -f Dockerfile.prepare ."
                sh "docker run -v ${WORKSPACE}:/workdir -w /workdir -t r7rs-srfi-test-prepare sh -c \"make srfi-test\""
            }
        }

        stage('Tests') {
            steps {
                script {
                    def implementations = sh(script: 'docker build -f Dockerfile.test . --tag=impls && docker run impls sh -c "compile-r7rs --list-r7rs-schemes"', returnStdout: true).split()
                    def srfis = sh(script: "cat srfis.scm | sed 's/(//' | sed 's/)//'", returnStdout: true).split()

                    parallel implementations.collectEntries { SCHEME ->
                        [(SCHEME): {
                                stage("${SCHEME} docker build") {
                                    sh "docker build --build-arg SCHEME=${SCHEME} --tag=r7rs-srfi-test-${SCHEME} -f Dockerfile.test ."
                                }
                                stage("${SCHEME} prepare") {
                                    sh "docker build --build-arg SCHEME=${SCHEME} --tag=r7rs-srfi-test-prepare -f Dockerfile.prepare ."
                                    sh "docker run -v ${WORKSPACE}:/workdir -w /workdir -t r7rs-srfi-test-prepare sh -c \"make srfi-test copy-tmp SCHEME=${SCHEME}\""
                                }
                                srfis.each { SRFI ->
                                    timeout(10) {
                                        stage("${SCHEME} ${SRFI}") {
                                            catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                                sh "docker run -v ${WORKSPACE}:/workdir -w /workdir -t r7rs-srfi-test-${SCHEME} sh -c \"make all install-jenkins SCHEME=${SCHEME} SRFI=${SRFI} test\""
                                            }
                                        }
                                    }
                                }
                            }
                        ]
                    }
                }
            }
        }
    }

    post {
        success {
            sh 'tar -czvf logs.tar.gz logs/*.log'
            archiveArtifacts('logs.tar.gz')
            sh 'make report'
            archiveArtifacts('report.html')
        }

        always {
            sh "docker build --tag=r7rs-srfi-test-clean -f Dockerfile.clean ."
            sh "docker run -v ${PWD}:/workdir -w /workdir -t r7rs-srfi-test-clean sh -c \"make clean clean-all\""
            deleteDir()
        }
    }
}

