pipeline {
    agent {
        label 'parallel'
    }

    triggers {
      GenericTrigger(
        genericVariables: [[key: 'ref', value: '$.ref']],
        causeString: 'Triggered on $ref',
        printContributedVariables: true,
        printPostContent: true,
        silentResponse: false,
        shouldNotFlatten: false,
        regexpFilterText: '$ref',
        regexpFilterExpression: 'refs/heads/' + BRANCH_NAME
      )
    }

    options {
        disableConcurrentBuilds()
        buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10'))
    }

    environment {
        DOCKER_ARGS='-t --user=root -v /var/cache/apt:/tmp/r7rs-srfi-apt-cache --cpus=1 --memory=1G --rm'
        LABEL='parallel'
    }

    stages {
        /*
        stage('SRFI files') {
            agent {
                docker {
                    image "debian:trixie-slim"
                    reuseNode 'true'
                    args "${env.DOCKER_ARGS}"
                }
            }
            steps {
                sh "apt-get update && apt-get install -y curl"
                sh "/bin/sh srfis.sh"
                archiveArtifacts artifacts: "srfis/*.txt", allowEmptyArchive: 'false'
            }
        }
        */
        stage('Build stash') {
            agent {
                docker {
                    image "debian:trixie-slim"
                    reuseNode 'true'
                    args "${env.DOCKER_ARGS}"
                }
            }
            steps {
                sh "apt-get update && apt-get install -y git ca-certificates gcc make"
                sh "git clone https://github.com/ashinn/chibi-scheme.git --depth=1 || true"
                sh "make -C chibi-scheme"
                sh "make -C chibi-scheme install"
                stash includes: 'chibi-scheme/**', name: 'chibi'

                sh "rm -rf srfi-test"
                sh "make srfi-test"
                stash includes: 'srfi-test/**', name: 'tests'
            }
        }

        stage('Parallel') {
            parallel {
                /* FIXME
                stage('Capyscheme') {
                    agent {
                        docker {
                            label "${env.LABEL}"
                            image "schemers/capyscheme"
                            args "${env.DOCKER_ARGS}"
                        }
                    }
                    steps {
                        sh "capy --version | awk '{print(\$2)}' > capyscheme_version.txt"
                        script {
                            scheme_stage("capyscheme")
                        }
                    }
                }
                */
                stage('Chibi') {
                    agent {
                        docker {
                            label "${env.LABEL}"
                            image "schemers/chibi"
                            args "${env.DOCKER_ARGS}"
                        }
                    }
                    steps {
                        sh "chibi-scheme -V | awk '{print(\$2)}' > chibi_version.txt"
                        script {
                            scheme_stage("chibi")
                        }
                        cleanWs()
                    }
                }
                /*
                stage('Chicken') {
                    agent {
                        docker {
                            label "${env.LABEL}"
                            image "schemers/chicken"
                            args "${env.DOCKER_ARGS}"
                        }
                    }
                    steps {
                        sh "csi -version | grep Version | awk '{print(\$2)}' > chicken_version.txt"
                        script {
                            scheme_stage("chicken")
                        }
                        cleanWs()
                    }
                }
                stage('Cyclone') {
                    agent {
                        docker {
                            label "${env.LABEL}"
                            image "schemers/cyclone"
                            args "${env.DOCKER_ARGS}"
                        }
                    }
                    steps {
                        sh "icyc -v | grep Version | awk '{print(\$4)}' > cyclone_version.txt"
                        script {
                            scheme_stage("cyclone")
                        }
                        cleanWs()
                    }
                }
                stage('Foment') {
                    agent {
                        docker {
                            label "${env.LABEL}"
                            image "schemers/foment"
                            args "${env.DOCKER_ARGS}"
                        }
                    }
                    steps {
                        sh "foment -v | grep Foment | awk '{print(\$3)}' > foment_version.txt"
                        script {
                            scheme_stage("foment")
                        }
                    }
                }
                */
                /* FIXME
                stage('Gambit') {
                    agent {
                        docker {
                            label "${env.LABEL}"
                            image "schemers/gambit"
                            args "${env.DOCKER_ARGS}"
                        }
                    }
                    steps {
                        script {
                            sh "gsi -v | awk '{print(\$1)}' | tr -d 'v' > gambit_version.txt"
                            scheme_stage("gambit")
                        }
                        cleanWs()
                    }
                }
                */
                /*
                stage('Gauche') {
                    agent {
                        docker {
                            label "${env.LABEL}"
                            image "schemers/gauche"
                            args "${env.DOCKER_ARGS}"
                        }
                    }
                    steps {
                        sh "gosh -V | grep Gauche | awk '{print(\$5)}' > gauche_version.txt"
                        script {
                            scheme_stage("gauche")
                        }
                        cleanWs()
                    }
                }
                stage('Guile') {
                    agent {
                        docker {
                            label "${env.LABEL}"
                            image "schemers/guile"
                            args "${env.DOCKER_ARGS}"
                        }
                    }
                    steps {
                        sh "guile --version | grep guile | awk '{print(\$4)}' > guile_version.txt"
                        script {
                            scheme_stage("guile")
                        }
                        cleanWs()
                    }
                }
                stage('Kawa') {
                    agent {
                        docker {
                            label "${env.LABEL}"
                            image "schemers/kawa"
                            args "${env.DOCKER_ARGS}"
                        }
                    }
                    steps {
                        sh "kawa --version | grep Kawa | awk '{print(\$2)}' > kawa_version.txt"
                        script {
                            scheme_stage("kawa")
                        }
                        cleanWs()
                    }
                }
                stage('Loko') {
                    agent {
                        docker {
                            label "${env.LABEL}"
                            image "schemers/loko"
                            args "${env.DOCKER_ARGS}"
                        }
                    }
                    steps {
                        sh "echo '(import (loko)) (display (loko-version)) (newline)' > loko_version.scm"
                        sh "loko --program loko_version.scm > loko_version.txt"
                        script {
                            scheme_stage("loko")
                        }
                        cleanWs()
                    }
                }
                stage('Meevax') {
                    agent {
                        docker {
                            label "${env.LABEL}"
                            image "schemers/meevax"
                            args "${env.DOCKER_ARGS}"
                        }
                    }
                    steps {
                        sh "meevax --version > meevax_version.txt"
                        script {
                            scheme_stage("meevax")
                        }
                        cleanWs()
                    }
                }
                stage('MIT-Scheme') {
                    agent {
                        docker {
                            label "${env.LABEL}"
                            image "schemers/mit-scheme"
                            args "${env.DOCKER_ARGS}"
                        }
                    }
                    steps {
                        sh "mit-scheme --version | grep MIT | awk '{print(\$3)}' > mit-scheme_version.txt"
                        script {
                            scheme_stage("mit-scheme")
                        }
                        cleanWs()
                    }
                }
                stage('Mosh') {
                    agent {
                        docker {
                            label "${env.LABEL}"
                            image "schemers/mosh"
                            args "${env.DOCKER_ARGS}"
                        }
                    }
                    steps {
                        sh "mosh -v | grep Mosh | awk '{print(\$8)}' > mosh_version.txt"
                        script {
                            scheme_stage("mosh")
                        }
                        cleanWs()
                    }
                }
                stage('Larceny') {
                    agent {
                        docker {
                            label "${env.LABEL}"
                            image "schemers/larceny"
                            args "${env.DOCKER_ARGS}"
                        }
                    }
                    steps {
                        sh "larceny --version | awk '{print(\$2)}' | tr -d 'v' > larceny_version.txt"
                        script {
                            scheme_stage("larceny")
                        }
                    }
                }
                stage('Racket') {
                    agent {
                        docker {
                            label "${env.LABEL}"
                            image "schemers/racket"
                            args "${env.DOCKER_ARGS}"
                        }
                    }
                    steps {
                        sh "racket --version | awk '{print(\$4)}' | tr -d 'v' > racket_version.txt"
                        script {
                            scheme_stage("racket")
                        }
                        cleanWs()
                    }
                }
                stage('Sagittarius') {
                    agent {
                        docker {
                            label "${env.LABEL}"
                            image "schemers/sagittarius"
                            args "${env.DOCKER_ARGS}"
                        }
                    }
                    steps {
                        sh "sash --version | awk '{print(\$5)}' > sagittarius_version.txt"
                        script {
                            scheme_stage("sagittarius")
                        }
                        cleanWs()
                    }
                }
                stage('Skint') {
                    agent {
                        docker {
                            label "${env.LABEL}"
                            image "schemers/skint"
                            args "${env.DOCKER_ARGS}"
                        }
                    }
                    steps {
                        sh "skint --version | grep version | awk -F '\"' '{print(\$2)}' > skint_version.txt"
                        script {
                            scheme_stage("skint")
                        }
                        cleanWs()
                    }
                }
                stage('STklos') {
                    agent {
                        docker {
                            label "${env.LABEL}"
                            image "schemers/stklos"
                            args "${env.DOCKER_ARGS}"
                        }
                    }
                    steps {
                        sh "stklos --version | grep stklos | awk '{print(\$2)}' > stklos_version.txt"
                        script {
                            scheme_stage("stklos")
                        }
                        cleanWs()
                    }
                }
                stage('tr7') {
                    agent {
                        docker {
                            label "${env.LABEL}"
                            image "schemers/tr7"
                            args "${env.DOCKER_ARGS}"
                        }
                    }
                    steps {
                        sh "printf '(exit)\n' | tr7i | grep TR7 | awk '{print(\$5)}' > tr7_version.txt"
                        script {
                            scheme_stage("tr7")
                        }
                        cleanWs()
                    }
                }
                stage('Ypsilon') {
                    agent {
                        docker {
                            label "${env.LABEL}"
                            image "schemers/ypsilon"
                            args "${env.DOCKER_ARGS}"
                        }
                    }
                    steps {
                        sh "ypsilon --version | awk -F '-' '{print(\$2)}' | awk '{print(\$1)}' > ypsilon_version.txt"
                        script {
                            scheme_stage("ypsilon")
                        }
                        cleanWs()
                    }
                }
                */
            }
        }
    }

    post {
        success {
            sh "date --utc --iso-8601=minutes > timestamp.txt"
            archiveArtifacts artifacts: "timestamp.txt", allowEmptyArchive: 'true'
        }
        always {
            cleanWs()
        }
    }
}

def scheme_stage(scheme) {
    def stages = []
    stages.plus(stage("Container init") {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            archiveArtifacts artifacts: "${scheme}_version.txt", allowEmptyArchive: 'true'
            sh "echo 'Acquire::http { Proxy \"http://rm-t490:3142\"; }' > /etc/apt/apt.conf.d/99proxy"
            sh "apt-get update && apt-get install -y git ca-certificates gcc make libffi-dev coreutils sudo && mkdir -p /root/.snow && echo '()' > /root/.snow/config.scm"
            unstash 'chibi'
            sh 'make -C chibi-scheme install && snow-chibi install --impls=chibi retropikzel.compile-r7rs'
            sh 'useradd r7rstester -m'
            sh 'echo "r7rstester ALL = NOPASSWD: /usr/bin/cp" >> /etc/sudoers'
            sh "runuser -u r7rstester -- mkdir -p /home/r7rstester/.snow && echo '()' > /home/r7rstester/.snow/config.scm"
            sh "runuser -u r7rstester -- snow-chibi update"
            unstash 'tests'
        }
    })

    stages.plus(stage("${scheme}") {
        def srfis = "64" //readFile "test_srfis.txt"
        srfis.split().each { srfi ->
            def resultdir = "results/${srfi}/${scheme}"
            def cmd = "make SCHEME=${scheme} SRFI=${srfi} all install test-compile-r7rs-tap"
            stage("SRFI-${srfi}") {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh "mkdir -p '${resultdir}' && chmod -R 777 . && snow-chibi install --impls=${scheme} --always-yes --skip-tests?=1 srfi.64 retropikzel.tap"
                    sh "timeout 120 runuser -u r7rstester -- ${cmd} 2>&1 | tee '${resultdir}/out.txt'"
                }
                archiveArtifacts artifacts: "${scheme}_version.txt, ${resultdir}/out.txt", allowEmptyArchive: 'true'
            }
        }
    })
    return stages
}
