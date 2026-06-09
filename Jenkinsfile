pipeline {

    agent {
        dockerfile {
            filename 'Dockerfile.test'
            label 'podman'
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
                    'chibi chicken'.split().each { SCHEME ->
                        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                            stage("${SCHEME}") {
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
