pipeline {

    agent any
options {
        buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10'))
    }

    parameters {
        choice(name: 'BUILD_IMPLEMENTATION',
               description: 'Build',
               choices: [
                 'all',
                 'chibi',
                 'chicken-compiler',
                 'chicken-interpreter',
                 'cyclone-compiler',
                 'cyclone-interpreter',
                 'foment',
                 'gambit-compiler',
                 'gambit-interpreter',
                 'gauche',
                 'gerbil-compiler',
                 'gerbil-interpreter',
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
                    sh 'apt update && apt install -y make time tree file'
                    sh 'make -f Makefile.build clean'
                    unstash 'tests'
                    sh './jenkins_scripts/test.sh "chibi" "chibi-scheme -I ." ""'
                    archiveArtifacts artifacts: 'reports/*.log'
                    sh 'rm -rf *.log'
                }
            }
        }

        stage("chicken-compiler") {
            agent {
                docker {
                    image 'schemers/chicken'
                    reuseNode true
                    args '--user=root'
                }
            }
            when {
                expression {
                    params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == 'chicken-compiler'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'apt update && apt install -y make time tree file'
                    sh 'make -f Makefile.build clean'
                    unstash 'tests'
                    sh './jenkins_scripts/test.sh "chicken-compiler" "csc -X r7rs -R r7rs -I ./srfi -o test" "csc -X r7rs -R r7rs -I ./srfi -s -J"'
                    archiveArtifacts artifacts: 'reports/*.log'
                    sh 'rm -rf *.log'
                }
            }
        }

        stage("chicken-interpreter") {
            agent {
                docker {
                    image 'schemers/chicken'
                    reuseNode true
                    args '--user=root'
                }
            }
            when {
                expression {
                    params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == 'chicken-interpreter'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'apt update && apt install -y make time tree file'
                    sh 'make -f Makefile.build clean'
                    unstash 'tests'
                    sh './jenkins_scripts/test.sh "chicken-interpreter" "csi -b -R r7rs -I ./ -I ./srfi -script" "csc -X r7rs -R r7rs -I ./srfi -s -J"'
                    archiveArtifacts artifacts: 'reports/*.log'
                    sh 'rm -rf *.log'
                }
            }
        }

        stage("cyclone-compiler") {
            agent {
                docker {
                    image 'schemers/cyclone'
                    reuseNode true
                    args '--user=root'
                }
            }
            when {
                expression {
                    params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == 'cyclone-compiler'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'apt update && apt install -y make time tree file'
                    sh 'make -f Makefile.build clean'
                    unstash 'tests'
                    sh './jenkins_scripts/test.sh "cyclone-compiler" "cyclone -o ./test -I ." "cyclone -I ."'
                    archiveArtifacts artifacts: 'reports/*.log'
                    sh 'rm -rf *.log'
                }
            }
        }

        stage("cyclone-interpreter") {
            agent {
                docker {
                    image 'schemers/cyclone'
                    reuseNode true
                    args '--user=root'
                }
            }
            when {
                expression {
                    params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == 'cyclone-interpreter'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'apt update && apt install -y make time tree file'
                    sh 'make -f Makefile.build clean'
                    unstash 'tests'
                    sh './jenkins_scripts/test.sh "cyclone-interpreter" "icyc -I . -I ./srfi -s" ""'
                    archiveArtifacts artifacts: 'reports/*.log'
                    sh 'rm -rf *.log'
                }
            }
        }

        stage("foment") {
            agent {
                docker {
                    image 'schemers/foment:head'
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
                    sh 'apt update && apt install -y make time tree file'
                    sh 'make -f Makefile.build clean'
                    unstash 'tests'
                    sh './jenkins_scripts/test.sh "foment" "foment -X .sld -I ." ""'
                    archiveArtifacts artifacts: 'reports/*.log'
                    sh 'rm -rf *.log'
                }
            }
        }

        stage("gambit-compiler") {
            agent {
                docker {
                    image 'schemers/gambit:head'
                    reuseNode true
                    args '--user=root'
                }
            }
            when {
                expression {
                    params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == 'gambit-compiler'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'apt update && apt install -y make time tree file'
                    sh 'make -f Makefile.build clean'
                    unstash 'tests'
                    sh './jenkins_scripts/test.sh "gambit-compiler" "gsc -o ./test -exe -nopreload ./" "ls"'
                    archiveArtifacts artifacts: 'reports/*.log'
                    sh 'rm -rf *.log'
                }
            }
        }

        stage("gambit-interpreter") {
            agent {
                docker {
                    image 'schemers/gambit:head'
                    reuseNode true
                    args '--user=root'
                }
            }
            when {
                expression {
                    params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == 'gambit-interpreter'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'apt update && apt install -y make time tree file'
                    sh 'make -f Makefile.build clean'
                    unstash 'tests'
                    sh './jenkins_scripts/test.sh "gambit-interpreter" "gsi -:search=./" ""'
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
                    sh 'apt update && apt install -y make time tree file'
                    sh 'make -f Makefile.build clean'
                    unstash 'tests'
                    sh './jenkins_scripts/test.sh "gauche" "gosh -r7 -I ." ""'
                    archiveArtifacts artifacts: 'reports/*.log'
                    sh 'rm -rf *.log'
                }
            }
        }

        stage("gerbil-compiler") {
            agent {
                docker {
                    image 'schemers/gerbil'
                    reuseNode true
                    args '--user=root'
                }
            }
            when {
                expression {
                    params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == 'gerbil-compiler'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'apt update && apt install -y make time tree file'
                    sh 'make -f Makefile.build clean'
                    unstash 'tests'
                    sh './jenkins_scripts/test.sh "gerbil-compiler" "GERBIL_LOADPATH=. gxc -o ./test --lang r7rs -exe" "gxc"'
                    archiveArtifacts artifacts: 'reports/*.log'
                    sh 'rm -rf *.log'
                }
            }
        }

        stage("gerbil-interpreter") {
            agent {
                docker {
                    image 'schemers/gerbil'
                    reuseNode true
                    args '--user=root'
                }
            }
            when {
                expression {
                    params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == 'gerbil-interpreter'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'apt update && apt install -y make time tree file'
                    sh 'make -f Makefile.build clean'
                    unstash 'tests'
                    sh './jenkins_scripts/test.sh "gerbil-interpreter" "GERBIL_LOADPATH=.:./srfi gxi --lang r7rs" ""'
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
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'apt update && apt install -y make time tree file'
                    sh 'make -f Makefile.build clean'
                    unstash 'tests'
                    sh './jenkins_scripts/test.sh "guile" "guile --fresh-auto-compile --r7rs -L . -L ./srfi" ""'
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
                    sh 'apt update && apt install -y make time tree file'
                    sh 'make -f Makefile.build clean'
                    unstash 'tests'
                    sh './jenkins_scripts/test.sh "kawa" "kawa --r7rs --full-tailcalls -Dkawa.import.path=../../*.sld:*.sld" ""'
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
                    sh 'apt update && apt install -y make time tree file'
                    sh 'make -f Makefile.build clean'
                    unstash 'tests'
                    sh './jenkins_scripts/test.sh "larceny" "larceny -utf8 -r7rs -I . -program" ""'
                    archiveArtifacts artifacts: 'reports/*.log'
                    sh 'rm -rf *.log'
                }
            }
        }

        stage("loko-compiler") {
            agent {
                docker {
                    image 'schemers/loko'
                    reuseNode true
                    args '--user=root'
                }
            }
            when {
                expression {
                    params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == 'loko-compiler'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'apt update && apt install -y make time tree file'
                    sh 'make -f Makefile.build clean'
                    unstash 'tests'
                    sh './jenkins_scripts/test.sh "loko-compiler" "loko -std=r7rs --compile" "ls"'
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
                    sh 'apt update && apt install -y make time tree file'
                    sh 'make -f Makefile.build clean'
                    unstash 'tests'
                    sh './jenkins_scripts/test.sh "mit-scheme" "mit-scheme --batch-mode --load ./srfi/8.sld ./srfi/1.sld ./srfi/38.sld ./srfi/48.sld ./srfi/64.sld" ""'
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
                    sh 'apt update && apt install -y make time tree file'
                    sh 'make -f Makefile.build clean'
                    unstash 'tests'
                    sh './jenkins_scripts/test.sh "mosh" "mosh --loadpath=." ""'
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
                    sh 'apt update && apt install -y make time tree file'
                    sh 'make -f Makefile.build clean'
                    unstash 'tests'
                    sh './jenkins_scripts/test.sh "racket" "racket -I r7rs -S . --script" ""'
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
                    sh 'apt update && apt install -y make time tree file'
                    sh 'make -f Makefile.build clean'
                    unstash 'tests'
                    sh './jenkins_scripts/test.sh "sagittarius" "sash -r7 -L . -L ./srfi" ""'
                    archiveArtifacts artifacts: 'reports/*.log'
                    sh 'rm -rf *.log'
                }
            }
        }

        stage("stklos") {
            agent {
                docker {
                    image 'schemers/stklos:head'
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
                    sh 'apt update && apt install -y make time tree file'
                    sh 'make -f Makefile.build clean'
                    unstash 'tests'
                    sh './jenkins_scripts/test.sh "stklos" "stklos --debug -I . -I ./srfi -f" ""'
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
                    sh 'apt update && apt install -y make time tree file'
                    sh 'make -f Makefile.build clean'
                    unstash 'tests'
                    sh './jenkins_scripts/test.sh "skint" "skint -I ./ --script" ""'
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
                    sh 'apt update && apt install -y make time tree file'
                    sh 'make -f Makefile.build clean'
                    unstash 'tests'
                    sh './jenkins_scripts/test.sh "tr7" "tr7i" ""'
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
                    sh 'apt update && apt install -y make time tree file'
                    sh 'make -f Makefile.build clean'
                    unstash 'tests'
                    sh './jenkins_scripts/test.sh "ypsilon" "ypsilon --r7rs --verbose --warning --sitelib=. --top-level-program" ""'
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

