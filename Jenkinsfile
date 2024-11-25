pipeline {

    agent {
        dockerfile {
            filename 'Dockerfile.jenkins'
            dir '.'
            args '--privileged -v /var/run/docker.sock:/var/run/docker.sock'
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
                 'gambit',
                 'gauche',
                 'guile',
                 'kawa',
                 'loko',
                 'mit-scheme',
                 'sagittarius',
                 'stklos',
                 'skint',
                 'tr7',
               ])
    }

    stages {

        stage("Init") {
            steps {
                sh 'sh jenkins_scripts/init.sh'
                stash name: 'reports', includes: 'reports/*'
                stash name: 'tests', includes: 'srfi-test/*'
            }
        }

        stage("chibi") {
            agent {
                docker {
                    image 'schemers/chibi:latest'
                    reuseNode true
                    args '--user=root'
                }
            }
            when {
                expression {
                    params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == 'chibi'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'apt update && apt install -y make'
                    sh './jenkins_scripts/clean.sh'
                    unstash 'tests'
                    sh './jenkins_scripts/test.sh "chibi" "chibi-scheme -I ." "" 8 1 26 28 64 '
                    archiveArtifacts artifacts: 'reports/*.log'
                    sh 'rm -rf *.log'
                }
            }
        }

        stage("chicken") {
            agent {
                docker {
                    image 'schemers/chicken:latest'
                    reuseNode true
                    args '--user=root'
                }
            }
            when {
                expression {
                    params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == 'chicken'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'apt update && apt install -y make'
                    sh './jenkins_scripts/clean.sh'
                    unstash 'tests'
                    sh './jenkins_scripts/test.sh "chicken" "csc -include-path ./srfi -X r7rs -R r7rs" "csc -include-path ./srfi -X r7rs -R r7rs -s -J" 8 1 26 28 64 '
                    archiveArtifacts artifacts: 'reports/*.log'
                    sh 'rm -rf *.log'
                }
            }
        }

        stage("cyclone") {
            agent {
                docker {
                    image 'schemers/cyclone:latest'
                    reuseNode true
                    args '--user=root'
                }
            }
            when {
                expression {
                    params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == 'cyclone'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'apt update && apt install -y make'
                    sh './jenkins_scripts/clean.sh'
                    unstash 'tests'
                    sh './jenkins_scripts/test.sh "cyclone" "cyclone -I ." "cyclone -I ." 8 1 26 28 64 '
                    archiveArtifacts artifacts: 'reports/*.log'
                    sh 'rm -rf *.log'
                }
            }
        }

        stage("foment") {
            agent {
                docker {
                    image 'schemers/foment:latest'
                    reuseNode true
                    args '--user=root'
                }
            }
            when {
                expression {
                    params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == 'foment'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'apt update && apt install -y make'
                    sh './jenkins_scripts/clean.sh'
                    unstash 'tests'
                    sh './jenkins_scripts/test.sh "foment" "foment -I --load" "" 8 1 26 28 64 '
                    archiveArtifacts artifacts: 'reports/*.log'
                    sh 'rm -rf *.log'
                }
            }
        }

        stage("gambit") {
            agent {
                docker {
                    image 'schemers/gambit:latest'
                    reuseNode true
                    args '--user=root'
                }
            }
            when {
                expression {
                    params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == 'gambit'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'apt update && apt install -y make'
                    sh './jenkins_scripts/clean.sh'
                    unstash 'tests'
                    sh './jenkins_scripts/test.sh "gambit" "gsc -exe ./ -nopreload" "gsc -:search=." 8 1 26 28 64 '
                    archiveArtifacts artifacts: 'reports/*.log'
                    sh 'rm -rf *.log'
                }
            }
        }

        stage("gauche") {
            agent {
                docker {
                    image 'schemers/gauche:latest'
                    reuseNode true
                    args '--user=root'
                }
            }
            when {
                expression {
                    params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == 'gauche'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'apt update && apt install -y make'
                    sh './jenkins_scripts/clean.sh'
                    unstash 'tests'
                    sh './jenkins_scripts/test.sh "gauche" "gosh -r7 -I ." "" 8 1 26 28 64 '
                    archiveArtifacts artifacts: 'reports/*.log'
                    sh 'rm -rf *.log'
                }
            }
        }

        stage("gerbil") {
            agent {
                docker {
                    image 'schemers/gerbil:latest'
                    reuseNode true
                    args '--user=root'
                }
            }
            when {
                expression {
                    params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == 'gerbil'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'apt update && apt install -y make'
                    sh './jenkins_scripts/clean.sh'
                    unstash 'tests'
                    sh './jenkins_scripts/test.sh "gerbil" "gxi --lang r7rs" "gxc -O" 8 1 26 28 64 '
                    archiveArtifacts artifacts: 'reports/*.log'
                    sh 'rm -rf *.log'
                }
            }
        }

        stage("guile") {
            agent {
                docker {
                    image 'schemers/guile:latest'
                    reuseNode true
                    args '--user=root'
                }
            }
            when {
                expression {
                    params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == 'guile'
                }
            }
==== BASE ====
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'apt update && apt install -y make'
                    sh './jenkins_scripts/clean.sh'
                    unstash 'tests'
                    sh './jenkins_scripts/test.sh "guile" "guile --fresh-auto-compile --r7rs -L ." "" 8 1 26 28 64 '
                    archiveArtifacts artifacts: 'reports/*.log'
                    sh 'rm -rf *.log'
                }
            }
        }

        stage("kawa") {
            agent {
                docker {
                    image 'schemers/kawa:latest'
                    reuseNode true
                    args '--user=root'
                }
            }
            when {
                expression {
                    params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == 'kawa'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'apt update && apt install -y make'
                    sh './jenkins_scripts/clean.sh'
                    unstash 'tests'
                    sh './jenkins_scripts/test.sh "kawa" "kawa --r7rs -Dkawa.import.path=." "" 8 1 26 28 64 '
                    archiveArtifacts artifacts: 'reports/*.log'
                    sh 'rm -rf *.log'
                }
            }
        }

        stage("larceny") {
            agent {
                docker {
                    image 'schemers/larceny:latest'
                    reuseNode true
                    args '--user=root'
                }
            }
            when {
                expression {
                    params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == 'larceny'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'apt update && apt install -y make'
                    sh './jenkins_scripts/clean.sh'
                    unstash 'tests'
                    sh './jenkins_scripts/test.sh "larceny" "larceny -r7 -I ." "" 8 1 26 28 64 '
                    archiveArtifacts artifacts: 'reports/*.log'
                    sh 'rm -rf *.log'
                }
            }
        }

        stage("loko") {
            agent {
                docker {
                    image 'schemers/loko:latest'
                    reuseNode true
                    args '--user=root'
                }
            }
            when {
                expression {
                    params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == 'loko'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'apt update && apt install -y make'
                    sh './jenkins_scripts/clean.sh'
                    unstash 'tests'
                    sh './jenkins_scripts/test.sh "loko" "loko -std=r7rs --compile" "ls" 8 1 26 28 64 '
                    archiveArtifacts artifacts: 'reports/*.log'
                    sh 'rm -rf *.log'
                }
            }
        }

        stage("mit-scheme") {
            agent {
                docker {
                    image 'schemers/mit-scheme:latest'
                    reuseNode true
                    args '--user=root'
                }
            }
            when {
                expression {
                    params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == 'mit-scheme'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'apt update && apt install -y make'
                    sh './jenkins_scripts/clean.sh'
                    unstash 'tests'
                    sh './jenkins_scripts/test.sh "mit-scheme" "mit-scheme --load" "" 8 1 26 28 64 '
                    archiveArtifacts artifacts: 'reports/*.log'
                    sh 'rm -rf *.log'
                }
            }
        }

        stage("mosh") {
            agent {
                docker {
                    image 'schemers/mosh:latest'
                    reuseNode true
                    args '--user=root'
                }
            }
            when {
                expression {
                    params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == 'mosh'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'apt update && apt install -y make'
                    sh './jenkins_scripts/clean.sh'
                    unstash 'tests'
                    sh './jenkins_scripts/test.sh "mosh" "mosh --loadpath=." "" 8 1 26 28 64 '
                    archiveArtifacts artifacts: 'reports/*.log'
                    sh 'rm -rf *.log'
                }
            }
        }

        stage("racket") {
            agent {
                docker {
                    image 'schemers/racket:latest'
                    reuseNode true
                    args '--user=root'
                }
            }
            when {
                expression {
                    params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == 'racket'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'apt update && apt install -y make'
                    sh './jenkins_scripts/clean.sh'
                    unstash 'tests'
                    sh './jenkins_scripts/test.sh "racket" "racket -I r7rs -S . --script" "" 8 1 26 28 64 '
                    archiveArtifacts artifacts: 'reports/*.log'
                    sh 'rm -rf *.log'
                }
            }
        }

        stage("sagittarius") {
            agent {
                docker {
                    image 'schemers/sagittarius:latest'
                    reuseNode true
                    args '--user=root'
                }
            }
            when {
                expression {
                    params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == 'sagittarius'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'apt update && apt install -y make'
                    sh './jenkins_scripts/clean.sh'
                    unstash 'tests'
                    sh './jenkins_scripts/test.sh "sagittarius" "sash -r7 -L . -L ./srfi" "" 8 1 26 28 64 '
                    archiveArtifacts artifacts: 'reports/*.log'
                    sh 'rm -rf *.log'
                }
            }
        }

        stage("stklos") {
            agent {
                docker {
                    image 'schemers/stklos:latest'
                    reuseNode true
                    args '--user=root'
                }
            }
            when {
                expression {
                    params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == 'stklos'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'apt update && apt install -y make'
                    sh './jenkins_scripts/clean.sh'
                    unstash 'tests'
                    sh './jenkins_scripts/test.sh "stklos" "stklos -I . -I ./srfi -f" "" 8 1 26 28 64 '
                    archiveArtifacts artifacts: 'reports/*.log'
                    sh 'rm -rf *.log'
                }
            }
        }

        stage("skint") {
            agent {
                docker {
                    image 'schemers/skint:latest'
                    reuseNode true
                    args '--user=root'
                }
            }
            when {
                expression {
                    params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == 'skint'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'apt update && apt install -y make'
                    sh './jenkins_scripts/clean.sh'
                    unstash 'tests'
                    sh './jenkins_scripts/test.sh "skint" "skint -I ./" "" 8 1 26 28 64 '
                    archiveArtifacts artifacts: 'reports/*.log'
                    sh 'rm -rf *.log'
                }
            }
        }

        stage("tr7") {
            agent {
                docker {
                    image 'schemers/tr7:latest'
                    reuseNode true
                    args '--user=root'
                }
            }
            when {
                expression {
                    params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == 'tr7'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'apt update && apt install -y make'
                    sh './jenkins_scripts/clean.sh'
                    unstash 'tests'
                    sh './jenkins_scripts/test.sh "tr7" "tr7i" "" 8 1 26 28 64 '
                    archiveArtifacts artifacts: 'reports/*.log'
                    sh 'rm -rf *.log'
                }
            }
        }

        stage("ypsilon") {
            agent {
                docker {
                    image 'schemers/ypsilon:latest'
                    reuseNode true
                    args '--user=root'
                }
            }
            when {
                expression {
                    params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == 'ypsilon'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'apt update && apt install -y make'
                    sh './jenkins_scripts/clean.sh'
                    unstash 'tests'
                    sh './jenkins_scripts/test.sh "ypsilon" "ypsilon --r7rs --loadpath=." "" 8 1 26 28 64 '
                    archiveArtifacts artifacts: 'reports/*.log'
                    sh 'rm -rf *.log'
                }
            }
        }


        stage("Report") {
            steps {
                unstash 'reports'
                sh './jenkins_scripts/reports.sh'
                archiveArtifacts artifacts: 'reports/*.html'
                publishHTML (target : [allowMissing: false,
                    alwaysLinkToLastBuild: false,
                    keepAll: true,
                    reportDir: 'reports',
                    reportFiles: '*.html,*.css',
                    reportName: 'R7RS-SRFI Test Report',
                    reportTitles: 'R7RS-SRFI Test Report'])
            }
        }
    }
    post {
        always {
            archiveArtifacts artifacts: 'reports/*.log'
            archiveArtifacts artifacts: 'reports/*.html'
            deleteDir()
        }
        failure {
            archiveArtifacts artifacts: 'reports/*.html'
            archiveArtifacts artifacts: 'reports/*.log'
            deleteDir()
        }
    }
}

