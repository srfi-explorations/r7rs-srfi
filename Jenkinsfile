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

    stages {
        stage('Prepare') {
            steps {
                sh "cat srfis.scm | tr -d '()' > /tmp/srfis.txt"
                sh "docker build --build-arg IMAGE=chibi:head --build-arg SCHEME=chibi --tag=r7rs-srfi-prepare -f Dockerfile.test ."
                sh "docker run -v ${WORKSPACE}:/workdir -w /workdir -t r7rs-srfi-prepare sh -c \"rm -rf srfi-test && make srfi-test\""
            }
        }
        stage('Tests') {
            steps {
                script {
                    def implementations = sh(script: 'docker build -f Dockerfile.test . --tag=impls && docker run impls sh -c "compile-r7rs --list-r7rs-schemes | sed \'s/gambit//\' | xargs"', returnStdout: true).split()
                    def srfis = sh(script: "cat /tmp/srfis.txt | sed 's/13//'", returnStdout: true).split()

                    parallel implementations.collectEntries { SCHEME ->
                        [(SCHEME): {
                                srfis.each { srfi ->
                                    stage("${SCHEME} ${srfi}") {
                                        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                            def DOCKERIMG="${SCHEME}:head"
                                            if("${SCHEME}" == "chicken") {
                                                DOCKERIMG="chicken:5"
                                            }
                                            def MEMORY="1000MB"
                                            sh "docker build --build-arg IMAGE=${DOCKERIMG} --build-arg SCHEME=${SCHEME} --tag=r7rs-srfi-test-${SCHEME} -f Dockerfile.test ."
                                            sh "docker run --cpus=2 --memory=${MEMORY} --memory-swap=${MEMORY} --oom-kill-disable -v ${WORKSPACE}:/workdir -w /workdir -t r7rs-srfi-test-${SCHEME} sh -c \"timeout 3600 make SCHEME=${SCHEME} SRFI=${srfi} clean test && chmod -R 755 logs && chmod -R 755 tmp/${SCHEME}\""
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
                    def srfis = "13".split()

                    implementations.collectEntries { SCHEME ->
                        [(SCHEME): {
                                srfis.each { srfi ->
                                    stage("${SCHEME} ${srfi}") {
                                        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                            def DOCKERIMG="${SCHEME}:head"
                                            if("${SCHEME}" == "chicken") {
                                                DOCKERIMG="chicken:5"
                                            }
                                            if("${srfi}" == "13") {
                                                sh "docker build --build-arg IMAGE=${DOCKERIMG} --build-arg SCHEME=${SCHEME} --tag=r7rs-srfi-test-${SCHEME} -f Dockerfile.test ."
                                                sh "docker run -v ${WORKSPACE}:/workdir -w /workdir -t r7rs-srfi-test-${SCHEME} sh -c \"timeout 3600 make SCHEME=${SCHEME} SRFI=${srfi} clean test && chmod -R 755 logs && chmod -R 755 tmp/${SCHEME}\""
                                                sh "docker run -v ${WORKSPACE}:/workdir -w /workdir -t r7rs-srfi-test-${SCHEME} sh -c \"chmod -R 755 logs\""
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

        stage('Test Chicken 6') {
            steps {
                script {
                    def implementations = "chicken".split()
                    def srfis = sh(script: 'cat /tmp/srfis.txt', returnStdout: true).split()

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

