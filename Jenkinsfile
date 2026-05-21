pipeline {

    agent {
        label 'guix-x86_64'
    }

    options {
        disableConcurrentBuilds()
        buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10'))
    }

    parameters {
        string(name: 'R6RS_SCHEMES', defaultValue: 'chezscheme ikarus ironscheme sagittarius', description: 'Test SRFIs')
        string(name: 'R7RS_SCHEMES', defaultValue: 'chibi foment gauche gambit kawa loko meevax mit-scheme mosh racket sagittarius skint stklos tr7 ypsilon', description: 'Test SRFIs')
        string(name: 'SRFIS', defaultValue: '2 8 11 19 27 28 39 60 64 69 145 180', description: 'Test SRFIs')
    }

    environment {
        LD_LIBRARY_PATH=".tools/lib:"
        DYLD_LIBRARY_PATH=".tools/lib:"
        CHIBI_MODULE_PATH=".tools/share/chibi:.tools/lib/chibi"
        PATH=".tools/bin:${PATH}"
    }

    stages {

        stage('Install tools') {
            steps {
                sh "rm -rf chibi-scheme"
                sh "guix shell git -- git clone https://github.com/ashinn/chibi-scheme.git --depth=1"
                sh "guix shell gcc-toolchain libffi -- sh -c 'make -C chibi-scheme CC=gcc PREFIX=.tools && make -C chibi-scheme CC=gcc PREFIX=.tools install && snow-chibi install --impls=chibi --install-prefix=.tools --always-yes retropikzel.test-r7rs'"
            }
        }

        stage('Clean and build testprograms') {
            steps {
                sh "rm -rf logs"
                sh "rm -rf srfi-test"
                sh "make srfi-test"
                sh "cd srfi-test && guix shell chibi-scheme -- chibi-scheme convert.scm"
            }
        }

        stage('Tests') {
            steps {
                script {
                    params.SRFIS.split().each { SRFI ->
                        stage("SRFI-${SRFI} R6RS") {
                            params.R6RS_SCHEMES.split().each { SCHEME ->
                                stage("${SCHEME}") {
                                    catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                        sh "PATH=./tools/bin:${PATH} make SCHEME=${SCHEME} RNRS=r6rs SRFI=${SRFI} test-docker"
                                        archiveArtifacts artifacts: 'logs/**/*.log', fingerprint: true, allowEmptyArchive: true
                                        sh "rm -rf logs"
                                    }
                                }
                            }
                        }
                        stage("SRFI-${SRFI} R7RS") {
                            params.R7RS_SCHEMES.split().each { SCHEME ->
                                stage("${SCHEME}") {
                                    catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                        sh "PATH=./tools/bin:${PATH} make SCHEME=${SCHEME} RNRS=r7rs SRFI=${SRFI} test-docker"
                                        archiveArtifacts artifacts: 'logs/**/*.log', fingerprint: true, allowEmptyArchive: true
                                        sh "rm -rf logs"
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
