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
        string(name: 'ONLY_SRFI_NUMBER', defaultValue: '', description: 'Build only SRFI of given number, leave empty to build all')
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
              sh '(cd srfi-test && make clean build)'
              sh 'tree srfi-test'
            }
        }

        stage("SRFI-8 - chibi") {
            agent {
                docker {
                    image 'schemers/chibi'
                    reuseNode true
                }
            }
            when {
                expression {
                    params.ONLY_SRFI_NUMBER == '' || params.ONLY_SRFI_NUMBER == '8'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'
                    sh 'find . -name "*.so" -delete'
                    sh 'find . -name "*.o" -delete'
                    sh 'find . -name "*.o" -delete'

                    
                    sh 'chibi-scheme -I ./srfi srfi-test/r7rs-programs/8.scm'


                    // Change any logfiles to identify implementatio nand SRFI and stash them
                    unstash 'reports'
                    sh 'for f in *.log; do cp -- "$f" "reports/SRFI-8-chibi.log"; done'
                    sh 'ls reports'
                    stash name: 'reports', includes: 'reports/*'
                    archiveArtifacts artifacts: 'reports/*.log'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/8'


                    // Check if all tests passed, dont put anything after this on fail it wont be run
                    sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
                }
            }
        }

        stage("SRFI-8 - chicken") {
            agent {
                docker {
                    image 'schemers/chicken'
                    reuseNode true
                }
            }
            when {
                expression {
                    params.ONLY_SRFI_NUMBER == '' || params.ONLY_SRFI_NUMBER == '8'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'
                    sh 'find . -name "*.so" -delete'
                    sh 'find . -name "*.o" -delete'
                    sh 'find . -name "*.o" -delete'

                    sh 'cp srfi/64.sld srfi-64.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-64.sld  && cp srfi/8.sld srfi-8.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-8.sld'
                    sh 'csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/8.scm && srfi-test/r7rs-programs/8 && rm srfi-test/r7rs-programs/8'


                    // Change any logfiles to identify implementatio nand SRFI and stash them
                    unstash 'reports'
                    sh 'for f in *.log; do cp -- "$f" "reports/SRFI-8-chicken.log"; done'
                    sh 'ls reports'
                    stash name: 'reports', includes: 'reports/*'
                    archiveArtifacts artifacts: 'reports/*.log'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/8'


                    // Check if all tests passed, dont put anything after this on fail it wont be run
                    sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
                }
            }
        }

        stage("SRFI-8 - cyclone") {
            agent {
                docker {
                    image 'schemers/cyclone'
                    reuseNode true
                }
            }
            when {
                expression {
                    params.ONLY_SRFI_NUMBER == '' || params.ONLY_SRFI_NUMBER == '8'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'
                    sh 'find . -name "*.so" -delete'
                    sh 'find . -name "*.o" -delete'
                    sh 'find . -name "*.o" -delete'

                    sh 'cyclone -A . srfi/64.sld  && cyclone -A . srfi/8.sld'
                    sh 'cyclone -A . srfi-test/r7rs-programs/8.scm && srfi-test/r7rs-programs/8 && rm srfi-test/r7rs-programs/8'


                    // Change any logfiles to identify implementatio nand SRFI and stash them
                    unstash 'reports'
                    sh 'for f in *.log; do cp -- "$f" "reports/SRFI-8-cyclone.log"; done'
                    sh 'ls reports'
                    stash name: 'reports', includes: 'reports/*'
                    archiveArtifacts artifacts: 'reports/*.log'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/8'


                    // Check if all tests passed, dont put anything after this on fail it wont be run
                    sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
                }
            }
        }

        stage("SRFI-8 - gambit") {
            agent {
                docker {
                    image 'schemers/gambit'
                    reuseNode true
                }
            }
            when {
                expression {
                    params.ONLY_SRFI_NUMBER == '' || params.ONLY_SRFI_NUMBER == '8'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'
                    sh 'find . -name "*.so" -delete'
                    sh 'find . -name "*.o" -delete'
                    sh 'find . -name "*.o" -delete'

                    sh 'gsc . srfi/64.sld  && gsc . srfi/8.sld'
                    sh 'gsc -exe . -nopreload srfi-test/r7rs-programs/8.scm && srfi-test/r7rs-programs/8 && rm srfi-test/r7rs-programs/8'


                    // Change any logfiles to identify implementatio nand SRFI and stash them
                    unstash 'reports'
                    sh 'for f in *.log; do cp -- "$f" "reports/SRFI-8-gambit.log"; done'
                    sh 'ls reports'
                    stash name: 'reports', includes: 'reports/*'
                    archiveArtifacts artifacts: 'reports/*.log'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/8'


                    // Check if all tests passed, dont put anything after this on fail it wont be run
                    sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
                }
            }
        }

        stage("SRFI-8 - gauche") {
            agent {
                docker {
                    image 'schemers/gauche'
                    reuseNode true
                }
            }
            when {
                expression {
                    params.ONLY_SRFI_NUMBER == '' || params.ONLY_SRFI_NUMBER == '8'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'
                    sh 'find . -name "*.so" -delete'
                    sh 'find . -name "*.o" -delete'
                    sh 'find . -name "*.o" -delete'

                    
                    sh 'gosh srfi-test/r7rs-programs/8.scm'


                    // Change any logfiles to identify implementatio nand SRFI and stash them
                    unstash 'reports'
                    sh 'for f in *.log; do cp -- "$f" "reports/SRFI-8-gauche.log"; done'
                    sh 'ls reports'
                    stash name: 'reports', includes: 'reports/*'
                    archiveArtifacts artifacts: 'reports/*.log'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/8'


                    // Check if all tests passed, dont put anything after this on fail it wont be run
                    sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
                }
            }
        }

        stage("SRFI-8 - guile") {
            agent {
                docker {
                    image 'schemers/guile'
                    reuseNode true
                }
            }
            when {
                expression {
                    params.ONLY_SRFI_NUMBER == '' || params.ONLY_SRFI_NUMBER == '8'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'
                    sh 'find . -name "*.so" -delete'
                    sh 'find . -name "*.o" -delete'
                    sh 'find . -name "*.o" -delete'

                    
                    sh 'guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/8.scm'


                    // Change any logfiles to identify implementatio nand SRFI and stash them
                    unstash 'reports'
                    sh 'for f in *.log; do cp -- "$f" "reports/SRFI-8-guile.log"; done'
                    sh 'ls reports'
                    stash name: 'reports', includes: 'reports/*'
                    archiveArtifacts artifacts: 'reports/*.log'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/8'


                    // Check if all tests passed, dont put anything after this on fail it wont be run
                    sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
                }
            }
        }

        stage("SRFI-8 - kawa") {
            agent {
                docker {
                    image 'schemers/kawa'
                    reuseNode true
                }
            }
            when {
                expression {
                    params.ONLY_SRFI_NUMBER == '' || params.ONLY_SRFI_NUMBER == '8'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'
                    sh 'find . -name "*.so" -delete'
                    sh 'find . -name "*.o" -delete'
                    sh 'find . -name "*.o" -delete'

                    
                    sh 'kawa --r7rs -Dkawa.import.path=..:*.sld srfi-test/r7rs-programs/8.scm'


                    // Change any logfiles to identify implementatio nand SRFI and stash them
                    unstash 'reports'
                    sh 'for f in *.log; do cp -- "$f" "reports/SRFI-8-kawa.log"; done'
                    sh 'ls reports'
                    stash name: 'reports', includes: 'reports/*'
                    archiveArtifacts artifacts: 'reports/*.log'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/8'


                    // Check if all tests passed, dont put anything after this on fail it wont be run
                    sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
                }
            }
        }

        stage("SRFI-8 - loko") {
            agent {
                docker {
                    image 'schemers/loko'
                    reuseNode true
                }
            }
            when {
                expression {
                    params.ONLY_SRFI_NUMBER == '' || params.ONLY_SRFI_NUMBER == '8'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'
                    sh 'find . -name "*.so" -delete'
                    sh 'find . -name "*.o" -delete'
                    sh 'find . -name "*.o" -delete'

                    sh 'ls srfi/64.sld  && ls srfi/8.sld'
                    sh 'LOKO_LIBRARY_FILE_EXTENSIONS=.sld loko -std=r7rs --compile srfi-test/r7rs-programs/8.scm && srfi-test/r7rs-programs/8 && rm srfi-test/r7rs-programs/8'


                    // Change any logfiles to identify implementatio nand SRFI and stash them
                    unstash 'reports'
                    sh 'for f in *.log; do cp -- "$f" "reports/SRFI-8-loko.log"; done'
                    sh 'ls reports'
                    stash name: 'reports', includes: 'reports/*'
                    archiveArtifacts artifacts: 'reports/*.log'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/8'


                    // Check if all tests passed, dont put anything after this on fail it wont be run
                    sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
                }
            }
        }

        stage("SRFI-8 - mit-scheme") {
            agent {
                docker {
                    image 'schemers/mit-scheme'
                    reuseNode true
                }
            }
            when {
                expression {
                    params.ONLY_SRFI_NUMBER == '' || params.ONLY_SRFI_NUMBER == '8'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'
                    sh 'find . -name "*.so" -delete'
                    sh 'find . -name "*.o" -delete'
                    sh 'find . -name "*.o" -delete'

                    
                    sh 'mit-scheme --load srfi-test/r7rs-programs/8.scm'


                    // Change any logfiles to identify implementatio nand SRFI and stash them
                    unstash 'reports'
                    sh 'for f in *.log; do cp -- "$f" "reports/SRFI-8-mit-scheme.log"; done'
                    sh 'ls reports'
                    stash name: 'reports', includes: 'reports/*'
                    archiveArtifacts artifacts: 'reports/*.log'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/8'


                    // Check if all tests passed, dont put anything after this on fail it wont be run
                    sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
                }
            }
        }

        stage("SRFI-8 - sagittarius") {
            agent {
                docker {
                    image 'schemers/sagittarius'
                    reuseNode true
                }
            }
            when {
                expression {
                    params.ONLY_SRFI_NUMBER == '' || params.ONLY_SRFI_NUMBER == '8'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'
                    sh 'find . -name "*.so" -delete'
                    sh 'find . -name "*.o" -delete'
                    sh 'find . -name "*.o" -delete'

                    
                    sh 'sash -r7 -L ./srfi srfi-test/r7rs-programs/8.scm > srfi-8.log '


                    // Change any logfiles to identify implementatio nand SRFI and stash them
                    unstash 'reports'
                    sh 'for f in *.log; do cp -- "$f" "reports/SRFI-8-sagittarius.log"; done'
                    sh 'ls reports'
                    stash name: 'reports', includes: 'reports/*'
                    archiveArtifacts artifacts: 'reports/*.log'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/8'


                    // Check if all tests passed, dont put anything after this on fail it wont be run
                    sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
                }
            }
        }

        stage("SRFI-8 - stklos") {
            agent {
                docker {
                    image 'schemers/stklos'
                    reuseNode true
                }
            }
            when {
                expression {
                    params.ONLY_SRFI_NUMBER == '' || params.ONLY_SRFI_NUMBER == '8'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'
                    sh 'find . -name "*.so" -delete'
                    sh 'find . -name "*.o" -delete'
                    sh 'find . -name "*.o" -delete'

                    
                    sh 'stklos -I . srfi-test/r7rs-programs/8.scm'


                    // Change any logfiles to identify implementatio nand SRFI and stash them
                    unstash 'reports'
                    sh 'for f in *.log; do cp -- "$f" "reports/SRFI-8-stklos.log"; done'
                    sh 'ls reports'
                    stash name: 'reports', includes: 'reports/*'
                    archiveArtifacts artifacts: 'reports/*.log'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/8'


                    // Check if all tests passed, dont put anything after this on fail it wont be run
                    sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
                }
            }
        }

        stage("SRFI-8 - skint") {
            agent {
                docker {
                    image 'schemers/skint'
                    reuseNode true
                }
            }
            when {
                expression {
                    params.ONLY_SRFI_NUMBER == '' || params.ONLY_SRFI_NUMBER == '8'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'
                    sh 'find . -name "*.so" -delete'
                    sh 'find . -name "*.o" -delete'
                    sh 'find . -name "*.o" -delete'

                    
                    sh 'skint --program srfi-test/r7rs-programs/8.scm'


                    // Change any logfiles to identify implementatio nand SRFI and stash them
                    unstash 'reports'
                    sh 'for f in *.log; do cp -- "$f" "reports/SRFI-8-skint.log"; done'
                    sh 'ls reports'
                    stash name: 'reports', includes: 'reports/*'
                    archiveArtifacts artifacts: 'reports/*.log'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/8'


                    // Check if all tests passed, dont put anything after this on fail it wont be run
                    sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
                }
            }
        }

        stage("SRFI-8 - tr7") {
            agent {
                docker {
                    image 'schemers/tr7'
                    reuseNode true
                }
            }
            when {
                expression {
                    params.ONLY_SRFI_NUMBER == '' || params.ONLY_SRFI_NUMBER == '8'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'
                    sh 'find . -name "*.so" -delete'
                    sh 'find . -name "*.o" -delete'
                    sh 'find . -name "*.o" -delete'

                    
                    sh 'tr7i srfi-test/r7rs-programs/8.scm'


                    // Change any logfiles to identify implementatio nand SRFI and stash them
                    unstash 'reports'
                    sh 'for f in *.log; do cp -- "$f" "reports/SRFI-8-tr7.log"; done'
                    sh 'ls reports'
                    stash name: 'reports', includes: 'reports/*'
                    archiveArtifacts artifacts: 'reports/*.log'

                    // Clean up possible executables
                    sh 'rm -rf srfi-test/8'


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
            when {
                expression {
                    params.ONLY_SRFI_NUMBER == '' || params.ONLY_SRFI_NUMBER == '64'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'
                    sh 'find . -name "*.so" -delete'
                    sh 'find . -name "*.o" -delete'
                    sh 'find . -name "*.o" -delete'

                    
                    sh 'chibi-scheme -I ./srfi srfi-test/r7rs-programs/64.scm'


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
            when {
                expression {
                    params.ONLY_SRFI_NUMBER == '' || params.ONLY_SRFI_NUMBER == '64'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'
                    sh 'find . -name "*.so" -delete'
                    sh 'find . -name "*.o" -delete'
                    sh 'find . -name "*.o" -delete'

                    sh 'cp srfi/64.sld srfi-64.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-64.sld  && cp srfi/64.sld srfi-64.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-64.sld'
                    sh 'csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/64.scm && srfi-test/r7rs-programs/64 && rm srfi-test/r7rs-programs/64'


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
            when {
                expression {
                    params.ONLY_SRFI_NUMBER == '' || params.ONLY_SRFI_NUMBER == '64'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'
                    sh 'find . -name "*.so" -delete'
                    sh 'find . -name "*.o" -delete'
                    sh 'find . -name "*.o" -delete'

                    sh 'cyclone -A . srfi/64.sld  && cyclone -A . srfi/64.sld'
                    sh 'cyclone -A . srfi-test/r7rs-programs/64.scm && srfi-test/r7rs-programs/64 && rm srfi-test/r7rs-programs/64'


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
            when {
                expression {
                    params.ONLY_SRFI_NUMBER == '' || params.ONLY_SRFI_NUMBER == '64'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'
                    sh 'find . -name "*.so" -delete'
                    sh 'find . -name "*.o" -delete'
                    sh 'find . -name "*.o" -delete'

                    sh 'gsc . srfi/64.sld  && gsc . srfi/64.sld'
                    sh 'gsc -exe . -nopreload srfi-test/r7rs-programs/64.scm && srfi-test/r7rs-programs/64 && rm srfi-test/r7rs-programs/64'


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
            when {
                expression {
                    params.ONLY_SRFI_NUMBER == '' || params.ONLY_SRFI_NUMBER == '64'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'
                    sh 'find . -name "*.so" -delete'
                    sh 'find . -name "*.o" -delete'
                    sh 'find . -name "*.o" -delete'

                    
                    sh 'gosh srfi-test/r7rs-programs/64.scm'


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
            when {
                expression {
                    params.ONLY_SRFI_NUMBER == '' || params.ONLY_SRFI_NUMBER == '64'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'
                    sh 'find . -name "*.so" -delete'
                    sh 'find . -name "*.o" -delete'
                    sh 'find . -name "*.o" -delete'

                    
                    sh 'guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/64.scm'


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
            when {
                expression {
                    params.ONLY_SRFI_NUMBER == '' || params.ONLY_SRFI_NUMBER == '64'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'
                    sh 'find . -name "*.so" -delete'
                    sh 'find . -name "*.o" -delete'
                    sh 'find . -name "*.o" -delete'

                    
                    sh 'kawa --r7rs -Dkawa.import.path=..:*.sld srfi-test/r7rs-programs/64.scm'


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
            when {
                expression {
                    params.ONLY_SRFI_NUMBER == '' || params.ONLY_SRFI_NUMBER == '64'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'
                    sh 'find . -name "*.so" -delete'
                    sh 'find . -name "*.o" -delete'
                    sh 'find . -name "*.o" -delete'

                    sh 'ls srfi/64.sld  && ls srfi/64.sld'
                    sh 'LOKO_LIBRARY_FILE_EXTENSIONS=.sld loko -std=r7rs --compile srfi-test/r7rs-programs/64.scm && srfi-test/r7rs-programs/64 && rm srfi-test/r7rs-programs/64'


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
            when {
                expression {
                    params.ONLY_SRFI_NUMBER == '' || params.ONLY_SRFI_NUMBER == '64'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'
                    sh 'find . -name "*.so" -delete'
                    sh 'find . -name "*.o" -delete'
                    sh 'find . -name "*.o" -delete'

                    
                    sh 'mit-scheme --load srfi-test/r7rs-programs/64.scm'


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

        stage("SRFI-64 - sagittarius") {
            agent {
                docker {
                    image 'schemers/sagittarius'
                    reuseNode true
                }
            }
            when {
                expression {
                    params.ONLY_SRFI_NUMBER == '' || params.ONLY_SRFI_NUMBER == '64'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'
                    sh 'find . -name "*.so" -delete'
                    sh 'find . -name "*.o" -delete'
                    sh 'find . -name "*.o" -delete'

                    
                    sh 'sash -r7 -L ./srfi srfi-test/r7rs-programs/64.scm > srfi-64.log '


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
            when {
                expression {
                    params.ONLY_SRFI_NUMBER == '' || params.ONLY_SRFI_NUMBER == '64'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'
                    sh 'find . -name "*.so" -delete'
                    sh 'find . -name "*.o" -delete'
                    sh 'find . -name "*.o" -delete'

                    
                    sh 'stklos -I . srfi-test/r7rs-programs/64.scm'


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
            when {
                expression {
                    params.ONLY_SRFI_NUMBER == '' || params.ONLY_SRFI_NUMBER == '64'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'
                    sh 'find . -name "*.so" -delete'
                    sh 'find . -name "*.o" -delete'
                    sh 'find . -name "*.o" -delete'

                    
                    sh 'skint --program srfi-test/r7rs-programs/64.scm'


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
            when {
                expression {
                    params.ONLY_SRFI_NUMBER == '' || params.ONLY_SRFI_NUMBER == '64'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'find . -maxdepth 1 -name "*.log" -delete'
                    sh 'find . -name "*.so" -delete'
                    sh 'find . -name "*.o" -delete'
                    sh 'find . -name "*.o" -delete'

                    
                    sh 'tr7i srfi-test/r7rs-programs/64.scm'


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
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    unstash 'reports'
                    sh './report'
                    archiveArtifacts artifacts: 'reports/*.html'
                }
            }
        }

    }
    post {
        always {
            deleteDir()
            archiveArtifacts artifacts: 'reports/*.log'
        }
        failure {
            deleteDir()
            archiveArtifacts artifacts: 'reports/*.html'
            archiveArtifacts artifacts: 'reports/*.log'
        }
    }
}

