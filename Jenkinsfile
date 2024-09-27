pipeline {
    agent any
    options { buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10')) }
    stages {
        stage("Init") {
            steps {
              sh 'rm -rf srfi-test && git clone https://github.com/srfi-explorations/srfi-test.git'
              sh 'mkdir -p reports'
              stash name: 'reports, includes: 'reports/*'
              sh 'echo \"<h1>Test results</h1>\" > reports/results.html'
              stash name: 'tests', includes: 'srfi-test/*'
            }
        }

        stage("SRFI-64 - chibi") {
            agent {
                docker {
                    image 'schemers/chibi'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'make clean'

                    // If the implementation is compiler then compile the SRFI library
                    sh 'if [ ! "" = "" ]; then  srfi/64.sld ; fi'

                    sh 'chibi-scheme -I srfi srfi-test/64.scm'

                    // If the implementation makes executable then run it
                    sh 'test -f srfi-test/64 && ./srfi-test/64'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/64'
                }
            }
        }
        stage("SRFI-64 - chicken") {
            agent {
                docker {
                    image 'schemers/chicken'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'make clean'

                    // If the implementation is compiler then compile the SRFI library
                    sh 'if [ ! "csc -include-path ./srfi -X r7rs -R r7rs -s -J" = "" ]; then csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi/64.sld ; fi'

                    sh 'csc -include-path ./srfi -X r7rs -R r7rs srfi-test/64.scm'

                    // If the implementation makes executable then run it
                    sh 'test -f srfi-test/64 && ./srfi-test/64'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/64'
                }
            }
        }
        stage("SRFI-64 - cyclone") {
            agent {
                docker {
                    image 'schemers/cyclone'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'make clean'

                    // If the implementation is compiler then compile the SRFI library
                    sh 'if [ ! "cyclone -I ." = "" ]; then cyclone -I . srfi/64.sld ; fi'

                    sh 'cyclone -I . srfi-test/64.scm'

                    // If the implementation makes executable then run it
                    sh 'test -f srfi-test/64 && ./srfi-test/64'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/64'
                }
            }
        }
        stage("SRFI-64 - gambit") {
            agent {
                docker {
                    image 'schemers/gambit'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'make clean'

                    // If the implementation is compiler then compile the SRFI library
                    sh 'if [ ! "gsc -:r7rs -dynamic" = "" ]; then gsc -:r7rs -dynamic srfi/64.sld ; fi'

                    sh 'gsc -:r7rs,search=. -exe srfi-test/64.scm'

                    // If the implementation makes executable then run it
                    sh 'test -f srfi-test/64 && ./srfi-test/64'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/64'
                }
            }
        }
        stage("SRFI-64 - gerbil") {
            agent {
                docker {
                    image 'schemers/gerbil'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'make clean'

                    // If the implementation is compiler then compile the SRFI library
                    sh 'if [ ! "" = "" ]; then  srfi/64.sld ; fi'

                    sh 'gxi srfi-test/64.scm'

                    // If the implementation makes executable then run it
                    sh 'test -f srfi-test/64 && ./srfi-test/64'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/64'
                }
            }
        }
        stage("SRFI-64 - gauche") {
            agent {
                docker {
                    image 'schemers/gauche'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'make clean'

                    // If the implementation is compiler then compile the SRFI library
                    sh 'if [ ! "" = "" ]; then  srfi/64.sld ; fi'

                    sh 'gosh srfi-test/64.scm'

                    // If the implementation makes executable then run it
                    sh 'test -f srfi-test/64 && ./srfi-test/64'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/64'
                }
            }
        }
        stage("SRFI-64 - guile") {
            agent {
                docker {
                    image 'schemers/guile'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'make clean'

                    // If the implementation is compiler then compile the SRFI library
                    sh 'if [ ! "" = "" ]; then  srfi/64.sld ; fi'

                    sh 'guile --fresh-auto-compile --r7rs -L . srfi-test/64.scm'

                    // If the implementation makes executable then run it
                    sh 'test -f srfi-test/64 && ./srfi-test/64'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/64'
                }
            }
        }
        stage("SRFI-64 - kawa") {
            agent {
                docker {
                    image 'schemers/kawa'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'make clean'

                    // If the implementation is compiler then compile the SRFI library
                    sh 'if [ ! "" = "" ]; then  srfi/64.sld ; fi'

                    sh 'kawa srfi-test/64.scm'

                    // If the implementation makes executable then run it
                    sh 'test -f srfi-test/64 && ./srfi-test/64'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/64'
                }
            }
        }
        stage("SRFI-64 - loko") {
            agent {
                docker {
                    image 'schemers/loko'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'make clean'

                    // If the implementation is compiler then compile the SRFI library
                    sh 'if [ ! "" = "" ]; then  srfi/64.sld ; fi'

                    sh 'loko -feval -std=r7rs --compile srfi-test/64.scm'

                    // If the implementation makes executable then run it
                    sh 'test -f srfi-test/64 && ./srfi-test/64'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/64'
                }
            }
        }
        stage("SRFI-64 - mit-scheme") {
            agent {
                docker {
                    image 'schemers/mit-scheme'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'make clean'

                    // If the implementation is compiler then compile the SRFI library
                    sh 'if [ ! "" = "" ]; then  srfi/64.sld ; fi'

                    sh 'mit-scheme --load srfi-test/64.scm'

                    // If the implementation makes executable then run it
                    sh 'test -f srfi-test/64 && ./srfi-test/64'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/64'
                }
            }
        }
        stage("SRFI-64 - racket") {
            agent {
                docker {
                    image 'schemers/racket'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'make clean'

                    // If the implementation is compiler then compile the SRFI library
                    sh 'if [ ! "" = "" ]; then  srfi/64.sld ; fi'

                    sh 'racket -I r7rs --make -S . --script srfi-test/64.scm'

                    // If the implementation makes executable then run it
                    sh 'test -f srfi-test/64 && ./srfi-test/64'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/64'
                }
            }
        }
        stage("SRFI-64 - sagittarius") {
            agent {
                docker {
                    image 'schemers/sagittarius'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'make clean'

                    // If the implementation is compiler then compile the SRFI library
                    sh 'if [ ! "" = "" ]; then  srfi/64.sld ; fi'

                    sh 'sash srfi-test/64.scm'

                    // If the implementation makes executable then run it
                    sh 'test -f srfi-test/64 && ./srfi-test/64'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/64'
                }
            }
        }
        stage("SRFI-64 - stklos") {
            agent {
                docker {
                    image 'schemers/stklos'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'make clean'

                    // If the implementation is compiler then compile the SRFI library
                    sh 'if [ ! "" = "" ]; then  srfi/64.sld ; fi'

                    sh 'stklos -I . srfi-test/64.scm'

                    // If the implementation makes executable then run it
                    sh 'test -f srfi-test/64 && ./srfi-test/64'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/64'
                }
            }
        }
        stage("SRFI-64 - skint") {
            agent {
                docker {
                    image 'schemers/skint'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'make clean'

                    // If the implementation is compiler then compile the SRFI library
                    sh 'if [ ! "" = "" ]; then  srfi/64.sld ; fi'

                    sh 'skint --program srfi-test/64.scm'

                    // If the implementation makes executable then run it
                    sh 'test -f srfi-test/64 && ./srfi-test/64'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/64'
                }
            }
        }
        stage("SRFI-64 - tr7") {
            agent {
                docker {
                    image 'schemers/tr7'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'make clean'

                    // If the implementation is compiler then compile the SRFI library
                    sh 'if [ ! "" = "" ]; then  srfi/64.sld ; fi'

                    sh 'tr7i srfi-test/64.scm'

                    // If the implementation makes executable then run it
                    sh 'test -f srfi-test/64 && ./srfi-test/64'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/64'
                }
            }
        }
    }
    post {
        always {
            unstash 'reports'
            archiveArtifacts artifacts: 'reports/*.html'
        }
    }
}
