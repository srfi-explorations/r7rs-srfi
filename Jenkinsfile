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

                    sh 'make test-chibi-srfi-64'
                    sh 'docker run -v ${PWD}:/workdir:z schemers/chibi bash -c "cd workdir && ls"'
                    sh 'docker run -v ${PWD}:/workdir:z schemers/chibi bash -c "cd workdir && chibi-scheme -I srfi srfi-test/64.scm"'


                    // Change any logfiles to identify implementatio nand SRFI and stash them
                    unstash 'reports'
                    sh 'for f in *.log; do cp -- "$f" "reports/SRFI-64-chibi.log"; done'
                    sh 'ls reports'
                    stash name: 'reports', includes: 'reports/*'
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

                    sh 'make test-chicken-srfi-64'
                    sh 'docker run -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs -s -J"'
                    sh 'docker run -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs srfi-test/64.scm"'


                    // Change any logfiles to identify implementatio nand SRFI and stash them
                    unstash 'reports'
                    sh 'for f in *.log; do cp -- "$f" "reports/SRFI-64-chicken.log"; done'
                    sh 'ls reports'
                    stash name: 'reports', includes: 'reports/*'
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

                    sh 'make test-cyclone-srfi-64'
                    sh 'docker run -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I ."'
                    sh 'docker run -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi-test/64.scm"'


                    // Change any logfiles to identify implementatio nand SRFI and stash them
                    unstash 'reports'
                    sh 'for f in *.log; do cp -- "$f" "reports/SRFI-64-cyclone.log"; done'
                    sh 'ls reports'
                    stash name: 'reports', includes: 'reports/*'
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

                    sh 'make test-gambit-srfi-64'
                    sh 'docker run -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsc -:r7rs -dynamic"'
                    sh 'docker run -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsc -:r7rs,search=. -exe srfi-test/64.scm"'


                    // Change any logfiles to identify implementatio nand SRFI and stash them
                    unstash 'reports'
                    sh 'for f in *.log; do cp -- "$f" "reports/SRFI-64-gambit.log"; done'
                    sh 'ls reports'
                    stash name: 'reports', includes: 'reports/*'
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

                    sh 'make test-gerbil-srfi-64'
                    sh 'docker run -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && ls"'
                    sh 'docker run -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxi srfi-test/64.scm"'


                    // Change any logfiles to identify implementatio nand SRFI and stash them
                    unstash 'reports'
                    sh 'for f in *.log; do cp -- "$f" "reports/SRFI-64-gerbil.log"; done'
                    sh 'ls reports'
                    stash name: 'reports', includes: 'reports/*'
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

                    sh 'make test-gauche-srfi-64'
                    sh 'docker run -v ${PWD}:/workdir:z schemers/gauche bash -c "cd workdir && ls"'
                    sh 'docker run -v ${PWD}:/workdir:z schemers/gauche bash -c "cd workdir && gosh srfi-test/64.scm"'


                    // Change any logfiles to identify implementatio nand SRFI and stash them
                    unstash 'reports'
                    sh 'for f in *.log; do cp -- "$f" "reports/SRFI-64-gauche.log"; done'
                    sh 'ls reports'
                    stash name: 'reports', includes: 'reports/*'
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

                    sh 'make test-guile-srfi-64'
                    sh 'docker run -v ${PWD}:/workdir:z schemers/guile bash -c "cd workdir && ls"'
                    sh 'docker run -v ${PWD}:/workdir:z schemers/guile bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . srfi-test/64.scm"'


                    // Change any logfiles to identify implementatio nand SRFI and stash them
                    unstash 'reports'
                    sh 'for f in *.log; do cp -- "$f" "reports/SRFI-64-guile.log"; done'
                    sh 'ls reports'
                    stash name: 'reports', includes: 'reports/*'
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

                    sh 'make test-kawa-srfi-64'
                    sh 'docker run -v ${PWD}:/workdir:z schemers/kawa bash -c "cd workdir && ls"'
                    sh 'docker run -v ${PWD}:/workdir:z schemers/kawa bash -c "cd workdir && kawa srfi-test/64.scm"'


                    // Change any logfiles to identify implementatio nand SRFI and stash them
                    unstash 'reports'
                    sh 'for f in *.log; do cp -- "$f" "reports/SRFI-64-kawa.log"; done'
                    sh 'ls reports'
                    stash name: 'reports', includes: 'reports/*'
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

                    sh 'make test-loko-srfi-64'
                    sh 'docker run -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && ls"'
                    sh 'docker run -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && loko -feval -std=r7rs --compile srfi-test/64.scm"'


                    // Change any logfiles to identify implementatio nand SRFI and stash them
                    unstash 'reports'
                    sh 'for f in *.log; do cp -- "$f" "reports/SRFI-64-loko.log"; done'
                    sh 'ls reports'
                    stash name: 'reports', includes: 'reports/*'
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

                    sh 'make test-mit-scheme-srfi-64'
                    sh 'docker run -v ${PWD}:/workdir:z schemers/mit-scheme bash -c "cd workdir && ls"'
                    sh 'docker run -v ${PWD}:/workdir:z schemers/mit-scheme bash -c "cd workdir && mit-scheme --load srfi-test/64.scm"'


                    // Change any logfiles to identify implementatio nand SRFI and stash them
                    unstash 'reports'
                    sh 'for f in *.log; do cp -- "$f" "reports/SRFI-64-mit-scheme.log"; done'
                    sh 'ls reports'
                    stash name: 'reports', includes: 'reports/*'
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

                    sh 'make test-racket-srfi-64'
                    sh 'docker run -v ${PWD}:/workdir:z schemers/racket bash -c "cd workdir && ls"'
                    sh 'docker run -v ${PWD}:/workdir:z schemers/racket bash -c "cd workdir && racket -I r7rs --make -S . --script srfi-test/64.scm"'


                    // Change any logfiles to identify implementatio nand SRFI and stash them
                    unstash 'reports'
                    sh 'for f in *.log; do cp -- "$f" "reports/SRFI-64-racket.log"; done'
                    sh 'ls reports'
                    stash name: 'reports', includes: 'reports/*'
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

                    sh 'make test-sagittarius-srfi-64'
                    sh 'docker run -v ${PWD}:/workdir:z schemers/sagittarius bash -c "cd workdir && ls"'
                    sh 'docker run -v ${PWD}:/workdir:z schemers/sagittarius bash -c "cd workdir && sash srfi-test/64.scm"'


                    // Change any logfiles to identify implementatio nand SRFI and stash them
                    unstash 'reports'
                    sh 'for f in *.log; do cp -- "$f" "reports/SRFI-64-sagittarius.log"; done'
                    sh 'ls reports'
                    stash name: 'reports', includes: 'reports/*'
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

                    sh 'make test-stklos-srfi-64'
                    sh 'docker run -v ${PWD}:/workdir:z schemers/stklos bash -c "cd workdir && ls"'
                    sh 'docker run -v ${PWD}:/workdir:z schemers/stklos bash -c "cd workdir && stklos -I . srfi-test/64.scm"'


                    // Change any logfiles to identify implementatio nand SRFI and stash them
                    unstash 'reports'
                    sh 'for f in *.log; do cp -- "$f" "reports/SRFI-64-stklos.log"; done'
                    sh 'ls reports'
                    stash name: 'reports', includes: 'reports/*'
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

                    sh 'make test-skint-srfi-64'
                    sh 'docker run -v ${PWD}:/workdir:z schemers/skint bash -c "cd workdir && ls"'
                    sh 'docker run -v ${PWD}:/workdir:z schemers/skint bash -c "cd workdir && skint --program srfi-test/64.scm"'


                    // Change any logfiles to identify implementatio nand SRFI and stash them
                    unstash 'reports'
                    sh 'for f in *.log; do cp -- "$f" "reports/SRFI-64-skint.log"; done'
                    sh 'ls reports'
                    stash name: 'reports', includes: 'reports/*'
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

                    sh 'make test-tr7-srfi-64'
                    sh 'docker run -v ${PWD}:/workdir:z schemers/tr7 bash -c "cd workdir && ls"'
                    sh 'docker run -v ${PWD}:/workdir:z schemers/tr7 bash -c "cd workdir && tr7i srfi-test/64.scm"'


                    // Change any logfiles to identify implementatio nand SRFI and stash them
                    unstash 'reports'
                    sh 'for f in *.log; do cp -- "$f" "reports/SRFI-64-tr7.log"; done'
                    sh 'ls reports'
                    stash name: 'reports', includes: 'reports/*'
                    archiveArtifacts artifacts: 'reports/*.log'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/64'


                    // Check if all tests passed, dont put anything after this on fail it wont be run
                    sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
                }
            }
        }


        stage("Report") {
            steps {
                unstash 'reports'
                sh './report-kawa'
                archiveArtifacts artifacts: 'reports/*.html'
            }
        }

    }
    post {
        always {
            deleteDir()
        }
    }
}

