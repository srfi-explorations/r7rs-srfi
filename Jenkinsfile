pipeline {
  agent any
  options { buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10')) }
  stages {
    stage("Init") {
      steps {
        sh 'rm -rf srfi-test && git clone https://github.com/srfi-explorations/srfi-test.git'
        sh 'mkdir -p logs'
      }
    }

    stage('chibi - srfi-64') {
      agent {
        docker {
          image 'schemers/chibi'
          args '-v ${PWD}:/workdir'
        }
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'ls
          sh 'cd /workdir && chibi-scheme -I srfi srfi-test/64.scm'
          sh 'cat *.log'
          sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
          sh 'mv *.log logs/'
        }
      }
    }

    stage('chicken - srfi-64') {
      agent {
        docker {
          image 'schemers/chicken'
          args '-v ${PWD}:/workdir'
        }
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'ls
          sh 'cd /workdir && csc -include-path ./srfi -X r7rs -R r7rs srfi-test/64.scm'
          sh 'cat *.log'
          sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
          sh 'mv *.log logs/'
        }
      }
    }

    stage('cyclone - srfi-64') {
      agent {
        docker {
          image 'schemers/cyclone'
          args '-v ${PWD}:/workdir'
        }
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'ls
          sh 'cd /workdir && cyclone -I . srfi-test/64.scm'
          sh 'cat *.log'
          sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
          sh 'mv *.log logs/'
        }
      }
    }

    stage('gambit - srfi-64') {
      agent {
        docker {
          image 'schemers/gambit'
          args '-v ${PWD}:/workdir'
        }
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'ls
          sh 'cd /workdir && gsc -:r7rs,search=. -exe srfi-test/64.scm'
          sh 'cat *.log'
          sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
          sh 'mv *.log logs/'
        }
      }
    }

    stage('gerbil - srfi-64') {
      agent {
        docker {
          image 'schemers/gerbil'
          args '-v ${PWD}:/workdir'
        }
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'ls
          sh 'cd /workdir && gxi srfi-test/64.scm'
          sh 'cat *.log'
          sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
          sh 'mv *.log logs/'
        }
      }
    }

    stage('gauche - srfi-64') {
      agent {
        docker {
          image 'schemers/gauche'
          args '-v ${PWD}:/workdir'
        }
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'ls
          sh 'cd /workdir && gosh srfi-test/64.scm'
          sh 'cat *.log'
          sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
          sh 'mv *.log logs/'
        }
      }
    }

    stage('guile - srfi-64') {
      agent {
        docker {
          image 'schemers/guile'
          args '-v ${PWD}:/workdir'
        }
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'ls
          sh 'cd /workdir && guile --fresh-auto-compile --r7rs -L . srfi-test/64.scm'
          sh 'cat *.log'
          sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
          sh 'mv *.log logs/'
        }
      }
    }

    stage('kawa - srfi-64') {
      agent {
        docker {
          image 'schemers/kawa'
          args '-v ${PWD}:/workdir'
        }
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'ls
          sh 'cd /workdir && kawa srfi-test/64.scm'
          sh 'cat *.log'
          sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
          sh 'mv *.log logs/'
        }
      }
    }

    stage('loko - srfi-64') {
      agent {
        docker {
          image 'schemers/loko'
          args '-v ${PWD}:/workdir'
        }
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'ls
          sh 'cd /workdir && loko -feval -std=r7rs --compile srfi-test/64.scm'
          sh 'cat *.log'
          sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
          sh 'mv *.log logs/'
        }
      }
    }

    stage('mit-scheme - srfi-64') {
      agent {
        docker {
          image 'schemers/mit-scheme'
          args '-v ${PWD}:/workdir'
        }
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'ls
          sh 'cd /workdir && mit-scheme --load srfi-test/64.scm'
          sh 'cat *.log'
          sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
          sh 'mv *.log logs/'
        }
      }
    }

    stage('racket - srfi-64') {
      agent {
        docker {
          image 'schemers/racket'
          args '-v ${PWD}:/workdir'
        }
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'ls
          sh 'cd /workdir && racket -I r7rs --make -S . --script srfi-test/64.scm'
          sh 'cat *.log'
          sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
          sh 'mv *.log logs/'
        }
      }
    }

    stage('sagittarius - srfi-64') {
      agent {
        docker {
          image 'schemers/sagittarius'
          args '-v ${PWD}:/workdir'
        }
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'ls
          sh 'cd /workdir && sash srfi-test/64.scm'
          sh 'cat *.log'
          sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
          sh 'mv *.log logs/'
        }
      }
    }

    stage('stklos - srfi-64') {
      agent {
        docker {
          image 'schemers/stklos'
          args '-v ${PWD}:/workdir'
        }
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'ls
          sh 'cd /workdir && stklos -I . srfi-test/64.scm'
          sh 'cat *.log'
          sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
          sh 'mv *.log logs/'
        }
      }
    }

    stage('skint - srfi-64') {
      agent {
        docker {
          image 'schemers/skint'
          args '-v ${PWD}:/workdir'
        }
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'ls
          sh 'cd /workdir && skint --program srfi-test/64.scm'
          sh 'cat *.log'
          sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
          sh 'mv *.log logs/'
        }
      }
    }

    stage('tr7 - srfi-64') {
      agent {
        docker {
          image 'schemers/tr7'
          args '-v ${PWD}:/workdir'
        }
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'ls
          sh 'cd /workdir && tr7i srfi-test/64.scm'
          sh 'cat *.log'
          sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
          sh 'mv *.log logs/'
        }
      }
    }
  }
}
