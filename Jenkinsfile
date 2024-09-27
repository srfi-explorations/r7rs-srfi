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

    stages {

        stage("Init") {
            steps {
              sh 'rm -rf srfi-test && git clone https://github.com/srfi-explorations/srfi-test.git'
              sh 'mkdir -p reports'
              sh 'touch reports/placeholder'
              stash name: 'reports', includes: 'reports/*'
              sh 'echo "<h1>Test results</h1>" > reports/results.html'
              stash name: 'tests', includes: 'srfi-test/*'
            }
        }

        stage("SRFI-64 - chibi") {
            agent {
                docker {
                    image 'schemers/chibi'
                    reuseNode true
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'

                    // If the implementation is compiler other than chicken then compile the SRFI library
                    sh 'if [ ! "" = "" ] && [ ! "chibi" = "chicken"] ; then  srfi/64.sld ; fi'

                    // Chicken needs the file to be in same folder and with different name
                    sh 'if ["chibi" = "chicken"] ; then cp srfi/64.sld srfi-64.sld &&  srfi-64.sld ; fi'

                    sh 'chibi-scheme -I srfi srfi-test/64.scm'

                    // If the implementation makes executable then run it
                    sh 'if [ ! "" = "" ]; then ./srfi-test/64 ; fi'

                    // Change any logfiles to identify implementatio nand SRFI and stash them
                    unstash 'reports'
                    sh 'for f in *.log; do cp -- "$f" "reports/SRFI-64-chibi-$f"; done'
                    sh 'ls reports'
                    archiveArtifacts artifacts: 'reports/*.log'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/64'


                    // Check if all tests passed, dont put anything after this on fail it wont be run
                    sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
                }
            }
        }

        stage("SRFI-64 - chicken") {
            agent {
                docker {
                    image 'schemers/chicken'
                    reuseNode true
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'

                    // If the implementation is compiler other than chicken then compile the SRFI library
                    sh 'if [ ! "csc -include-path ./srfi -X r7rs -R r7rs -s -J" = "" ] && [ ! "chicken" = "chicken"] ; then csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi/64.sld ; fi'

                    // Chicken needs the file to be in same folder and with different name
                    sh 'if ["chicken" = "chicken"] ; then cp srfi/64.sld srfi-64.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-64.sld ; fi'

                    sh 'csc -include-path ./srfi -X r7rs -R r7rs srfi-test/64.scm'

                    // If the implementation makes executable then run it
                    sh 'if [ ! "csc -include-path ./srfi -X r7rs -R r7rs -s -J" = "" ]; then ./srfi-test/64 ; fi'

                    // Change any logfiles to identify implementatio nand SRFI and stash them
                    unstash 'reports'
                    sh 'for f in *.log; do cp -- "$f" "reports/SRFI-64-chicken-$f"; done'
                    sh 'ls reports'
                    archiveArtifacts artifacts: 'reports/*.log'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/64'


                    // Check if all tests passed, dont put anything after this on fail it wont be run
                    sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
                }
            }
        }

        stage("SRFI-64 - cyclone") {
            agent {
                docker {
                    image 'schemers/cyclone'
                    reuseNode true
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'

                    // If the implementation is compiler other than chicken then compile the SRFI library
                    sh 'if [ ! "cyclone -I ." = "" ] && [ ! "cyclone" = "chicken"] ; then cyclone -I . srfi/64.sld ; fi'

                    // Chicken needs the file to be in same folder and with different name
                    sh 'if ["cyclone" = "chicken"] ; then cp srfi/64.sld srfi-64.sld && cyclone -I . srfi-64.sld ; fi'

                    sh 'cyclone -I . srfi-test/64.scm'

                    // If the implementation makes executable then run it
                    sh 'if [ ! "cyclone -I ." = "" ]; then ./srfi-test/64 ; fi'

                    // Change any logfiles to identify implementatio nand SRFI and stash them
                    unstash 'reports'
                    sh 'for f in *.log; do cp -- "$f" "reports/SRFI-64-cyclone-$f"; done'
                    sh 'ls reports'
                    archiveArtifacts artifacts: 'reports/*.log'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/64'


                    // Check if all tests passed, dont put anything after this on fail it wont be run
                    sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
                }
            }
        }

        stage("SRFI-64 - gambit") {
            agent {
                docker {
                    image 'schemers/gambit'
                    reuseNode true
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'

                    // If the implementation is compiler other than chicken then compile the SRFI library
                    sh 'if [ ! "gsc -:r7rs -dynamic" = "" ] && [ ! "gambit" = "chicken"] ; then gsc -:r7rs -dynamic srfi/64.sld ; fi'

                    // Chicken needs the file to be in same folder and with different name
                    sh 'if ["gambit" = "chicken"] ; then cp srfi/64.sld srfi-64.sld && gsc -:r7rs -dynamic srfi-64.sld ; fi'

                    sh 'gsc -:r7rs,search=. -exe srfi-test/64.scm'

                    // If the implementation makes executable then run it
                    sh 'if [ ! "gsc -:r7rs -dynamic" = "" ]; then ./srfi-test/64 ; fi'

                    // Change any logfiles to identify implementatio nand SRFI and stash them
                    unstash 'reports'
                    sh 'for f in *.log; do cp -- "$f" "reports/SRFI-64-gambit-$f"; done'
                    sh 'ls reports'
                    archiveArtifacts artifacts: 'reports/*.log'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/64'


                    // Check if all tests passed, dont put anything after this on fail it wont be run
                    sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
                }
            }
        }

        stage("SRFI-64 - gerbil") {
            agent {
                docker {
                    image 'schemers/gerbil'
                    reuseNode true
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'

                    // If the implementation is compiler other than chicken then compile the SRFI library
                    sh 'if [ ! "" = "" ] && [ ! "gerbil" = "chicken"] ; then  srfi/64.sld ; fi'

                    // Chicken needs the file to be in same folder and with different name
                    sh 'if ["gerbil" = "chicken"] ; then cp srfi/64.sld srfi-64.sld &&  srfi-64.sld ; fi'

                    sh 'gxi srfi-test/64.scm'

                    // If the implementation makes executable then run it
                    sh 'if [ ! "" = "" ]; then ./srfi-test/64 ; fi'

                    // Change any logfiles to identify implementatio nand SRFI and stash them
                    unstash 'reports'
                    sh 'for f in *.log; do cp -- "$f" "reports/SRFI-64-gerbil-$f"; done'
                    sh 'ls reports'
                    archiveArtifacts artifacts: 'reports/*.log'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/64'


                    // Check if all tests passed, dont put anything after this on fail it wont be run
                    sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
                }
            }
        }

        stage("SRFI-64 - gauche") {
            agent {
                docker {
                    image 'schemers/gauche'
                    reuseNode true
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'

                    // If the implementation is compiler other than chicken then compile the SRFI library
                    sh 'if [ ! "" = "" ] && [ ! "gauche" = "chicken"] ; then  srfi/64.sld ; fi'

                    // Chicken needs the file to be in same folder and with different name
                    sh 'if ["gauche" = "chicken"] ; then cp srfi/64.sld srfi-64.sld &&  srfi-64.sld ; fi'

                    sh 'gosh srfi-test/64.scm'

                    // If the implementation makes executable then run it
                    sh 'if [ ! "" = "" ]; then ./srfi-test/64 ; fi'

                    // Change any logfiles to identify implementatio nand SRFI and stash them
                    unstash 'reports'
                    sh 'for f in *.log; do cp -- "$f" "reports/SRFI-64-gauche-$f"; done'
                    sh 'ls reports'
                    archiveArtifacts artifacts: 'reports/*.log'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/64'


                    // Check if all tests passed, dont put anything after this on fail it wont be run
                    sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
                }
            }
        }

        stage("SRFI-64 - guile") {
            agent {
                docker {
                    image 'schemers/guile'
                    reuseNode true
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'

                    // If the implementation is compiler other than chicken then compile the SRFI library
                    sh 'if [ ! "" = "" ] && [ ! "guile" = "chicken"] ; then  srfi/64.sld ; fi'

                    // Chicken needs the file to be in same folder and with different name
                    sh 'if ["guile" = "chicken"] ; then cp srfi/64.sld srfi-64.sld &&  srfi-64.sld ; fi'

                    sh 'guile --fresh-auto-compile --r7rs -L . srfi-test/64.scm'

                    // If the implementation makes executable then run it
                    sh 'if [ ! "" = "" ]; then ./srfi-test/64 ; fi'

                    // Change any logfiles to identify implementatio nand SRFI and stash them
                    unstash 'reports'
                    sh 'for f in *.log; do cp -- "$f" "reports/SRFI-64-guile-$f"; done'
                    sh 'ls reports'
                    archiveArtifacts artifacts: 'reports/*.log'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/64'


                    // Check if all tests passed, dont put anything after this on fail it wont be run
                    sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
                }
            }
        }

        stage("SRFI-64 - kawa") {
            agent {
                docker {
                    image 'schemers/kawa'
                    reuseNode true
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'

                    // If the implementation is compiler other than chicken then compile the SRFI library
                    sh 'if [ ! "" = "" ] && [ ! "kawa" = "chicken"] ; then  srfi/64.sld ; fi'

                    // Chicken needs the file to be in same folder and with different name
                    sh 'if ["kawa" = "chicken"] ; then cp srfi/64.sld srfi-64.sld &&  srfi-64.sld ; fi'

                    sh 'kawa srfi-test/64.scm'

                    // If the implementation makes executable then run it
                    sh 'if [ ! "" = "" ]; then ./srfi-test/64 ; fi'

                    // Change any logfiles to identify implementatio nand SRFI and stash them
                    unstash 'reports'
                    sh 'for f in *.log; do cp -- "$f" "reports/SRFI-64-kawa-$f"; done'
                    sh 'ls reports'
                    archiveArtifacts artifacts: 'reports/*.log'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/64'


                    // Check if all tests passed, dont put anything after this on fail it wont be run
                    sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
                }
            }
        }

        stage("SRFI-64 - loko") {
            agent {
                docker {
                    image 'schemers/loko'
                    reuseNode true
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'

                    // If the implementation is compiler other than chicken then compile the SRFI library
                    sh 'if [ ! "" = "" ] && [ ! "loko" = "chicken"] ; then  srfi/64.sld ; fi'

                    // Chicken needs the file to be in same folder and with different name
                    sh 'if ["loko" = "chicken"] ; then cp srfi/64.sld srfi-64.sld &&  srfi-64.sld ; fi'

                    sh 'loko -feval -std=r7rs --compile srfi-test/64.scm'

                    // If the implementation makes executable then run it
                    sh 'if [ ! "" = "" ]; then ./srfi-test/64 ; fi'

                    // Change any logfiles to identify implementatio nand SRFI and stash them
                    unstash 'reports'
                    sh 'for f in *.log; do cp -- "$f" "reports/SRFI-64-loko-$f"; done'
                    sh 'ls reports'
                    archiveArtifacts artifacts: 'reports/*.log'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/64'


                    // Check if all tests passed, dont put anything after this on fail it wont be run
                    sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
                }
            }
        }

        stage("SRFI-64 - mit-scheme") {
            agent {
                docker {
                    image 'schemers/mit-scheme'
                    reuseNode true
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'

                    // If the implementation is compiler other than chicken then compile the SRFI library
                    sh 'if [ ! "" = "" ] && [ ! "mit-scheme" = "chicken"] ; then  srfi/64.sld ; fi'

                    // Chicken needs the file to be in same folder and with different name
                    sh 'if ["mit-scheme" = "chicken"] ; then cp srfi/64.sld srfi-64.sld &&  srfi-64.sld ; fi'

                    sh 'mit-scheme --load srfi-test/64.scm'

                    // If the implementation makes executable then run it
                    sh 'if [ ! "" = "" ]; then ./srfi-test/64 ; fi'

                    // Change any logfiles to identify implementatio nand SRFI and stash them
                    unstash 'reports'
                    sh 'for f in *.log; do cp -- "$f" "reports/SRFI-64-mit-scheme-$f"; done'
                    sh 'ls reports'
                    archiveArtifacts artifacts: 'reports/*.log'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/64'


                    // Check if all tests passed, dont put anything after this on fail it wont be run
                    sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
                }
            }
        }

        stage("SRFI-64 - racket") {
            agent {
                docker {
                    image 'schemers/racket'
                    reuseNode true
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'

                    // If the implementation is compiler other than chicken then compile the SRFI library
                    sh 'if [ ! "" = "" ] && [ ! "racket" = "chicken"] ; then  srfi/64.sld ; fi'

                    // Chicken needs the file to be in same folder and with different name
                    sh 'if ["racket" = "chicken"] ; then cp srfi/64.sld srfi-64.sld &&  srfi-64.sld ; fi'

                    sh 'racket -I r7rs --make -S . --script srfi-test/64.scm'

                    // If the implementation makes executable then run it
                    sh 'if [ ! "" = "" ]; then ./srfi-test/64 ; fi'

                    // Change any logfiles to identify implementatio nand SRFI and stash them
                    unstash 'reports'
                    sh 'for f in *.log; do cp -- "$f" "reports/SRFI-64-racket-$f"; done'
                    sh 'ls reports'
                    archiveArtifacts artifacts: 'reports/*.log'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/64'


                    // Check if all tests passed, dont put anything after this on fail it wont be run
                    sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
                }
            }
        }

        stage("SRFI-64 - sagittarius") {
            agent {
                docker {
                    image 'schemers/sagittarius'
                    reuseNode true
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'

                    // If the implementation is compiler other than chicken then compile the SRFI library
                    sh 'if [ ! "" = "" ] && [ ! "sagittarius" = "chicken"] ; then  srfi/64.sld ; fi'

                    // Chicken needs the file to be in same folder and with different name
                    sh 'if ["sagittarius" = "chicken"] ; then cp srfi/64.sld srfi-64.sld &&  srfi-64.sld ; fi'

                    sh 'sash srfi-test/64.scm'

                    // If the implementation makes executable then run it
                    sh 'if [ ! "" = "" ]; then ./srfi-test/64 ; fi'

                    // Change any logfiles to identify implementatio nand SRFI and stash them
                    unstash 'reports'
                    sh 'for f in *.log; do cp -- "$f" "reports/SRFI-64-sagittarius-$f"; done'
                    sh 'ls reports'
                    archiveArtifacts artifacts: 'reports/*.log'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/64'


                    // Check if all tests passed, dont put anything after this on fail it wont be run
                    sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
                }
            }
        }

        stage("SRFI-64 - stklos") {
            agent {
                docker {
                    image 'schemers/stklos'
                    reuseNode true
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'

                    // If the implementation is compiler other than chicken then compile the SRFI library
                    sh 'if [ ! "" = "" ] && [ ! "stklos" = "chicken"] ; then  srfi/64.sld ; fi'

                    // Chicken needs the file to be in same folder and with different name
                    sh 'if ["stklos" = "chicken"] ; then cp srfi/64.sld srfi-64.sld &&  srfi-64.sld ; fi'

                    sh 'stklos -I . srfi-test/64.scm'

                    // If the implementation makes executable then run it
                    sh 'if [ ! "" = "" ]; then ./srfi-test/64 ; fi'

                    // Change any logfiles to identify implementatio nand SRFI and stash them
                    unstash 'reports'
                    sh 'for f in *.log; do cp -- "$f" "reports/SRFI-64-stklos-$f"; done'
                    sh 'ls reports'
                    archiveArtifacts artifacts: 'reports/*.log'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/64'


                    // Check if all tests passed, dont put anything after this on fail it wont be run
                    sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
                }
            }
        }

        stage("SRFI-64 - skint") {
            agent {
                docker {
                    image 'schemers/skint'
                    reuseNode true
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'

                    // If the implementation is compiler other than chicken then compile the SRFI library
                    sh 'if [ ! "" = "" ] && [ ! "skint" = "chicken"] ; then  srfi/64.sld ; fi'

                    // Chicken needs the file to be in same folder and with different name
                    sh 'if ["skint" = "chicken"] ; then cp srfi/64.sld srfi-64.sld &&  srfi-64.sld ; fi'

                    sh 'skint --program srfi-test/64.scm'

                    // If the implementation makes executable then run it
                    sh 'if [ ! "" = "" ]; then ./srfi-test/64 ; fi'

                    // Change any logfiles to identify implementatio nand SRFI and stash them
                    unstash 'reports'
                    sh 'for f in *.log; do cp -- "$f" "reports/SRFI-64-skint-$f"; done'
                    sh 'ls reports'
                    archiveArtifacts artifacts: 'reports/*.log'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/64'


                    // Check if all tests passed, dont put anything after this on fail it wont be run
                    sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
                }
            }
        }

        stage("SRFI-64 - tr7") {
            agent {
                docker {
                    image 'schemers/tr7'
                    reuseNode true
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'

                    // If the implementation is compiler other than chicken then compile the SRFI library
                    sh 'if [ ! "" = "" ] && [ ! "tr7" = "chicken"] ; then  srfi/64.sld ; fi'

                    // Chicken needs the file to be in same folder and with different name
                    sh 'if ["tr7" = "chicken"] ; then cp srfi/64.sld srfi-64.sld &&  srfi-64.sld ; fi'

                    sh 'tr7i srfi-test/64.scm'

                    // If the implementation makes executable then run it
                    sh 'if [ ! "" = "" ]; then ./srfi-test/64 ; fi'

                    // Change any logfiles to identify implementatio nand SRFI and stash them
                    unstash 'reports'
                    sh 'for f in *.log; do cp -- "$f" "reports/SRFI-64-tr7-$f"; done'
                    sh 'ls reports'
                    archiveArtifacts artifacts: 'reports/*.log'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/64'


                    // Check if all tests passed, dont put anything after this on fail it wont be run
                    sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
                }
            }
        }

    }
    post {
        always {
            unstash 'reports'
            sh '
            archiveArtifacts artifacts: 'reports/*.html'
        }
    }
}

