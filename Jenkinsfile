pipeline {

    agent {
        dockerfile {
            filename 'Dockerfile.test'
            label 'podman'
            reuseNode true
        }
    }

    triggers {
        cron '0 22 * * *'
    }

    options {
        disableConcurrentBuilds()
        buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10'))
    }

    parameters {
        string(name: 'SRFIS', defaultValue: '1 2 4 5 8 11 14 16 19 27 31 37 38 39 41 42 43 44 48 51 54 60 63 64 69 87 95 11 113 115 116 128 145 180 197 227', description: 'SRFIs')
    }

    stages {

        stage('Clean and build testprograms') {
            steps {
                sh "rm -rf logs"
                    sh "rm -rf srfi-test"
                    sh "make srfi-test"
                    sh "cd srfi-test && chibi-scheme convert.scm"
            }
        }

        stage('Tests R7RS') {
            steps {
                script {
                    params.SRFIS.split().each { SRFI ->
                        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                            sh "timeout 600 make SRFI=${SRFI} test-srfi"
                        }
                    }
                }
            }
        }
    }
    post {
        success {
            archiveArtifacts artifacts: "out/tests/*/*.log", allowEmpty: true
        }
        always {
            cleanWs()
        }
    }
}
