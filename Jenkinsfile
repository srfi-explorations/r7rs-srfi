pipeline {
  agent any
  options { buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10')) }
  stages {
    stage("Init") {
      steps {
        sh 'rm -rf srfi-test && git clone https://github.com/srfi-explorations/srfi-test.git'
        sh 'mkdir -p logs'
        stash name: 'tests', includes: 'srfi-test/*'
      }
    }

    stage('chibi - srfi-64') {
      agent {
        docker {
          image 'schemers/chibi'
        }
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          unstash 'tests'
          sh 'ls'
          sh 'ls srfi-test'
          sh 'echo "chibi-srfi-64" > test-prefix.txt'



          sh 'chibi-scheme -I srfi srfi-test/64.scm'
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
        }
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          unstash 'tests'
          sh 'ls'
          sh 'ls srfi-test'
          sh 'echo "chicken-srfi-64" > test-prefix.txt'
          sh 'cp srfi/64.sld srfi-64.sld
          sh 'csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-64.sld'

          sh 'csc -include-path ./srfi -X r7rs -R r7rs srfi-test/64.scm'
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
        }
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          unstash 'tests'
          sh 'ls'
          sh 'ls srfi-test'
          sh 'echo "cyclone-srfi-64" > test-prefix.txt'


          sh 'cyclone -I . srfi/64.sld'
          sh 'cyclone -I . srfi-test/64.scm'
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
        }
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          unstash 'tests'
          sh 'ls'
          sh 'ls srfi-test'
          sh 'echo "gambit-srfi-64" > test-prefix.txt'


          sh 'gsc -:r7rs -dynamic srfi/64.sld'
          sh 'gsc -:r7rs,search=. -exe srfi-test/64.scm'
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
        }
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          unstash 'tests'
          sh 'ls'
          sh 'ls srfi-test'
          sh 'echo "gerbil-srfi-64" > test-prefix.txt'



          sh 'gxi srfi-test/64.scm'
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
        }
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          unstash 'tests'
          sh 'ls'
          sh 'ls srfi-test'
          sh 'echo "gauche-srfi-64" > test-prefix.txt'



          sh 'gosh srfi-test/64.scm'
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
        }
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          unstash 'tests'
          sh 'ls'
          sh 'ls srfi-test'
          sh 'echo "guile-srfi-64" > test-prefix.txt'



          sh 'guile --fresh-auto-compile --r7rs -L . srfi-test/64.scm'
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
        }
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          unstash 'tests'
          sh 'ls'
          sh 'ls srfi-test'
          sh 'echo "kawa-srfi-64" > test-prefix.txt'



          sh 'kawa srfi-test/64.scm'
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
        }
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          unstash 'tests'
          sh 'ls'
          sh 'ls srfi-test'
          sh 'echo "loko-srfi-64" > test-prefix.txt'



          sh 'loko -feval -std=r7rs --compile srfi-test/64.scm'
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
        }
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          unstash 'tests'
          sh 'ls'
          sh 'ls srfi-test'
          sh 'echo "mit-scheme-srfi-64" > test-prefix.txt'



          sh 'mit-scheme --load srfi-test/64.scm'
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
        }
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          unstash 'tests'
          sh 'ls'
          sh 'ls srfi-test'
          sh 'echo "racket-srfi-64" > test-prefix.txt'



          sh 'racket -I r7rs --make -S . --script srfi-test/64.scm'
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
        }
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          unstash 'tests'
          sh 'ls'
          sh 'ls srfi-test'
          sh 'echo "sagittarius-srfi-64" > test-prefix.txt'



          sh 'sash srfi-test/64.scm'
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
        }
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          unstash 'tests'
          sh 'ls'
          sh 'ls srfi-test'
          sh 'echo "stklos-srfi-64" > test-prefix.txt'



          sh 'stklos -I . srfi-test/64.scm'
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
        }
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          unstash 'tests'
          sh 'ls'
          sh 'ls srfi-test'
          sh 'echo "skint-srfi-64" > test-prefix.txt'



          sh 'skint --program srfi-test/64.scm'
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
        }
      }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          unstash 'tests'
          sh 'ls'
          sh 'ls srfi-test'
          sh 'echo "tr7-srfi-64" > test-prefix.txt'



          sh 'tr7i srfi-test/64.scm'
          sh 'cat *.log'
          sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
          sh 'mv *.log logs/'
        }
      }
    }
  }
}
