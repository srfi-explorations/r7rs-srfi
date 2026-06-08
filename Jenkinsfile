pipeline {

    agent {
        dockerfile {
            filename 'Dockerfile.test'
            label 'docker-x86_64'
            args '--user=root'
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
                    def srfis = new File('test_srfis.txt').text

                    srfis.split().each { SRFI ->
                        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                            sh "make SRFI=${SRFI} test-srfi"
                        }
                    }
                }
            }
        }
    }
    post {
        success {
            archiveArtifacts artifacts: "out/tests/*/*.log", allowEmptyArchive: true
        }
        always {
            cleanWs()
        }
    }
}
