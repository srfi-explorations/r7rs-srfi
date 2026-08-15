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
        DOCKER_ARGS='--user=root -v /var/cache/apt/archives/:/tmp/srfi-support-table-apt-cache'
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
            sh "apt-get update && apt-get install -y git ca-certificates gcc make libffi-dev coreutils sudo && mkdir -p /root/.snow && echo '()' > /root/.snow/config.scm"
            unstash 'chibi'
            sh 'make -C chibi-scheme install && snow-chibi install --impls=chibi retropikzel.compile-r7rs"
            sh 'useradd r7rstester -m && echo "r7rstester ALL=(root) /usr/bin/cp" >> /etc/sudoers'
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
                    sh "mkdir -p '${resultdir}' && chmod -R 777 . && snow-chibi install --impls=${scheme} retropikzel.tap"
                    sh "timeout 120 runuser -u r7rstester -- ${cmd} 2>&1 | tee '${resultdir}/out.txt'"
                }
                archiveArtifacts artifacts: "${scheme}_version.txt, ${resultdir}/out.txt", allowEmptyArchive: 'true'
            }
        }
    })
    return stages
}
