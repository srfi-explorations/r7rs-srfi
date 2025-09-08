pipeline {

    agent {
        label 'agent1'
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
        stage('Prepare') {
            steps {
                sh "cat srfis.scm | tr -d '()' > /tmp/srfis.txt"
                sh "docker build --build-arg IMAGE=gauche:head --build-arg SCHEME=gauche --tag=r7rs-srfi-prepare -f Dockerfile.test ."
                sh "docker run -v ${WORKSPACE}:/workdir -w /workdir -t r7rs-srfi-prepare sh -c \"rm -rf srfi-test && make srfi-test\""
            }
        }
        stage('Tests') {
            steps {
                script {
                    def implementations = sh(script: 'docker build -f Dockerfile.test . --tag=impls && docker run impls sh -c "compile-r7rs --list-r7rs-schemes | sed \'s/gambit//\' | xargs"', returnStdout: true).split()
                    def srfis = sh(script: "cat /tmp/srfis.txt | sed 's/13//'", returnStdout: true).split()

                    if("${params.ONLY_SRFI}" != "any") {
                        srfis = ["${params.ONLY_SRFI}"]
                    }

                    parallel implementations.collectEntries { SCHEME ->
                        [(SCHEME): {
                                srfis.each { srfi ->
                                    stage("${SCHEME} ${srfi}") {
                                        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                            def DOCKERIMG="${SCHEME}:head"

                                            if("${SCHEME}" == "chicken") {
                                                DOCKERIMG="chicken:5"
                                            }

                                            sh "docker build --build-arg IMAGE=${DOCKERIMG} --build-arg SCHEME=${SCHEME} --tag=r7rs-srfi-test-${SCHEME} -f Dockerfile.test ."
                                            sh "docker run -v ${WORKSPACE}:/workdir -w /workdir -t r7rs-srfi-test-${SCHEME} sh -c \"timeout 3600 make SCHEME=${SCHEME} SRFI=${srfi} clean test && chmod -R 755 logs && chmod -R 755 tmp/${SCHEME}\""
                                            sh "docker run -v ${WORKSPACE}:/workdir -w /workdir -t r7rs-srfi-test-${SCHEME} sh -c \"chmod -R 755 logs\""
                                        }
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
                    def implementations = sh(script: 'docker build -f Dockerfile.test . --tag=impls && docker run impls sh -c "compile-r7rs --list-r7rs-schemes | sed \'s/gambit//\' | xargs"', returnStdout: true).split()
                    def srfis = ["13"]

                    if("${params.ONLY_SRFI}" != "any" && "${params.ONLY_SRFI}" == "13") {
                        srfis = ["13"]
                    } else {
                        srfis = []
                    }

                    implementations.collectEntries { SCHEME ->
                        [(SCHEME): {
                                srfis.each { srfi ->
                                    stage("${SCHEME} ${srfi}") {
                                        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                            def DOCKERIMG="${SCHEME}:head"
                                            if("${SCHEME}" == "chicken") {
                                                DOCKERIMG="chicken:5"
                                            }
                                            sh "docker build --build-arg IMAGE=${DOCKERIMG} --build-arg SCHEME=${SCHEME} --tag=r7rs-srfi-test-${SCHEME} -f Dockerfile.test ."
                                            sh "docker run -v ${WORKSPACE}:/workdir -w /workdir -t r7rs-srfi-test-${SCHEME} sh -c \"timeout 3600 make SCHEME=${SCHEME} SRFI=${srfi} clean test && chmod -R 755 logs && chmod -R 755 tmp/${SCHEME}\""
                                            sh "docker run -v ${WORKSPACE}:/workdir -w /workdir -t r7rs-srfi-test-${SCHEME} sh -c \"chmod -R 755 logs\""
                                        }
                                    }
                                }
                            }
                        ]
                    }
                }
            }
        }

        stage('Test Chicken 6') {
            steps {
                script {
                    def implementations = "chicken".split()
                    def srfis = sh(script: 'cat /tmp/srfis.txt', returnStdout: true).split()

                    if("${params.ONLY_SRFI}" != "any") {
                        srfis = ["${params.ONLY_SRFI}"]
                    }

                    implementations.collectEntries { SCHEME ->
                        [(SCHEME): {
                                srfis.each { srfi ->
                                    stage("${SCHEME} ${srfi}") {
                                        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                            def DOCKERIMG="${SCHEME}:head"
                                            sh "docker build --build-arg IMAGE=${DOCKERIMG} --build-arg SCHEME=${SCHEME} --tag=r7rs-srfi-test-chicken6 -f Dockerfile.test ."
                                            sh "docker run -v ${WORKSPACE}:/workdir -w /workdir -t r7rs-srfi-test-chicken6 sh -c \"timeout 3600 make SCHEME=chicken6 SRFI=${srfi} clean test-chicken6 && chmod -R 755 logs && chmod -R 755 tmp/chicken6\""
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

