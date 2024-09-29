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

        stage("SRFI-11 - chibi") {
            agent {
                docker {
                    image 'schemers/chibi'
                    reuseNode true
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'

                    
                    sh 'chibi-scheme -I . srfi-test/convert.scm && chibi-scheme -I . srfi-test/chibi/11.scm'


                    // Change any logfiles to identify implementatio nand SRFI and stash them
                    unstash 'reports'
                    sh 'for f in *.log; do cp -- "$f" "reports/SRFI-11-chibi.log"; done'
                    sh 'ls reports'
                    stash name: 'reports', includes: 'reports/*'
                    archiveArtifacts artifacts: 'reports/*.log'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/11'


                    // Check if all tests passed, dont put anything after this on fail it wont be run
                    sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
                }
            }
        }

        stage("SRFI-11 - chicken") {
            agent {
                docker {
                    image 'schemers/chicken'
                    reuseNode true
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'

                    sh 'cp srfi/11.sld srfi-11.sld ; csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-11.sld'
                    sh 'csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-test/11'


                    // Change any logfiles to identify implementatio nand SRFI and stash them
                    unstash 'reports'
                    sh 'for f in *.log; do cp -- "$f" "reports/SRFI-11-chicken.log"; done'
                    sh 'ls reports'
                    stash name: 'reports', includes: 'reports/*'
                    archiveArtifacts artifacts: 'reports/*.log'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/11'


                    // Check if all tests passed, dont put anything after this on fail it wont be run
                    sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
                }
            }
        }

        stage("SRFI-11 - cyclone") {
            agent {
                docker {
                    image 'schemers/cyclone'
                    reuseNode true
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'

                    sh 'cyclone -I . srfi/11.sld'
                    sh 'cyclone -I . srfi-test/11'


                    // Change any logfiles to identify implementatio nand SRFI and stash them
                    unstash 'reports'
                    sh 'for f in *.log; do cp -- "$f" "reports/SRFI-11-cyclone.log"; done'
                    sh 'ls reports'
                    stash name: 'reports', includes: 'reports/*'
                    archiveArtifacts artifacts: 'reports/*.log'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/11'


                    // Check if all tests passed, dont put anything after this on fail it wont be run
                    sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
                }
            }
        }

        stage("SRFI-11 - gambit") {
            agent {
                docker {
                    image 'schemers/gambit'
                    reuseNode true
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'

                    sh 'gsc srfi/11.sld'
                    sh 'gsc srfi-test/11'


                    // Change any logfiles to identify implementatio nand SRFI and stash them
                    unstash 'reports'
                    sh 'for f in *.log; do cp -- "$f" "reports/SRFI-11-gambit.log"; done'
                    sh 'ls reports'
                    stash name: 'reports', includes: 'reports/*'
                    archiveArtifacts artifacts: 'reports/*.log'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/11'


                    // Check if all tests passed, dont put anything after this on fail it wont be run
                    sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
                }
            }
        }

        stage("SRFI-11 - gauche") {
            agent {
                docker {
                    image 'schemers/gauche'
                    reuseNode true
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'

                    
                    sh 'gosh srfi-test/convert.scm && gosh srfi-test/gauche/11.scm'


                    // Change any logfiles to identify implementatio nand SRFI and stash them
                    unstash 'reports'
                    sh 'for f in *.log; do cp -- "$f" "reports/SRFI-11-gauche.log"; done'
                    sh 'ls reports'
                    stash name: 'reports', includes: 'reports/*'
                    archiveArtifacts artifacts: 'reports/*.log'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/11'


                    // Check if all tests passed, dont put anything after this on fail it wont be run
                    sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
                }
            }
        }

        stage("SRFI-11 - guile") {
            agent {
                docker {
                    image 'schemers/guile'
                    reuseNode true
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'

                    
                    sh 'guile --fresh-auto-compile --r7rs -L . srfi-test/convert.scm && guile --fresh-auto-compile --r7rs -L . srfi-test/guile/11.scm'


                    // Change any logfiles to identify implementatio nand SRFI and stash them
                    unstash 'reports'
                    sh 'for f in *.log; do cp -- "$f" "reports/SRFI-11-guile.log"; done'
                    sh 'ls reports'
                    stash name: 'reports', includes: 'reports/*'
                    archiveArtifacts artifacts: 'reports/*.log'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/11'


                    // Check if all tests passed, dont put anything after this on fail it wont be run
                    sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
                }
            }
        }

        stage("SRFI-11 - kawa") {
            agent {
                docker {
                    image 'schemers/kawa'
                    reuseNode true
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'

                    
                    sh 'kawa srfi-test/convert.scm && kawa srfi-test/kawa/11.scm'


                    // Change any logfiles to identify implementatio nand SRFI and stash them
                    unstash 'reports'
                    sh 'for f in *.log; do cp -- "$f" "reports/SRFI-11-kawa.log"; done'
                    sh 'ls reports'
                    stash name: 'reports', includes: 'reports/*'
                    archiveArtifacts artifacts: 'reports/*.log'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/11'


                    // Check if all tests passed, dont put anything after this on fail it wont be run
                    sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
                }
            }
        }

        stage("SRFI-11 - loko") {
            agent {
                docker {
                    image 'schemers/loko'
                    reuseNode true
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'

                    
                    sh 'loko -std=r7rs -feval --compile srfi-test/convert.scm && loko -std=r7rs -feval --compile srfi-test/loko/11.scm'


                    // Change any logfiles to identify implementatio nand SRFI and stash them
                    unstash 'reports'
                    sh 'for f in *.log; do cp -- "$f" "reports/SRFI-11-loko.log"; done'
                    sh 'ls reports'
                    stash name: 'reports', includes: 'reports/*'
                    archiveArtifacts artifacts: 'reports/*.log'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/11'


                    // Check if all tests passed, dont put anything after this on fail it wont be run
                    sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
                }
            }
        }

        stage("SRFI-11 - mit-scheme") {
            agent {
                docker {
                    image 'schemers/mit-scheme'
                    reuseNode true
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'

                    
                    sh 'mit-scheme --load srfi-test/convert.scm && mit-scheme --load srfi-test/mit-scheme/11.scm'


                    // Change any logfiles to identify implementatio nand SRFI and stash them
                    unstash 'reports'
                    sh 'for f in *.log; do cp -- "$f" "reports/SRFI-11-mit-scheme.log"; done'
                    sh 'ls reports'
                    stash name: 'reports', includes: 'reports/*'
                    archiveArtifacts artifacts: 'reports/*.log'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/11'


                    // Check if all tests passed, dont put anything after this on fail it wont be run
                    sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
                }
            }
        }

        stage("SRFI-11 - racket") {
            agent {
                docker {
                    image 'schemers/racket'
                    reuseNode true
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'

                    
                    sh 'racket -I r7rs --make -S . --script srfi-test/convert.scm && racket -I r7rs --make -S . --script srfi-test/racket/11.scm'


                    // Change any logfiles to identify implementatio nand SRFI and stash them
                    unstash 'reports'
                    sh 'for f in *.log; do cp -- "$f" "reports/SRFI-11-racket.log"; done'
                    sh 'ls reports'
                    stash name: 'reports', includes: 'reports/*'
                    archiveArtifacts artifacts: 'reports/*.log'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/11'


                    // Check if all tests passed, dont put anything after this on fail it wont be run
                    sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
                }
            }
        }

        stage("SRFI-11 - sagittarius") {
            agent {
                docker {
                    image 'schemers/sagittarius'
                    reuseNode true
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'

                    
                    sh 'sash srfi-test/convert.scm && sash srfi-test/sagittarius/11.scm'


                    // Change any logfiles to identify implementatio nand SRFI and stash them
                    unstash 'reports'
                    sh 'for f in *.log; do cp -- "$f" "reports/SRFI-11-sagittarius.log"; done'
                    sh 'ls reports'
                    stash name: 'reports', includes: 'reports/*'
                    archiveArtifacts artifacts: 'reports/*.log'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/11'


                    // Check if all tests passed, dont put anything after this on fail it wont be run
                    sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
                }
            }
        }

        stage("SRFI-11 - stklos") {
            agent {
                docker {
                    image 'schemers/stklos'
                    reuseNode true
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'

                    
                    sh 'stklos -I . srfi-test/convert.scm && stklos -I . srfi-test/stklos/11.scm'


                    // Change any logfiles to identify implementatio nand SRFI and stash them
                    unstash 'reports'
                    sh 'for f in *.log; do cp -- "$f" "reports/SRFI-11-stklos.log"; done'
                    sh 'ls reports'
                    stash name: 'reports', includes: 'reports/*'
                    archiveArtifacts artifacts: 'reports/*.log'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/11'


                    // Check if all tests passed, dont put anything after this on fail it wont be run
                    sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
                }
            }
        }

        stage("SRFI-11 - tr7") {
            agent {
                docker {
                    image 'schemers/tr7'
                    reuseNode true
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'

                    
                    sh 'tr7i srfi-test/convert.scm && tr7i srfi-test/tr7/11.scm'


                    // Change any logfiles to identify implementatio nand SRFI and stash them
                    unstash 'reports'
                    sh 'for f in *.log; do cp -- "$f" "reports/SRFI-11-tr7.log"; done'
                    sh 'ls reports'
                    stash name: 'reports', includes: 'reports/*'
                    archiveArtifacts artifacts: 'reports/*.log'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/11'


                    // Check if all tests passed, dont put anything after this on fail it wont be run
                    sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
                }
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

                    
                    sh 'chibi-scheme -I . srfi-test/convert.scm && chibi-scheme -I . srfi-test/chibi/64.scm'


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

                    sh 'cp srfi/64.sld srfi-64.sld ; csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-64.sld'
                    sh 'csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-test/64'


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

                    sh 'cyclone -I . srfi/64.sld'
                    sh 'cyclone -I . srfi-test/64'


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

                    sh 'gsc srfi/64.sld'
                    sh 'gsc srfi-test/64'


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

                    
                    sh 'gosh srfi-test/convert.scm && gosh srfi-test/gauche/64.scm'


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

                    
                    sh 'guile --fresh-auto-compile --r7rs -L . srfi-test/convert.scm && guile --fresh-auto-compile --r7rs -L . srfi-test/guile/64.scm'


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

                    
                    sh 'kawa srfi-test/convert.scm && kawa srfi-test/kawa/64.scm'


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

                    
                    sh 'loko -std=r7rs -feval --compile srfi-test/convert.scm && loko -std=r7rs -feval --compile srfi-test/loko/64.scm'


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

                    
                    sh 'mit-scheme --load srfi-test/convert.scm && mit-scheme --load srfi-test/mit-scheme/64.scm'


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

                    
                    sh 'racket -I r7rs --make -S . --script srfi-test/convert.scm && racket -I r7rs --make -S . --script srfi-test/racket/64.scm'


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

                    
                    sh 'sash srfi-test/convert.scm && sash srfi-test/sagittarius/64.scm'


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

                    
                    sh 'stklos -I . srfi-test/convert.scm && stklos -I . srfi-test/stklos/64.scm'


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

                    
                    sh 'tr7i srfi-test/convert.scm && tr7i srfi-test/tr7/64.scm'


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

