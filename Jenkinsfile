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
        stage('Init') {
            steps {
                sh "make srfi-test"
                sh "sh bats.sh"
            }
        }

        stage('Tests R7RS') {
            steps {
                script {
                    def schemes = readFile 'test_implementations.txt'
                    schemes.split().each { SCHEME ->
                        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                            stage("${SCHEME}") {
                                sh "make SRFI=64 SCHEME=${SCHEME} all install"
                                sh "make BATS_JOBS=8 SCHEME=${SCHEME} test-implementation"
                            }
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
