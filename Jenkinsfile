pipeline {

    agent {
        dockerfile {
            filepath 'Dockerfile.jenkins'
        }
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
                 'loko-compiler',
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
            steps { catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') { sh 'make COMPILE_R7RS=${STAGE_NAME} test-all-compile-r7rs-docker' } }
        }
        stage("chicken") {
            when { expression { params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == "${STAGE_NAME}" } }
            steps { catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') { sh 'make COMPILE_R7RS=${STAGE_NAME} test-all-compile-r7rs-docker' } }
        }
        stage("sagittarius") {
            when { expression { params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == "${STAGE_NAME}" } }
            steps { catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') { sh 'make COMPILE_R7RS=${STAGE_NAME} test-all-compile-r7rs-docker' } }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: 'tmp/*.log', fingerprint: true
        }
    }

}

