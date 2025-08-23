pipeline {

    agent {
        label 'linux'
    }

    triggers{
        cron('0 1 * * *')
    }

    options {
        disableConcurrentBuilds()
        buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10'))
    }

    stages {
        stage('Prepare') {
            steps {
                sh "cat srfis.scm | tr -d '()' | sed 's/gambit//' > /tmp/srfis.txt"
                sh "docker build --build-arg IMAGE=chibi:head --build-arg SCHEME=chibi --tag=r7rs-srfi-prepare -f Dockerfile.test ."
                sh "docker run -v ${WORKSPACE}:/workdir -w /workdir -t r7rs-srfi-prepare sh -c \"rm -rf srfi-test && make srfi-test\""
            }
        }
        stage('Tests') {
            steps {
                script {
                    def implementations = sh(script: 'docker build -f Dockerfile.test . --tag=impls && docker run impls sh -c "compile-r7rs --list-r7rs-schemes"', returnStdout: true).split()
                    def srfis = sh(script: 'cat /tmp/srfis.txt', returnStdout: true).split()

                    parallel implementations.collectEntries { SCHEME ->
                        [(SCHEME): {
                                srfis.each { srfi ->
                                    stage("${SCHEME} ${srfi}") {
                                        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                            if("${SCHEME}" == "chicken") {
                                                DOCKERIMG="chicken:5"
                                            } else {
                                                DOCKERIMG="${SCHEME}:head"
                                            }
                                            sh "docker build --build-arg IMAGE=${DOCKERIMG} --build-arg SCHEME=${SCHEME} --tag=r7rs-srfi-test-${SCHEME} -f Dockerfile.test ."
                                            sh "docker run -v ${WORKSPACE}:/workdir -w /workdir -t r7rs-srfi-test-${SCHEME} sh -c \"timeout 60 make SCHEME=${SCHEME} SRFI=${srfi} clean test && chmod -R 755 logs && chmod -R 755 tmp/${SCHEME}\""
                                        }
                                    }
                                }
                            }
                        ]
                    }
                }
            }
        }

        stage("Report") {
            steps {
                sh "sh scripts/report.sh > report.html"
            }
        }
    }

    post {
        success {
            sh 'tar -czvf logs.tar.gz logs/*.log'
            archiveArtifacts('logs.tar.gz')
            archiveArtifacts('report.html')
        }
    }
}

