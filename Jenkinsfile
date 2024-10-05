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
              sh 'rm -rf srfi-test && git clone https://github.com/srfi-explorations/srfi-test.git'
              sh 'mkdir -p reports'
              sh 'touch reports/placeholder'
              stash name: 'reports', includes: 'reports/*'
              sh 'echo "<h1>Test results</h1>" > reports/results.html'
              sh '(cd srfi-test && make clean build)'
              sh 'tree srfi-test'
              stash name: 'tests', includes: 'srfi-test/*'
            }
        }

        stage("chibi") {
            agent {
                docker {
                    image 'schemers/chibi'
                    reuseNode true
                }
            }
            when {
                expression {
                    params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == 'chibi'
                }
            }
            environment {
                MITSCHEME_LIBRARY_PATH = "${env.MITSCHEME_LIBRARY_PATH}:${env.PWD}:${env.PWD}/srfi"
                TR7_LIB_PATH = "${env.TR7_LIB_PATH}:${env.PWD}:${env.PWD}/srfi"
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'
                    sh 'find . -name "*.so" -delete'
                    sh 'find . -name "*.o" -delete'
                    sh 'find . -name "*.o" -delete'
                    unstash 'tests'
                    
                    sh 'chibi-scheme -I ./srfi srfi-test/r7rs-programs/64.scm'
                    
                    sh 'chibi-scheme -I ./srfi srfi-test/r7rs-programs/8.scm'
                    
                    sh 'chibi-scheme -I ./srfi srfi-test/r7rs-programs/1.scm'
                    
                    sh 'chibi-scheme -I ./srfi srfi-test/r7rs-programs/33.scm'
                    
                    sh 'chibi-scheme -I ./srfi srfi-test/r7rs-programs/14.scm'
                    
                    sh 'chibi-scheme -I ./srfi srfi-test/r7rs-programs/13.scm'
                    sh 'for f in *.log; do cp -- "$f" "reports/chibi-$f"; done'
                    sh 'ls reports'
                    stash name: 'reports', includes: 'reports/*'
                    archiveArtifacts artifacts: 'reports/*.log'
                }
            }
        }

        stage("chicken") {
            agent {
                docker {
                    image 'schemers/chicken'
                    reuseNode true
                }
            }
            when {
                expression {
                    params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == 'chicken'
                }
            }
            environment {
                MITSCHEME_LIBRARY_PATH = "${env.MITSCHEME_LIBRARY_PATH}:${env.PWD}:${env.PWD}/srfi"
                TR7_LIB_PATH = "${env.TR7_LIB_PATH}:${env.PWD}:${env.PWD}/srfi"
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'
                    sh 'find . -name "*.so" -delete'
                    sh 'find . -name "*.o" -delete'
                    sh 'find . -name "*.o" -delete'
                    unstash 'tests'
                    sh ' cp srfi/64.sld srfi-64.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-64.sld'
                    sh 'csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/64.scm && srfi-test/r7rs-programs/64 && rm srfi-test/r7rs-programs/64'
                    sh ' cp srfi/8.sld srfi-8.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-8.sld'
                    sh 'csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/8.scm && srfi-test/r7rs-programs/8 && rm srfi-test/r7rs-programs/8'
                    sh ' cp srfi/1.sld srfi-1.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-1.sld'
                    sh 'csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/1.scm && srfi-test/r7rs-programs/1 && rm srfi-test/r7rs-programs/1'
                    sh ' cp srfi/33.sld srfi-33.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-33.sld'
                    sh 'csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/33.scm && srfi-test/r7rs-programs/33 && rm srfi-test/r7rs-programs/33'
                    sh ' cp srfi/14.sld srfi-14.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-14.sld'
                    sh 'csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/14.scm && srfi-test/r7rs-programs/14 && rm srfi-test/r7rs-programs/14'
                    sh ' cp srfi/13.sld srfi-13.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-13.sld'
                    sh 'csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/13.scm && srfi-test/r7rs-programs/13 && rm srfi-test/r7rs-programs/13'
                    sh 'for f in *.log; do cp -- "$f" "reports/chicken-$f"; done'
                    sh 'ls reports'
                    stash name: 'reports', includes: 'reports/*'
                    archiveArtifacts artifacts: 'reports/*.log'
                }
            }
        }

        stage("cyclone") {
            agent {
                docker {
                    image 'schemers/cyclone'
                    reuseNode true
                }
            }
            when {
                expression {
                    params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == 'cyclone'
                }
            }
            environment {
                MITSCHEME_LIBRARY_PATH = "${env.MITSCHEME_LIBRARY_PATH}:${env.PWD}:${env.PWD}/srfi"
                TR7_LIB_PATH = "${env.TR7_LIB_PATH}:${env.PWD}:${env.PWD}/srfi"
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'
                    sh 'find . -name "*.so" -delete'
                    sh 'find . -name "*.o" -delete'
                    sh 'find . -name "*.o" -delete'
                    unstash 'tests'
                    sh 'cyclone -A . srfi/64.sld'
                    sh 'cyclone -A . srfi-test/r7rs-programs/64.scm && srfi-test/r7rs-programs/64 && rm srfi-test/r7rs-programs/64'
                    sh 'cyclone -A . srfi/8.sld'
                    sh 'cyclone -A . srfi-test/r7rs-programs/8.scm && srfi-test/r7rs-programs/8 && rm srfi-test/r7rs-programs/8'
                    sh 'cyclone -A . srfi/1.sld'
                    sh 'cyclone -A . srfi-test/r7rs-programs/1.scm && srfi-test/r7rs-programs/1 && rm srfi-test/r7rs-programs/1'
                    sh 'cyclone -A . srfi/33.sld'
                    sh 'cyclone -A . srfi-test/r7rs-programs/33.scm && srfi-test/r7rs-programs/33 && rm srfi-test/r7rs-programs/33'
                    sh 'cyclone -A . srfi/14.sld'
                    sh 'cyclone -A . srfi-test/r7rs-programs/14.scm && srfi-test/r7rs-programs/14 && rm srfi-test/r7rs-programs/14'
                    sh 'cyclone -A . srfi/13.sld'
                    sh 'cyclone -A . srfi-test/r7rs-programs/13.scm && srfi-test/r7rs-programs/13 && rm srfi-test/r7rs-programs/13'
                    sh 'for f in *.log; do cp -- "$f" "reports/cyclone-$f"; done'
                    sh 'ls reports'
                    stash name: 'reports', includes: 'reports/*'
                    archiveArtifacts artifacts: 'reports/*.log'
                }
            }
        }

        stage("gambit") {
            agent {
                docker {
                    image 'schemers/gambit'
                    reuseNode true
                }
            }
            when {
                expression {
                    params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == 'gambit'
                }
            }
            environment {
                MITSCHEME_LIBRARY_PATH = "${env.MITSCHEME_LIBRARY_PATH}:${env.PWD}:${env.PWD}/srfi"
                TR7_LIB_PATH = "${env.TR7_LIB_PATH}:${env.PWD}:${env.PWD}/srfi"
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'
                    sh 'find . -name "*.so" -delete'
                    sh 'find . -name "*.o" -delete'
                    sh 'find . -name "*.o" -delete'
                    unstash 'tests'
                    sh 'gsc . srfi/64'
                    sh 'gsc -exe . -nopreload srfi-test/r7rs-programs/64.scm && srfi-test/r7rs-programs/64 && rm srfi-test/r7rs-programs/64'
                    sh 'gsc . srfi/8'
                    sh 'gsc -exe . -nopreload srfi-test/r7rs-programs/8.scm && srfi-test/r7rs-programs/8 && rm srfi-test/r7rs-programs/8'
                    sh 'gsc . srfi/1'
                    sh 'gsc -exe . -nopreload srfi-test/r7rs-programs/1.scm && srfi-test/r7rs-programs/1 && rm srfi-test/r7rs-programs/1'
                    sh 'gsc . srfi/33'
                    sh 'gsc -exe . -nopreload srfi-test/r7rs-programs/33.scm && srfi-test/r7rs-programs/33 && rm srfi-test/r7rs-programs/33'
                    sh 'gsc . srfi/14'
                    sh 'gsc -exe . -nopreload srfi-test/r7rs-programs/14.scm && srfi-test/r7rs-programs/14 && rm srfi-test/r7rs-programs/14'
                    sh 'gsc . srfi/13'
                    sh 'gsc -exe . -nopreload srfi-test/r7rs-programs/13.scm && srfi-test/r7rs-programs/13 && rm srfi-test/r7rs-programs/13'
                    sh 'for f in *.log; do cp -- "$f" "reports/gambit-$f"; done'
                    sh 'ls reports'
                    stash name: 'reports', includes: 'reports/*'
                    archiveArtifacts artifacts: 'reports/*.log'
                }
            }
        }

        stage("gauche") {
            agent {
                docker {
                    image 'schemers/gauche'
                    reuseNode true
                }
            }
            when {
                expression {
                    params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == 'gauche'
                }
            }
            environment {
                MITSCHEME_LIBRARY_PATH = "${env.MITSCHEME_LIBRARY_PATH}:${env.PWD}:${env.PWD}/srfi"
                TR7_LIB_PATH = "${env.TR7_LIB_PATH}:${env.PWD}:${env.PWD}/srfi"
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'
                    sh 'find . -name "*.so" -delete'
                    sh 'find . -name "*.o" -delete'
                    sh 'find . -name "*.o" -delete'
                    unstash 'tests'
                    
                    sh 'gosh -r7 srfi-test/r7rs-programs/64.scm'
                    
                    sh 'gosh -r7 srfi-test/r7rs-programs/8.scm'
                    
                    sh 'gosh -r7 srfi-test/r7rs-programs/1.scm'
                    
                    sh 'gosh -r7 srfi-test/r7rs-programs/33.scm'
                    
                    sh 'gosh -r7 srfi-test/r7rs-programs/14.scm'
                    
                    sh 'gosh -r7 srfi-test/r7rs-programs/13.scm'
                    sh 'for f in *.log; do cp -- "$f" "reports/gauche-$f"; done'
                    sh 'ls reports'
                    stash name: 'reports', includes: 'reports/*'
                    archiveArtifacts artifacts: 'reports/*.log'
                }
            }
        }

        stage("guile") {
            agent {
                docker {
                    image 'schemers/guile'
                    reuseNode true
                }
            }
            when {
                expression {
                    params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == 'guile'
                }
            }
            environment {
                MITSCHEME_LIBRARY_PATH = "${env.MITSCHEME_LIBRARY_PATH}:${env.PWD}:${env.PWD}/srfi"
                TR7_LIB_PATH = "${env.TR7_LIB_PATH}:${env.PWD}:${env.PWD}/srfi"
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'
                    sh 'find . -name "*.so" -delete'
                    sh 'find . -name "*.o" -delete'
                    sh 'find . -name "*.o" -delete'
                    unstash 'tests'
                    
                    sh 'guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/64.scm'
                    
                    sh 'guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/8.scm'
                    
                    sh 'guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/1.scm'
                    
                    sh 'guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/33.scm'
                    
                    sh 'guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/14.scm'
                    
                    sh 'guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/13.scm'
                    sh 'for f in *.log; do cp -- "$f" "reports/guile-$f"; done'
                    sh 'ls reports'
                    stash name: 'reports', includes: 'reports/*'
                    archiveArtifacts artifacts: 'reports/*.log'
                }
            }
        }

        stage("kawa") {
            agent {
                docker {
                    image 'schemers/kawa'
                    reuseNode true
                }
            }
            when {
                expression {
                    params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == 'kawa'
                }
            }
            environment {
                MITSCHEME_LIBRARY_PATH = "${env.MITSCHEME_LIBRARY_PATH}:${env.PWD}:${env.PWD}/srfi"
                TR7_LIB_PATH = "${env.TR7_LIB_PATH}:${env.PWD}:${env.PWD}/srfi"
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'
                    sh 'find . -name "*.so" -delete'
                    sh 'find . -name "*.o" -delete'
                    sh 'find . -name "*.o" -delete'
                    unstash 'tests'
                    
                    sh 'kawa --r7rs -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/64.scm'
                    
                    sh 'kawa --r7rs -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/8.scm'
                    
                    sh 'kawa --r7rs -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/1.scm'
                    
                    sh 'kawa --r7rs -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/33.scm'
                    
                    sh 'kawa --r7rs -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/14.scm'
                    
                    sh 'kawa --r7rs -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/13.scm'
                    sh 'for f in *.log; do cp -- "$f" "reports/kawa-$f"; done'
                    sh 'ls reports'
                    stash name: 'reports', includes: 'reports/*'
                    archiveArtifacts artifacts: 'reports/*.log'
                }
            }
        }

        stage("loko") {
            agent {
                docker {
                    image 'schemers/loko:head'
                    reuseNode true
                }
            }
            when {
                expression {
                    params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == 'loko'
                }
            }
            environment {
                MITSCHEME_LIBRARY_PATH = "${env.MITSCHEME_LIBRARY_PATH}:${env.PWD}:${env.PWD}/srfi"
                TR7_LIB_PATH = "${env.TR7_LIB_PATH}:${env.PWD}:${env.PWD}/srfi"
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'
                    sh 'find . -name "*.so" -delete'
                    sh 'find . -name "*.o" -delete'
                    sh 'find . -name "*.o" -delete'
                    unstash 'tests'
                    sh 'ls srfi/64.sld'
                    sh 'loko -std=r7rs --compile srfi-test/r7rs-programs/64.scm && srfi-test/r7rs-programs/64 && rm srfi-test/r7rs-programs/64'
                    sh 'ls srfi/8.sld'
                    sh 'loko -std=r7rs --compile srfi-test/r7rs-programs/8.scm && srfi-test/r7rs-programs/8 && rm srfi-test/r7rs-programs/8'
                    sh 'ls srfi/1.sld'
                    sh 'loko -std=r7rs --compile srfi-test/r7rs-programs/1.scm && srfi-test/r7rs-programs/1 && rm srfi-test/r7rs-programs/1'
                    sh 'ls srfi/33.sld'
                    sh 'loko -std=r7rs --compile srfi-test/r7rs-programs/33.scm && srfi-test/r7rs-programs/33 && rm srfi-test/r7rs-programs/33'
                    sh 'ls srfi/14.sld'
                    sh 'loko -std=r7rs --compile srfi-test/r7rs-programs/14.scm && srfi-test/r7rs-programs/14 && rm srfi-test/r7rs-programs/14'
                    sh 'ls srfi/13.sld'
                    sh 'loko -std=r7rs --compile srfi-test/r7rs-programs/13.scm && srfi-test/r7rs-programs/13 && rm srfi-test/r7rs-programs/13'
                    sh 'for f in *.log; do cp -- "$f" "reports/loko-$f"; done'
                    sh 'ls reports'
                    stash name: 'reports', includes: 'reports/*'
                    archiveArtifacts artifacts: 'reports/*.log'
                }
            }
        }

        stage("mit-scheme") {
            agent {
                docker {
                    image 'schemers/mit-scheme'
                    reuseNode true
                }
            }
            when {
                expression {
                    params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == 'mit-scheme'
                }
            }
            environment {
                MITSCHEME_LIBRARY_PATH = "${env.MITSCHEME_LIBRARY_PATH}:${env.PWD}:${env.PWD}/srfi"
                TR7_LIB_PATH = "${env.TR7_LIB_PATH}:${env.PWD}:${env.PWD}/srfi"
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'
                    sh 'find . -name "*.so" -delete'
                    sh 'find . -name "*.o" -delete'
                    sh 'find . -name "*.o" -delete'
                    unstash 'tests'
                    
                    sh 'mit-scheme --load srfi-test/r7rs-programs/64.scm'
                    
                    sh 'mit-scheme --load srfi-test/r7rs-programs/8.scm'
                    
                    sh 'mit-scheme --load srfi-test/r7rs-programs/1.scm'
                    
                    sh 'mit-scheme --load srfi-test/r7rs-programs/33.scm'
                    
                    sh 'mit-scheme --load srfi-test/r7rs-programs/14.scm'
                    
                    sh 'mit-scheme --load srfi-test/r7rs-programs/13.scm'
                    sh 'for f in *.log; do cp -- "$f" "reports/mit-scheme-$f"; done'
                    sh 'ls reports'
                    stash name: 'reports', includes: 'reports/*'
                    archiveArtifacts artifacts: 'reports/*.log'
                }
            }
        }

        stage("sagittarius") {
            agent {
                docker {
                    image 'schemers/sagittarius'
                    reuseNode true
                }
            }
            when {
                expression {
                    params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == 'sagittarius'
                }
            }
            environment {
                MITSCHEME_LIBRARY_PATH = "${env.MITSCHEME_LIBRARY_PATH}:${env.PWD}:${env.PWD}/srfi"
                TR7_LIB_PATH = "${env.TR7_LIB_PATH}:${env.PWD}:${env.PWD}/srfi"
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'
                    sh 'find . -name "*.so" -delete'
                    sh 'find . -name "*.o" -delete'
                    sh 'find . -name "*.o" -delete'
                    unstash 'tests'
                    
                    sh 'sash -r7 -L . srfi-test/r7rs-programs/64.scm > srfi-64.log && cat srfi-64.log'
                    
                    sh 'sash -r7 -L . srfi-test/r7rs-programs/8.scm > srfi-8.log && cat srfi-8.log'
                    
                    sh 'sash -r7 -L . srfi-test/r7rs-programs/1.scm > srfi-1.log && cat srfi-1.log'
                    
                    sh 'sash -r7 -L . srfi-test/r7rs-programs/33.scm > srfi-33.log && cat srfi-33.log'
                    
                    sh 'sash -r7 -L . srfi-test/r7rs-programs/14.scm > srfi-14.log && cat srfi-14.log'
                    
                    sh 'sash -r7 -L . srfi-test/r7rs-programs/13.scm > srfi-13.log && cat srfi-13.log'
                    sh 'for f in *.log; do cp -- "$f" "reports/sagittarius-$f"; done'
                    sh 'ls reports'
                    stash name: 'reports', includes: 'reports/*'
                    archiveArtifacts artifacts: 'reports/*.log'
                }
            }
        }

        stage("stklos") {
            agent {
                docker {
                    image 'schemers/stklos'
                    reuseNode true
                }
            }
            when {
                expression {
                    params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == 'stklos'
                }
            }
            environment {
                MITSCHEME_LIBRARY_PATH = "${env.MITSCHEME_LIBRARY_PATH}:${env.PWD}:${env.PWD}/srfi"
                TR7_LIB_PATH = "${env.TR7_LIB_PATH}:${env.PWD}:${env.PWD}/srfi"
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'
                    sh 'find . -name "*.so" -delete'
                    sh 'find . -name "*.o" -delete'
                    sh 'find . -name "*.o" -delete'
                    unstash 'tests'
                    
                    sh 'stklos -I . srfi-test/r7rs-programs/64.scm'
                    
                    sh 'stklos -I . srfi-test/r7rs-programs/8.scm'
                    
                    sh 'stklos -I . srfi-test/r7rs-programs/1.scm'
                    
                    sh 'stklos -I . srfi-test/r7rs-programs/33.scm'
                    
                    sh 'stklos -I . srfi-test/r7rs-programs/14.scm'
                    
                    sh 'stklos -I . srfi-test/r7rs-programs/13.scm'
                    sh 'for f in *.log; do cp -- "$f" "reports/stklos-$f"; done'
                    sh 'ls reports'
                    stash name: 'reports', includes: 'reports/*'
                    archiveArtifacts artifacts: 'reports/*.log'
                }
            }
        }

        stage("skint") {
            agent {
                docker {
                    image 'schemers/skint'
                    reuseNode true
                }
            }
            when {
                expression {
                    params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == 'skint'
                }
            }
            environment {
                MITSCHEME_LIBRARY_PATH = "${env.MITSCHEME_LIBRARY_PATH}:${env.PWD}:${env.PWD}/srfi"
                TR7_LIB_PATH = "${env.TR7_LIB_PATH}:${env.PWD}:${env.PWD}/srfi"
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'
                    sh 'find . -name "*.so" -delete'
                    sh 'find . -name "*.o" -delete'
                    sh 'find . -name "*.o" -delete'
                    unstash 'tests'
                    
                    sh 'skint --program srfi-test/r7rs-programs/64.scm'
                    
                    sh 'skint --program srfi-test/r7rs-programs/8.scm'
                    
                    sh 'skint --program srfi-test/r7rs-programs/1.scm'
                    
                    sh 'skint --program srfi-test/r7rs-programs/33.scm'
                    
                    sh 'skint --program srfi-test/r7rs-programs/14.scm'
                    
                    sh 'skint --program srfi-test/r7rs-programs/13.scm'
                    sh 'for f in *.log; do cp -- "$f" "reports/skint-$f"; done'
                    sh 'ls reports'
                    stash name: 'reports', includes: 'reports/*'
                    archiveArtifacts artifacts: 'reports/*.log'
                }
            }
        }

        stage("tr7") {
            agent {
                docker {
                    image 'schemers/tr7'
                    reuseNode true
                }
            }
            when {
                expression {
                    params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == 'tr7'
                }
            }
            environment {
                MITSCHEME_LIBRARY_PATH = "${env.MITSCHEME_LIBRARY_PATH}:${env.PWD}:${env.PWD}/srfi"
                TR7_LIB_PATH = "${env.TR7_LIB_PATH}:${env.PWD}:${env.PWD}/srfi"
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'
                    sh 'find . -name "*.so" -delete'
                    sh 'find . -name "*.o" -delete'
                    sh 'find . -name "*.o" -delete'
                    unstash 'tests'
                    
                    sh 'tr7i srfi-test/r7rs-programs/64.scm'
                    
                    sh 'tr7i srfi-test/r7rs-programs/8.scm'
                    
                    sh 'tr7i srfi-test/r7rs-programs/1.scm'
                    
                    sh 'tr7i srfi-test/r7rs-programs/33.scm'
                    
                    sh 'tr7i srfi-test/r7rs-programs/14.scm'
                    
                    sh 'tr7i srfi-test/r7rs-programs/13.scm'
                    sh 'for f in *.log; do cp -- "$f" "reports/tr7-$f"; done'
                    sh 'ls reports'
                    stash name: 'reports', includes: 'reports/*'
                    archiveArtifacts artifacts: 'reports/*.log'
                }
            }
        }


        stage("Report") {
            steps {
                unstash 'reports'
                sh './report'
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
        stage("Package") {
            steps {
                sh './snow-package'
                archiveArtifacts artifacts: 'packages/*.tgz'
            }
        }

    }
    post {
        always {
            archiveArtifacts artifacts: 'reports/*.log'
            archiveArtifacts artifacts: 'reports/*.html'
            archiveArtifacts artifacts: '*.tgz'
            archiveArtifacts artifacts: 'srfi/*.tgz'
            deleteDir()
        }
        failure {
            archiveArtifacts artifacts: 'reports/*.html'
            archiveArtifacts artifacts: 'reports/*.log'
            deleteDir()
        }
    }
}

