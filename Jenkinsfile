//Branch main at 17:00 on Wednesday
String cron_string = (scm.branches[0].name == "main") ? '0 17 * * 3' : ''

pipeline {
    agent {
        label 'debian-x86_64'
    }

    triggers {
      cron cron_string
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
        DOCKER_ARGS='-t --user=root --cpus=1 --memory=1G --memory-swap=1G --rm'
        LOKO_DOCKER_ARGS='-t --user=root --rm'
        LABEL='parallel'
        LD_LIBRARY_PATH="/opt/chibi/lib"
    }

    stages {
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
                        dockerfile {
                            filename 'Dockerfile.jenkins'
                            label "${env.LABEL}"
                            args "${env.DOCKER_ARGS} --tag=r7rs-srfi-chibi"
                            additionalBuildArgs "--build-arg SCHEME=chibi"
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
                */
                /* FIXME
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
                */
                /*
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
                            image "schemers/gambit:head"
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
                            image "schemers/guile:head"
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
                            args "${env.LOKO_DOCKER_ARGS}"
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
                */
                /* FIXME
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
                */
                /* FIXME
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
                */
                /*
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
                */
                /* FIXME
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
                */
                /*
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
                */
                stage('tr7') {
                    agent {
                        dockerfile {
                            filename 'Dockerfile.jenkins'
                            label "${env.LABEL}"
                            args "${env.DOCKER_ARGS} --tag=r7rs-srfi-tr7"
                            additionalBuildArgs "--build-arg SCHEME=tr7"
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
                /*
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
    stages.plus(stage("${scheme}") {
        archiveArtifacts artifacts: "${scheme}_version.txt", allowEmptyArchive: 'true'
        def srfis = readFile "test_srfis.txt"
        srfis.split().each { srfi ->
            def resultdir = "results/${srfi}/${scheme}"
            stage("SRFI-${srfi}") {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh "mkdir -p ${resultdir}"
                    sh "make SCHEME=${scheme} SRFI=${srfi} all install > ${resultdir}/out.txt"
                    sh "timeout 600 runuser -u r7rstester -- make SCHEME=${scheme} SRFI=${srfi} test-compile-r7rs-tap 2>&1 >> ${resultdir}/out.txt"
                }
                sh "cat ${resultdir}/out.txt"
                archiveArtifacts artifacts: "${scheme}_version.txt, ${resultdir}/out.txt", allowEmptyArchive: 'true'
            }
        }
    })
    return stages
}
