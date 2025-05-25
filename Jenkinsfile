pipeline {

    agent {
        dockerfile {
            filename 'Dockerfile.jenkins'
            args '--user=root --privileged -v /var/run/docker.sock:/var/run/docker.sock'
        }
    }

    triggers{
        cron('* 1 * * *')
    }

    options {
        buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10'))
    }

    parameters {
        choice(name: 'BUILD_IMPLEMENTATION',
               description: 'Build',
               choices: [
                 'all',
                 'chibi',
                 'chicken',
                 'cyclone',
                 'foment',
                 'gambit',
                 'gauche',
                 'guile',
                 'kawa',
                 'larceny',
                 'loko',
                 'mit-scheme',
                 'mosh',
                 'racket',
                 'sagittarius',
                 'stklos',
                 'skint',
                 'tr7',
                 'ypsilon',
               ])
    }

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

    post {
        success {
            sh 'tar -czvf logs.tar.gz logs/*.log'
            archiveArtifacts('logs.tar.gz')
            sh 'make report'
            archiveArtifacts('report.html')
        }
    }
}

