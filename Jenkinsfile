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
          sh 'echo "test"'
        }
      }
    }

    stage('chicken - srfi-64') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'echo "test"'
        }
      }
    }

    stage('cyclone - srfi-64') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'echo "test"'
        }
      }
    }

    stage('gambit - srfi-64') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'echo "test"'
        }
      }
    }

    stage('gerbil - srfi-64') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'echo "test"'
        }
      }
    }

    stage('gauche - srfi-64') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'echo "test"'
        }
      }
    }

    stage('guile - srfi-64') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'echo "test"'
        }
      }
    }

    stage('kawa - srfi-64') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'echo "test"'
        }
      }
    }

    stage('loko - srfi-64') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'echo "test"'
        }
      }
    }

    stage('mit-scheme - srfi-64') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'echo "test"'
        }
      }
    }

    stage('racket - srfi-64') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'echo "test"'
        }
      }
    }

    stage('sagittarius - srfi-64') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'echo "test"'
        }
      }
    }

    stage('stklos - srfi-64') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'echo "test"'
        }
      }
    }

    stage('skint - srfi-64') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'echo "test"'
        }
      }
    }

    stage('tr7 - srfi-64') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'echo "test"'
        }
      }
    }
  }
}
