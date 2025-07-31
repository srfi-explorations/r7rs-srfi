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
        stage('Prepare') {
            steps {
                sh "cat srfis.scm | sed 's/(//' | sed 's/)//' > /tmp/srfis.txt"
            }
        }
        stage('Tests') {
            steps {
                script {
                    def implementations = sh(script: 'docker build -f Dockerfile.test . --tag=impls && docker run impls sh -c "compile-r7rs --list-r7rs-schemes"', returnStdout: true).split()
                    def srfis = sh(script: 'cat /tmp/srfis.txt', returnStdout: true).split()

                    parallel implementations.collectEntries { implementation->
                        [(implementation): {
                                srfis.each { srfi ->
                                    stage("${implementation} ${srfi}") {
                                        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                            if("${implementation}" == "chicken") {
                                                DOCKERIMG="chicken:5"
                                            } else {
                                                DOCKERIMG="${implementation}:head"
                                            }
                                            sh "docker build --build-arg IMAGE=${DOCKERIMG} --build-arg SCHEME=${implementation} --tag=r7rs-srfi-test-${implementation} -f Dockerfile.test ."
                                            sh "docker run -v ${WORKSPACE}:/workdir -w /workdir -t r7rs-srfi-test-${implementation} sh -c \"timeout 600 make SCHEME=${implementation} SRFI=${srfi} clean package force-install test && chmod -R 755 logs && chmod -R 755 tmp\""
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
    }
}

