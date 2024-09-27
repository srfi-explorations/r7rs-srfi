pipeline {

    agent any

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
                dockerfile {
                    filename 'Dockerfile.jenkins'
                    dir '.'
                    args '--build-arg IMPLEMENTATION=chibi -v ${PWD}:/workdir --privileged -v /var/run/docker.sock:/var/run/docker.sock --tag=r7rs-srfi-chibi'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'make clean'

                    // If the implementation is compiler then compile the SRFI library
                    //sh 'if [ ! "" = "" ]; then  srfi/64.sld ; fi'

                    sh 'chibi-scheme -I srfi srfi-test/64.scm'

                    // If the implementation makes executable then run it
                    sh 'test -f srfi-test/64 && ./srfi-test/64'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/64'

                    //sh 'find . -iname "*.log" -exec rename _SRFI-64-chibi.log .log '{}' \\;'
                    archiveArtifacts artifacts: '*.log'
                }
            }
        }

        stage("SRFI-64 - chicken") {
            agent {
                dockerfile {
                    filename 'Dockerfile.jenkins'
                    dir '.'
                    args '--build-arg IMPLEMENTATION=chicken -v ${PWD}:/workdir --privileged -v /var/run/docker.sock:/var/run/docker.sock --tag=r7rs-srfi-chicken'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'make clean'

                    // If the implementation is compiler then compile the SRFI library
                    //sh 'if [ ! "csc -include-path ./srfi -X r7rs -R r7rs -s -J" = "" ]; then csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi/64.sld ; fi'

                    sh 'csc -include-path ./srfi -X r7rs -R r7rs srfi-test/64.scm'

                    // If the implementation makes executable then run it
                    sh 'test -f srfi-test/64 && ./srfi-test/64'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/64'

                    //sh 'find . -iname "*.log" -exec rename _SRFI-64-chicken.log .log '{}' \\;'
                    archiveArtifacts artifacts: '*.log'
                }
            }
        }

        stage("SRFI-64 - cyclone") {
            agent {
                dockerfile {
                    filename 'Dockerfile.jenkins'
                    dir '.'
                    args '--build-arg IMPLEMENTATION=cyclone -v ${PWD}:/workdir --privileged -v /var/run/docker.sock:/var/run/docker.sock --tag=r7rs-srfi-cyclone'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'make clean'

                    // If the implementation is compiler then compile the SRFI library
                    //sh 'if [ ! "cyclone -I ." = "" ]; then cyclone -I . srfi/64.sld ; fi'

                    sh 'cyclone -I . srfi-test/64.scm'

                    // If the implementation makes executable then run it
                    sh 'test -f srfi-test/64 && ./srfi-test/64'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/64'

                    //sh 'find . -iname "*.log" -exec rename _SRFI-64-cyclone.log .log '{}' \\;'
                    archiveArtifacts artifacts: '*.log'
                }
            }
        }

        stage("SRFI-64 - gambit") {
            agent {
                dockerfile {
                    filename 'Dockerfile.jenkins'
                    dir '.'
                    args '--build-arg IMPLEMENTATION=gambit -v ${PWD}:/workdir --privileged -v /var/run/docker.sock:/var/run/docker.sock --tag=r7rs-srfi-gambit'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'make clean'

                    // If the implementation is compiler then compile the SRFI library
                    //sh 'if [ ! "gsc -:r7rs -dynamic" = "" ]; then gsc -:r7rs -dynamic srfi/64.sld ; fi'

                    sh 'gsc -:r7rs,search=. -exe srfi-test/64.scm'

                    // If the implementation makes executable then run it
                    sh 'test -f srfi-test/64 && ./srfi-test/64'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/64'

                    //sh 'find . -iname "*.log" -exec rename _SRFI-64-gambit.log .log '{}' \\;'
                    archiveArtifacts artifacts: '*.log'
                }
            }
        }

        stage("SRFI-64 - gerbil") {
            agent {
                dockerfile {
                    filename 'Dockerfile.jenkins'
                    dir '.'
                    args '--build-arg IMPLEMENTATION=gerbil -v ${PWD}:/workdir --privileged -v /var/run/docker.sock:/var/run/docker.sock --tag=r7rs-srfi-gerbil'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'make clean'

                    // If the implementation is compiler then compile the SRFI library
                    //sh 'if [ ! "" = "" ]; then  srfi/64.sld ; fi'

                    sh 'gxi srfi-test/64.scm'

                    // If the implementation makes executable then run it
                    sh 'test -f srfi-test/64 && ./srfi-test/64'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/64'

                    //sh 'find . -iname "*.log" -exec rename _SRFI-64-gerbil.log .log '{}' \\;'
                    archiveArtifacts artifacts: '*.log'
                }
            }
        }

        stage("SRFI-64 - gauche") {
            agent {
                dockerfile {
                    filename 'Dockerfile.jenkins'
                    dir '.'
                    args '--build-arg IMPLEMENTATION=gauche -v ${PWD}:/workdir --privileged -v /var/run/docker.sock:/var/run/docker.sock --tag=r7rs-srfi-gauche'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'make clean'

                    // If the implementation is compiler then compile the SRFI library
                    //sh 'if [ ! "" = "" ]; then  srfi/64.sld ; fi'

                    sh 'gosh srfi-test/64.scm'

                    // If the implementation makes executable then run it
                    sh 'test -f srfi-test/64 && ./srfi-test/64'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/64'

                    //sh 'find . -iname "*.log" -exec rename _SRFI-64-gauche.log .log '{}' \\;'
                    archiveArtifacts artifacts: '*.log'
                }
            }
        }

        stage("SRFI-64 - guile") {
            agent {
                dockerfile {
                    filename 'Dockerfile.jenkins'
                    dir '.'
                    args '--build-arg IMPLEMENTATION=guile -v ${PWD}:/workdir --privileged -v /var/run/docker.sock:/var/run/docker.sock --tag=r7rs-srfi-guile'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'make clean'

                    // If the implementation is compiler then compile the SRFI library
                    //sh 'if [ ! "" = "" ]; then  srfi/64.sld ; fi'

                    sh 'guile --fresh-auto-compile --r7rs -L . srfi-test/64.scm'

                    // If the implementation makes executable then run it
                    sh 'test -f srfi-test/64 && ./srfi-test/64'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/64'

                    //sh 'find . -iname "*.log" -exec rename _SRFI-64-guile.log .log '{}' \\;'
                    archiveArtifacts artifacts: '*.log'
                }
            }
        }

        stage("SRFI-64 - kawa") {
            agent {
                dockerfile {
                    filename 'Dockerfile.jenkins'
                    dir '.'
                    args '--build-arg IMPLEMENTATION=kawa -v ${PWD}:/workdir --privileged -v /var/run/docker.sock:/var/run/docker.sock --tag=r7rs-srfi-kawa'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'make clean'

                    // If the implementation is compiler then compile the SRFI library
                    //sh 'if [ ! "" = "" ]; then  srfi/64.sld ; fi'

                    sh 'kawa srfi-test/64.scm'

                    // If the implementation makes executable then run it
                    sh 'test -f srfi-test/64 && ./srfi-test/64'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/64'

                    //sh 'find . -iname "*.log" -exec rename _SRFI-64-kawa.log .log '{}' \\;'
                    archiveArtifacts artifacts: '*.log'
                }
            }
        }

        stage("SRFI-64 - loko") {
            agent {
                dockerfile {
                    filename 'Dockerfile.jenkins'
                    dir '.'
                    args '--build-arg IMPLEMENTATION=loko -v ${PWD}:/workdir --privileged -v /var/run/docker.sock:/var/run/docker.sock --tag=r7rs-srfi-loko'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'make clean'

                    // If the implementation is compiler then compile the SRFI library
                    //sh 'if [ ! "" = "" ]; then  srfi/64.sld ; fi'

                    sh 'loko -feval -std=r7rs --compile srfi-test/64.scm'

                    // If the implementation makes executable then run it
                    sh 'test -f srfi-test/64 && ./srfi-test/64'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/64'

                    //sh 'find . -iname "*.log" -exec rename _SRFI-64-loko.log .log '{}' \\;'
                    archiveArtifacts artifacts: '*.log'
                }
            }
        }

        stage("SRFI-64 - mit-scheme") {
            agent {
                dockerfile {
                    filename 'Dockerfile.jenkins'
                    dir '.'
                    args '--build-arg IMPLEMENTATION=mit-scheme -v ${PWD}:/workdir --privileged -v /var/run/docker.sock:/var/run/docker.sock --tag=r7rs-srfi-mit-scheme'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'make clean'

                    // If the implementation is compiler then compile the SRFI library
                    //sh 'if [ ! "" = "" ]; then  srfi/64.sld ; fi'

                    sh 'mit-scheme --load srfi-test/64.scm'

                    // If the implementation makes executable then run it
                    sh 'test -f srfi-test/64 && ./srfi-test/64'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/64'

                    //sh 'find . -iname "*.log" -exec rename _SRFI-64-mit-scheme.log .log '{}' \\;'
                    archiveArtifacts artifacts: '*.log'
                }
            }
        }

        stage("SRFI-64 - racket") {
            agent {
                dockerfile {
                    filename 'Dockerfile.jenkins'
                    dir '.'
                    args '--build-arg IMPLEMENTATION=racket -v ${PWD}:/workdir --privileged -v /var/run/docker.sock:/var/run/docker.sock --tag=r7rs-srfi-racket'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'make clean'

                    // If the implementation is compiler then compile the SRFI library
                    //sh 'if [ ! "" = "" ]; then  srfi/64.sld ; fi'

                    sh 'racket -I r7rs --make -S . --script srfi-test/64.scm'

                    // If the implementation makes executable then run it
                    sh 'test -f srfi-test/64 && ./srfi-test/64'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/64'

                    //sh 'find . -iname "*.log" -exec rename _SRFI-64-racket.log .log '{}' \\;'
                    archiveArtifacts artifacts: '*.log'
                }
            }
        }

        stage("SRFI-64 - sagittarius") {
            agent {
                dockerfile {
                    filename 'Dockerfile.jenkins'
                    dir '.'
                    args '--build-arg IMPLEMENTATION=sagittarius -v ${PWD}:/workdir --privileged -v /var/run/docker.sock:/var/run/docker.sock --tag=r7rs-srfi-sagittarius'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'make clean'

                    // If the implementation is compiler then compile the SRFI library
                    //sh 'if [ ! "" = "" ]; then  srfi/64.sld ; fi'

                    sh 'sash srfi-test/64.scm'

                    // If the implementation makes executable then run it
                    sh 'test -f srfi-test/64 && ./srfi-test/64'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/64'

                    //sh 'find . -iname "*.log" -exec rename _SRFI-64-sagittarius.log .log '{}' \\;'
                    archiveArtifacts artifacts: '*.log'
                }
            }
        }

        stage("SRFI-64 - stklos") {
            agent {
                dockerfile {
                    filename 'Dockerfile.jenkins'
                    dir '.'
                    args '--build-arg IMPLEMENTATION=stklos -v ${PWD}:/workdir --privileged -v /var/run/docker.sock:/var/run/docker.sock --tag=r7rs-srfi-stklos'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'make clean'

                    // If the implementation is compiler then compile the SRFI library
                    //sh 'if [ ! "" = "" ]; then  srfi/64.sld ; fi'

                    sh 'stklos -I . srfi-test/64.scm'

                    // If the implementation makes executable then run it
                    sh 'test -f srfi-test/64 && ./srfi-test/64'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/64'

                    //sh 'find . -iname "*.log" -exec rename _SRFI-64-stklos.log .log '{}' \\;'
                    archiveArtifacts artifacts: '*.log'
                }
            }
        }

        stage("SRFI-64 - skint") {
            agent {
                dockerfile {
                    filename 'Dockerfile.jenkins'
                    dir '.'
                    args '--build-arg IMPLEMENTATION=skint -v ${PWD}:/workdir --privileged -v /var/run/docker.sock:/var/run/docker.sock --tag=r7rs-srfi-skint'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'make clean'

                    // If the implementation is compiler then compile the SRFI library
                    //sh 'if [ ! "" = "" ]; then  srfi/64.sld ; fi'

                    sh 'skint --program srfi-test/64.scm'

                    // If the implementation makes executable then run it
                    sh 'test -f srfi-test/64 && ./srfi-test/64'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/64'

                    //sh 'find . -iname "*.log" -exec rename _SRFI-64-skint.log .log '{}' \\;'
                    archiveArtifacts artifacts: '*.log'
                }
            }
        }

        stage("SRFI-64 - tr7") {
            agent {
                dockerfile {
                    filename 'Dockerfile.jenkins'
                    dir '.'
                    args '--build-arg IMPLEMENTATION=tr7 -v ${PWD}:/workdir --privileged -v /var/run/docker.sock:/var/run/docker.sock --tag=r7rs-srfi-tr7'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'make clean'

                    // If the implementation is compiler then compile the SRFI library
                    //sh 'if [ ! "" = "" ]; then  srfi/64.sld ; fi'

                    sh 'tr7i srfi-test/64.scm'

                    // If the implementation makes executable then run it
                    sh 'test -f srfi-test/64 && ./srfi-test/64'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/64'

                    //sh 'find . -iname "*.log" -exec rename _SRFI-64-tr7.log .log '{}' \\;'
                    archiveArtifacts artifacts: '*.log'
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

