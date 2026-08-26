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
        SCM_TAP_NO_EXIT_FAIL=1
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
                            args "${env.DOCKER_ARGS}"
                            additionalBuildArgs "--build-arg SCHEME=chibi --tag=r7rs-srfi-chibi"
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
                stage('Chicken') {
                    agent {
                        dockerfile {
                            filename 'Dockerfile.jenkins'
                            label "${env.LABEL}"
                            args "${env.DOCKER_ARGS}"
                            additionalBuildArgs "--build-arg SCHEME=chicken --tag=r7rs-srfi-chicken"
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
                stage('Foment') {
                    agent {
                        dockerfile {
                            filename 'Dockerfile.jenkins'
                            label "${env.LABEL}"
                            args "${env.DOCKER_ARGS}"
                            additionalBuildArgs "--build-arg SCHEME=foment --tag=r7rs-srfi-foment"
                        }
                    }
                    steps {
                        sh "foment -v | grep Foment | awk '{print(\$3)}' > foment_version.txt"
                        script {
                            scheme_stage("foment")
                        }
                    }
                }
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
                stage('Gauche') {
                    agent {
                        dockerfile {
                            filename 'Dockerfile.jenkins'
                            label "${env.LABEL}"
                            args "${env.DOCKER_ARGS}"
                            additionalBuildArgs "--build-arg SCHEME=gauche --tag=r7rs-srfi-gauche"
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
                        dockerfile {
                            filename 'Dockerfile.jenkins'
                            label "${env.LABEL}"
                            args "${env.DOCKER_ARGS}"
                            additionalBuildArgs "--build-arg SCHEME=guile --tag=r7rs-srfi-guile"
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
                        dockerfile {
                            filename 'Dockerfile.jenkins'
                            label "${env.LABEL}"
                            args "${env.DOCKER_ARGS}"
                            additionalBuildArgs "--build-arg SCHEME=kawa --tag=r7rs-srfi-kawa"
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
                        dockerfile {
                            filename 'Dockerfile.jenkins'
                            label "${env.LABEL}"
                            args "${env.DOCKER_ARGS}"
                            additionalBuildArgs "--build-arg SCHEME=loko --tag=r7rs-srfi-loko"
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
                stage('Mosh') {
                    agent {
                        dockerfile {
                            filename 'Dockerfile.jenkins'
                            label "${env.LABEL}"
                            args "${env.DOCKER_ARGS}"
                            additionalBuildArgs "--build-arg SCHEME=mosh --tag=r7rs-srfi-mosh"
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
                stage('Racket') {
                    agent {
                        dockerfile {
                            filename 'Dockerfile.jenkins'
                            label "${env.LABEL}"
                            args "${env.DOCKER_ARGS}"
                            additionalBuildArgs "--build-arg SCHEME=racket --tag=r7rs-srfi-racket"
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
                        dockerfile {
                            filename 'Dockerfile.jenkins'
                            label "${env.LABEL}"
                            args "${env.DOCKER_ARGS}"
                            additionalBuildArgs "--build-arg SCHEME=sagittarius --tag=r7rs-srfi-sagittarius"
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
                        dockerfile {
                            filename 'Dockerfile.jenkins'
                            label "${env.LABEL}"
                            args "${env.DOCKER_ARGS}"
                            additionalBuildArgs "--build-arg SCHEME=skint --tag=r7rs-srfi-skint"
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
                        dockerfile {
                            filename 'Dockerfile.jenkins'
                            label "${env.LABEL}"
                            args "${env.DOCKER_ARGS}"
                            additionalBuildArgs "--build-arg SCHEME=stklos --tag=r7rs-srfi-stklos"
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
                        dockerfile {
                            filename 'Dockerfile.jenkins'
                            label "${env.LABEL}"
                            args "${env.DOCKER_ARGS}"
                            additionalBuildArgs "--build-arg SCHEME=tr7 --tag=r7rs-srfi-tr7"
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
                        dockerfile {
                            filename 'Dockerfile.jenkins'
                            label "${env.LABEL}"
                            args "${env.DOCKER_ARGS}"
                            additionalBuildArgs "--build-arg SCHEME=ypsilon --tag=r7rs-srfi-ypsilon"
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
        sh "cp -r /opt/srfi-test ."
        archiveArtifacts artifacts: "${scheme}_version.txt", allowEmptyArchive: 'true'
        def srfis = readFile "test_srfis.txt"
        srfis.split().each { srfi ->
            def resultdir = "results/${srfi}/${scheme}"
            def cmd = "make SCHEME=${scheme} SRFI=${srfi} all install test-compile-r7rs-tap"
            stage("SRFI-${srfi}") {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh "mkdir -p ${resultdir}"
                    sh "echo '# running command ${cmd}' > ${resultdir}/out.txt"
                    sh "timeout 600 ${cmd} 2>&1 >> ${resultdir}/out.txt || exit 0"
                }
                sh "cat ${resultdir}/out.txt"
                archiveArtifacts artifacts: "${scheme}_version.txt, ${resultdir}/out.txt", allowEmptyArchive: 'true'
            }
        }
    })
    return stages
}
