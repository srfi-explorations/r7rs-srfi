pipeline {
  agent any
  options { buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10')) }
  stages {
    stage("Init") {
      steps {
        sh 'rm -rf srfi-test && git clone https://github.com/srfi-explorations/srfi-test.git'
        sh 'mkdir -p reports'
        stash name: 'reports, includes: 'reports/*'
        sh 'echo "<h1>Test results</h1>" > reports/results.html'
        stash name: 'tests', includes: 'srfi-test/*'
      }
    }

    stage('chibi - srfi-64') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
        }
      }
    }

    stage('chicken - srfi-64') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
        }
      }
    }

    stage('cyclone - srfi-64') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
        }
      }
    }

    stage('gambit - srfi-64') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
        }
      }
    }

    stage('gerbil - srfi-64') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
        }
      }
    }

    stage('gauche - srfi-64') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
        }
      }
    }

    stage('guile - srfi-64') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
        }
      }
    }

    stage('kawa - srfi-64') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
        }
      }
    }

    stage('loko - srfi-64') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
        }
      }
    }

    stage('mit-scheme - srfi-64') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
        }
      }
    }

    stage('racket - srfi-64') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
        }
      }
    }

    stage('sagittarius - srfi-64') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
        }
      }
    }

    stage('stklos - srfi-64') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
        }
      }
    }

    stage('skint - srfi-64') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
        }
      }
    }

    stage('tr7 - srfi-64') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
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
