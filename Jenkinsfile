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
            when { expression { params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == "${STAGE_NAME}" } }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh "make clean-all COMPILE_R7RS=${STAGE_NAME} test-compile-r7rs-docker-all"
                    archiveArtifacts artifacts: "tmp/*.log"
                }
            }
        }

        stage("chicken") {
            when { expression { params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == "${STAGE_NAME}" } }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh "make clean-all COMPILE_R7RS=${STAGE_NAME} test-compile-r7rs-docker-all"
                    archiveArtifacts artifacts: "tmp/*.log"
                }
            }
        }

        stage("cyclone") {
            when { expression { params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == "${STAGE_NAME}" } }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh "make clean-all COMPILE_R7RS=${STAGE_NAME} test-compile-r7rs-docker-all"
                    archiveArtifacts artifacts: "tmp/*.log"
                }
            }
        }

        stage("gambit") {
            when { expression { params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == "${STAGE_NAME}" } }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh "make clean-all COMPILE_R7RS=${STAGE_NAME} test-compile-r7rs-docker-all"
                    archiveArtifacts artifacts: "tmp/*.log"
                }
            }
        }

        stage("foment") {
            when { expression { params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == "${STAGE_NAME}" } }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh "make clean-all COMPILE_R7RS=${STAGE_NAME} test-compile-r7rs-docker-all"
                    archiveArtifacts artifacts: "tmp/*.log"
                }
            }
        }

        stage("gauche") {
            when { expression { params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == "${STAGE_NAME}" } }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh "make clean-all COMPILE_R7RS=${STAGE_NAME} test-compile-r7rs-docker-all"
                    archiveArtifacts artifacts: "tmp/*.log"
                }
            }
        }

        stage("guile") {
            when { expression { params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == "${STAGE_NAME}" } }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh "make clean-all COMPILE_R7RS=${STAGE_NAME} test-compile-r7rs-docker-all"
                    archiveArtifacts artifacts: "tmp/*.log"
                }
            }
        }

        stage("kawa") {
            when { expression { params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == "${STAGE_NAME}" } }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh "make clean-all COMPILE_R7RS=${STAGE_NAME} test-compile-r7rs-docker-all"
                    archiveArtifacts artifacts: "tmp/*.log"
                }
            }
        }

        stage("larceny") {
            when { expression { params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == "${STAGE_NAME}" } }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh "make clean-all COMPILE_R7RS=${STAGE_NAME} test-compile-r7rs-docker-all"
                    archiveArtifacts artifacts: "tmp/*.log"
                }
            }
        }

        stage("loko") {
            when { expression { params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == "${STAGE_NAME}" } }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh "make clean-all COMPILE_R7RS=${STAGE_NAME} test-compile-r7rs-docker-all"
                    archiveArtifacts artifacts: "tmp/*.log"
                }
            }
        }

        stage("mit-scheme") {
            when { expression { params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == "${STAGE_NAME}" } }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh "make clean-all COMPILE_R7RS=${STAGE_NAME} test-compile-r7rs-docker-all"
                    archiveArtifacts artifacts: "tmp/*.log"
                }
            }
        }

        stage("mosh") {
            when { expression { params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == "${STAGE_NAME}" } }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh "make clean-all COMPILE_R7RS=${STAGE_NAME} test-compile-r7rs-docker-all"
                    archiveArtifacts artifacts: "tmp/*.log"
                }
            }
        }

        stage("racket") {
            when { expression { params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == "${STAGE_NAME}" } }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh "make clean-all COMPILE_R7RS=${STAGE_NAME} test-compile-r7rs-docker-all"
                    archiveArtifacts artifacts: "tmp/*.log"
                }
            }
        }

        stage("sagittarius") {
            when { expression { params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == "${STAGE_NAME}" } }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh "make clean-all COMPILE_R7RS=${STAGE_NAME} test-compile-r7rs-docker-all"
                    archiveArtifacts artifacts: "tmp/*.log"
                }
            }
        }

        stage("skint") {
            when { expression { params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == "${STAGE_NAME}" } }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh "make clean-all COMPILE_R7RS=${STAGE_NAME} test-compile-r7rs-docker-all"
                    archiveArtifacts artifacts: "tmp/*.log"
                }
            }
        }

        stage("stklos") {
            when { expression { params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == "${STAGE_NAME}" } }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh "make clean-all COMPILE_R7RS=${STAGE_NAME} test-compile-r7rs-docker-all"
                    archiveArtifacts artifacts: "tmp/*.log"
                }
            }
        }

        stage("tr7") {
            when { expression { params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == "${STAGE_NAME}" } }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh "make clean-all COMPILE_R7RS=${STAGE_NAME} test-compile-r7rs-docker-all"
                    archiveArtifacts artifacts: "tmp/*.log"
                }
            }
        }

        stage("ypsilon") {
            when { expression { params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == "${STAGE_NAME}" } }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh "make clean-all COMPILE_R7RS=${STAGE_NAME} test-compile-r7rs-docker-all"
                    archiveArtifacts artifacts: "tmp/*.log"
                }
            }
        }

    }
}

