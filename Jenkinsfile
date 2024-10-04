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
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'
                    sh 'find . -name "*.so" -delete'
                    sh 'find . -name "*.o" -delete'
                    sh 'find . -name "*.o" -delete'
                    unstash 'tests'
                    
                    sh 'chibi-scheme -I ./srfi srfi-test/r7rs-programs/64.scm'
                    
                    sh 'chibi-scheme -I ./srfi srfi-test/r7rs-programs/8.scm'
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
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'
                    sh 'find . -name "*.so" -delete'
                    sh 'find . -name "*.o" -delete'
                    sh 'find . -name "*.o" -delete'
                    unstash 'tests'
                    sh 'cp srfi/64.sld srfi-64.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-64.sld  && cp srfi/64.sld srfi-64.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-64.sld'
                    sh 'csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/64.scm && srfi-test/r7rs-programs/64 && rm srfi-test/r7rs-programs/64'
                    sh 'cp srfi/64.sld srfi-64.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-64.sld  && cp srfi/8.sld srfi-8.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-8.sld'
                    sh 'csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/8.scm && srfi-test/r7rs-programs/8 && rm srfi-test/r7rs-programs/8'
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
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'
                    sh 'find . -name "*.so" -delete'
                    sh 'find . -name "*.o" -delete'
                    sh 'find . -name "*.o" -delete'
                    unstash 'tests'
                    sh 'cyclone -A . srfi/64.sld  && cyclone -A . srfi/64.sld'
                    sh 'cyclone -A . srfi-test/r7rs-programs/64.scm && srfi-test/r7rs-programs/64 && rm srfi-test/r7rs-programs/64'
                    sh 'cyclone -A . srfi/64.sld  && cyclone -A . srfi/8.sld'
                    sh 'cyclone -A . srfi-test/r7rs-programs/8.scm && srfi-test/r7rs-programs/8 && rm srfi-test/r7rs-programs/8'
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
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'
                    sh 'find . -name "*.so" -delete'
                    sh 'find . -name "*.o" -delete'
                    sh 'find . -name "*.o" -delete'
                    unstash 'tests'
                    sh 'gsc . srfi/64.sld  && gsc . srfi/64.sld'
                    sh 'gsc -exe . -nopreload srfi-test/r7rs-programs/64.scm && srfi-test/r7rs-programs/64 && rm srfi-test/r7rs-programs/64'
                    sh 'gsc . srfi/64.sld  && gsc . srfi/8.sld'
                    sh 'gsc -exe . -nopreload srfi-test/r7rs-programs/8.scm && srfi-test/r7rs-programs/8 && rm srfi-test/r7rs-programs/8'
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
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'
                    sh 'find . -name "*.so" -delete'
                    sh 'find . -name "*.o" -delete'
                    sh 'find . -name "*.o" -delete'
                    unstash 'tests'
                    
                    sh 'gosh srfi-test/r7rs-programs/64.scm'
                    
                    sh 'gosh srfi-test/r7rs-programs/8.scm'
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
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'
                    sh 'find . -name "*.so" -delete'
                    sh 'find . -name "*.o" -delete'
                    sh 'find . -name "*.o" -delete'
                    unstash 'tests'
                    
                    sh 'guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/64.scm'
                    
                    sh 'guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/8.scm'
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
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'
                    sh 'find . -name "*.so" -delete'
                    sh 'find . -name "*.o" -delete'
                    sh 'find . -name "*.o" -delete'
                    unstash 'tests'
                    
                    sh 'kawa --r7rs -Dkawa.import.path=..:*.sld srfi-test/r7rs-programs/64.scm'
                    
                    sh 'kawa --r7rs -Dkawa.import.path=..:*.sld srfi-test/r7rs-programs/8.scm'
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
                    image 'schemers/loko'
                    reuseNode true
                }
            }
            when {
                expression {
                    params.BUILD_IMPLEMENTATION == 'all' || params.BUILD_IMPLEMENTATION == 'loko'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'
                    sh 'find . -name "*.so" -delete'
                    sh 'find . -name "*.o" -delete'
                    sh 'find . -name "*.o" -delete'
                    unstash 'tests'
                    sh 'ls srfi/64.sld  && ls srfi/64.sld'
                    sh 'LOKO_LIBRARY_FILE_EXTENSIONS=.sld loko -std=r7rs --compile srfi-test/r7rs-programs/64.scm && srfi-test/r7rs-programs/64 && rm srfi-test/r7rs-programs/64'
                    sh 'ls srfi/64.sld  && ls srfi/8.sld'
                    sh 'LOKO_LIBRARY_FILE_EXTENSIONS=.sld loko -std=r7rs --compile srfi-test/r7rs-programs/8.scm && srfi-test/r7rs-programs/8 && rm srfi-test/r7rs-programs/8'
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
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'
                    sh 'find . -name "*.so" -delete'
                    sh 'find . -name "*.o" -delete'
                    sh 'find . -name "*.o" -delete'
                    unstash 'tests'
                    
                    sh 'mit-scheme --load srfi-test/r7rs-programs/64.scm'
                    
                    sh 'mit-scheme --load srfi-test/r7rs-programs/8.scm'
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
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'
                    sh 'find . -name "*.so" -delete'
                    sh 'find . -name "*.o" -delete'
                    sh 'find . -name "*.o" -delete'
                    unstash 'tests'
                    
                    sh 'sash -r7 -L ./srfi srfi-test/r7rs-programs/64.scm > srfi-64.log && cat srfi-64.log'
                    
                    sh 'sash -r7 -L ./srfi srfi-test/r7rs-programs/8.scm > srfi-8.log && cat srfi-8.log'
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
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'
                    sh 'find . -name "*.so" -delete'
                    sh 'find . -name "*.o" -delete'
                    sh 'find . -name "*.o" -delete'
                    unstash 'tests'
                    
                    sh 'stklos -I . srfi-test/r7rs-programs/64.scm'
                    
                    sh 'stklos -I . srfi-test/r7rs-programs/8.scm'
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
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'
                    sh 'find . -name "*.so" -delete'
                    sh 'find . -name "*.o" -delete'
                    sh 'find . -name "*.o" -delete'
                    unstash 'tests'
                    
                    sh 'skint --program srfi-test/r7rs-programs/64.scm'
                    
                    sh 'skint --program srfi-test/r7rs-programs/8.scm'
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
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'
                    sh 'find . -name "*.so" -delete'
                    sh 'find . -name "*.o" -delete'
                    sh 'find . -name "*.o" -delete'
                    unstash 'tests'
                    
                    sh 'tr7i srfi-test/r7rs-programs/64.scm'
                    
                    sh 'tr7i srfi-test/r7rs-programs/8.scm'
                    sh 'for f in *.log; do cp -- "$f" "reports/tr7-$f"; done'
                    sh 'ls reports'
                    stash name: 'reports', includes: 'reports/*'
                    archiveArtifacts artifacts: 'reports/*.log'
                }
            }
        }


        stage("Report") {
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    unstash 'reports'
                    sh './report'
                    publishHTML (target : [allowMissing: false,
                        alwaysLinkToLastBuild: true,
                        keepAll: true,
                        reportDir: 'reports',
                        reportFiles: '*.html',
                        reportName: 'R7RS-SRFI Test Report',
                        reportTitles: 'R7RS-SRFI Test Report'])
                }
            }
        }

    }
    post {
        always {
            archiveArtifacts artifacts: 'reports/*.log'
            deleteDir()
        }
        failure {
            deleteDir()
            archiveArtifacts artifacts: 'reports/*.log'
        }
    }
}

