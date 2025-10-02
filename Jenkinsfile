pipeline {

    agent {
        label 'docker-x86_64'
    }

    triggers{
        cron('0 1 * * *')
    }

    options {
        disableConcurrentBuilds()
            buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10'))
    }

    parameters {
        string(name: 'SRFIS', defaultValue: '2 4 5 8 11 14 39 60 64 69', description: 'Build SRFIs')
    }

    stages {
        stage('Tests') {
            steps {
                def schemes = sh(script: 'docker run retropikzel1/compile-r7rs bash -c "compile-r7rs --list-r7rs-schemes"', returnStdout: true).split()
                script {
                    params.SRFIS.split().each { SRFI ->
                        schemes.each { SCHEME ->
                            stage("${SCHEME} ${SRFI}") {
                                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                                    sh "make SCHEME=${SCHEME} SRFI=${SRFI} test"
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

