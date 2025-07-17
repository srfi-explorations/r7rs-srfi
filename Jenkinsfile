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
                sh "cat srfis.scm | sed 's/(//' | sed 's/)//' > /tmp/srfis1.txt"
                sh "printf '64 ' > /tmp/srfis.txt"
                sh "cat /tmp/srfis1.txt >> /tmp/srfis.txt"
                sh "cat /tmp/srfis.txt"
            }
        }
        stage('Tests') {
            steps {
                script {
                    def implementations = sh(script: 'docker build -f Dockerfile.test . --tag=impls && docker run impls sh -c "compile-r7rs --list-r7rs-schemes"', returnStdout: true).split()
                    def srfis = sh(script: 'cat /tmp/r7rs-srfi-srfis.txt', returnStdout: true).split()

                    parallel implementations.collectEntries { implementation->
                        [(implementation): {
                                srfis.each { srfi ->
                                    stage("${implementation} ${srfi}") {
                                        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                            sh "docker build --build-arg SCHEME=${implementation} --tag=r7rs-srfi-test-${implementation} -f Dockerfile.test ."
                                            sh "docker run -v ${WORKSPACE}:/workdir -w /workdir -t r7rs-srfi-test-${implementation} sh -c \"make clean && sleep 5 && make SCHEME=${implementation} SRFI=${srfi} test\""
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

    /*
    stages {

        stage("chibi") {
            when { anyOf { expression { params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == "${STAGE_NAME}" && env.BRANCH_NAME }; branch 'main' } }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh "make clean-all COMPILE_R7RS=${STAGE_NAME} test-compile-r7rs-docker-all"
                }
            }
        }

        stage("chicken") {
            when { anyOf { expression { params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == "${STAGE_NAME}" && env.BRANCH_NAME }; branch 'main' } }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh "make clean-all COMPILE_R7RS=${STAGE_NAME} test-compile-r7rs-docker-all"
                }
            }
        }

        stage("cyclone") {
            when { anyOf { expression { params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == "${STAGE_NAME}" && env.BRANCH_NAME }; branch 'main' } }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh "make clean-all COMPILE_R7RS=${STAGE_NAME} test-compile-r7rs-docker-all"
                }
            }
        }

        stage("foment") {
            when { anyOf { expression { params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == "${STAGE_NAME}" && env.BRANCH_NAME }; branch 'main' } }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh "make clean-all COMPILE_R7RS=${STAGE_NAME} test-compile-r7rs-docker-all"
                }
            }
        }

        stage("gauche") {
            when { anyOf { expression { params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == "${STAGE_NAME}" && env.BRANCH_NAME }; branch 'main' } }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh "make clean-all COMPILE_R7RS=${STAGE_NAME} test-compile-r7rs-docker-all"
                }
            }
        }

        stage("guile") {
            when { anyOf { expression { params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == "${STAGE_NAME}" && env.BRANCH_NAME }; branch 'main' } }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh "make clean-all COMPILE_R7RS=${STAGE_NAME} test-compile-r7rs-docker-all"
                }
            }
        }

        stage("kawa") {
            when { anyOf { expression { params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == "${STAGE_NAME}" && env.BRANCH_NAME }; branch 'main' } }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh "make clean-all COMPILE_R7RS=${STAGE_NAME} test-compile-r7rs-docker-all"
                }
            }
        }

        stage("larceny") {
            when { anyOf { expression { params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == "${STAGE_NAME}" && env.BRANCH_NAME }; branch 'main' } }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh "make clean-all COMPILE_R7RS=${STAGE_NAME} test-compile-r7rs-docker-all"
                }
            }
        }

        stage("loko") {
            when { anyOf { expression { params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == "${STAGE_NAME}" && env.BRANCH_NAME }; branch 'main' } }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh "make clean-all COMPILE_R7RS=${STAGE_NAME} test-compile-r7rs-docker-all"
                }
            }
        }

        stage("mit-scheme") {
            when { anyOf { expression { params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == "${STAGE_NAME}" && env.BRANCH_NAME }; branch 'main' } }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh "make clean-all COMPILE_R7RS=${STAGE_NAME} test-compile-r7rs-docker-all"
                }
            }
        }

        stage("mosh") {
            when { anyOf { expression { params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == "${STAGE_NAME}" && env.BRANCH_NAME }; branch 'main' } }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh "make clean-all COMPILE_R7RS=${STAGE_NAME} test-compile-r7rs-docker-all"
                }
            }
        }

        stage("racket") {
            when { anyOf { expression { params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == "${STAGE_NAME}" && env.BRANCH_NAME }; branch 'main' } }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh "make clean-all COMPILE_R7RS=${STAGE_NAME} test-compile-r7rs-docker-all"
                }
            }
        }

        stage("sagittarius") {
            when { anyOf { expression { params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == "${STAGE_NAME}" && env.BRANCH_NAME }; branch 'main' } }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh "make clean-all COMPILE_R7RS=${STAGE_NAME} test-compile-r7rs-docker-all"
                }
            }
        }

        stage("skint") {
            when { anyOf { expression { params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == "${STAGE_NAME}" && env.BRANCH_NAME }; branch 'main' } }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh "make clean-all COMPILE_R7RS=${STAGE_NAME} test-compile-r7rs-docker-all"
                }
            }
        }

        stage("stklos") {
            when { anyOf { expression { params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == "${STAGE_NAME}" && env.BRANCH_NAME }; branch 'main' } }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh "make clean-all COMPILE_R7RS=${STAGE_NAME} test-compile-r7rs-docker-all"
                }
            }
        }

        stage("tr7") {
            when { anyOf { expression { params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == "${STAGE_NAME}" && env.BRANCH_NAME }; branch 'main' } }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh "make clean-all COMPILE_R7RS=${STAGE_NAME} test-compile-r7rs-docker-all"
                }
            }
        }

        stage("ypsilon") {
            when { anyOf { expression { params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == "${STAGE_NAME}" && env.BRANCH_NAME }; branch 'main' } }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh "make clean-all COMPILE_R7RS=${STAGE_NAME} test-compile-r7rs-docker-all"
                }
            }
        }

    }
    */

    post {
        success {
            sh 'tar -czvf logs.tar.gz logs/*.log'
            archiveArtifacts('logs.tar.gz')
            sh 'make report'
            archiveArtifacts('report.html')
        }
    }
}

