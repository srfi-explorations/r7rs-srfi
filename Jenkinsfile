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
      agent { docker { image 'schemers/chibi' } }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          unstash 'tests'
          sh 'bash run_test.sh "chibi" "chibi-scheme -I srfi" "NONE" "64"'
          sh 'cat *.log'
          unstash 'reports'
          sh 'bash jenkins_report.sh "chibi" "chibi-scheme -I srfi" "NONE" "64"'
          stash name: 'reports', includes: 'reports/*'
          sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
        }
      }
    }

    stage('chicken - srfi-64') {
      agent { docker { image 'schemers/chicken' } }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          unstash 'tests'
          sh 'bash run_test.sh "chicken" "csc -include-path ./srfi -X r7rs -R r7rs" "csc -include-path ./srfi -X r7rs -R r7rs -s -J" "64"'
          sh 'cat *.log'
          unstash 'reports'
          sh 'bash jenkins_report.sh "chicken" "csc -include-path ./srfi -X r7rs -R r7rs" "csc -include-path ./srfi -X r7rs -R r7rs -s -J" "64"'
          stash name: 'reports', includes: 'reports/*'
          sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
        }
      }
    }

    stage('cyclone - srfi-64') {
      agent { docker { image 'schemers/cyclone' } }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          unstash 'tests'
          sh 'bash run_test.sh "cyclone" "cyclone -I ." "cyclone -I ." "64"'
          sh 'cat *.log'
          unstash 'reports'
          sh 'bash jenkins_report.sh "cyclone" "cyclone -I ." "cyclone -I ." "64"'
          stash name: 'reports', includes: 'reports/*'
          sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
        }
      }
    }

    stage('gambit - srfi-64') {
      agent { docker { image 'schemers/gambit' } }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          unstash 'tests'
          sh 'bash run_test.sh "gambit" "gsc -:r7rs,search=. -exe" "gsc -:r7rs -dynamic" "64"'
          sh 'cat *.log'
          unstash 'reports'
          sh 'bash jenkins_report.sh "gambit" "gsc -:r7rs,search=. -exe" "gsc -:r7rs -dynamic" "64"'
          stash name: 'reports', includes: 'reports/*'
          sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
        }
      }
    }

    stage('gerbil - srfi-64') {
      agent { docker { image 'schemers/gerbil' } }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          unstash 'tests'
          sh 'bash run_test.sh "gerbil" "gxi" "NONE" "64"'
          sh 'cat *.log'
          unstash 'reports'
          sh 'bash jenkins_report.sh "gerbil" "gxi" "NONE" "64"'
          stash name: 'reports', includes: 'reports/*'
          sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
        }
      }
    }

    stage('gauche - srfi-64') {
      agent { docker { image 'schemers/gauche' } }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          unstash 'tests'
          sh 'bash run_test.sh "gauche" "gosh" "NONE" "64"'
          sh 'cat *.log'
          unstash 'reports'
          sh 'bash jenkins_report.sh "gauche" "gosh" "NONE" "64"'
          stash name: 'reports', includes: 'reports/*'
          sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
        }
      }
    }

    stage('guile - srfi-64') {
      agent { docker { image 'schemers/guile' } }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          unstash 'tests'
          sh 'bash run_test.sh "guile" "guile --fresh-auto-compile --r7rs -L ." "NONE" "64"'
          sh 'cat *.log'
          unstash 'reports'
          sh 'bash jenkins_report.sh "guile" "guile --fresh-auto-compile --r7rs -L ." "NONE" "64"'
          stash name: 'reports', includes: 'reports/*'
          sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
        }
      }
    }

    stage('kawa - srfi-64') {
      agent { docker { image 'schemers/kawa' } }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          unstash 'tests'
          sh 'bash run_test.sh "kawa" "kawa" "NONE" "64"'
          sh 'cat *.log'
          unstash 'reports'
          sh 'bash jenkins_report.sh "kawa" "kawa" "NONE" "64"'
          stash name: 'reports', includes: 'reports/*'
          sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
        }
      }
    }

    stage('loko - srfi-64') {
      agent { docker { image 'schemers/loko' } }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          unstash 'tests'
          sh 'bash run_test.sh "loko" "loko -feval -std=r7rs --compile" "NONE" "64"'
          sh 'cat *.log'
          unstash 'reports'
          sh 'bash jenkins_report.sh "loko" "loko -feval -std=r7rs --compile" "NONE" "64"'
          stash name: 'reports', includes: 'reports/*'
          sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
        }
      }
    }

    stage('mit-scheme - srfi-64') {
      agent { docker { image 'schemers/mit-scheme' } }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          unstash 'tests'
          sh 'bash run_test.sh "mit-scheme" "mit-scheme --load" "NONE" "64"'
          sh 'cat *.log'
          unstash 'reports'
          sh 'bash jenkins_report.sh "mit-scheme" "mit-scheme --load" "NONE" "64"'
          stash name: 'reports', includes: 'reports/*'
          sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
        }
      }
    }

    stage('racket - srfi-64') {
      agent { docker { image 'schemers/racket' } }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          unstash 'tests'
          sh 'bash run_test.sh "racket" "racket -I r7rs --make -S . --script" "NONE" "64"'
          sh 'cat *.log'
          unstash 'reports'
          sh 'bash jenkins_report.sh "racket" "racket -I r7rs --make -S . --script" "NONE" "64"'
          stash name: 'reports', includes: 'reports/*'
          sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
        }
      }
    }

    stage('sagittarius - srfi-64') {
      agent { docker { image 'schemers/sagittarius' } }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          unstash 'tests'
          sh 'bash run_test.sh "sagittarius" "sash" "NONE" "64"'
          sh 'cat *.log'
          unstash 'reports'
          sh 'bash jenkins_report.sh "sagittarius" "sash" "NONE" "64"'
          stash name: 'reports', includes: 'reports/*'
          sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
        }
      }
    }

    stage('stklos - srfi-64') {
      agent { docker { image 'schemers/stklos' } }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          unstash 'tests'
          sh 'bash run_test.sh "stklos" "stklos -I ." "NONE" "64"'
          sh 'cat *.log'
          unstash 'reports'
          sh 'bash jenkins_report.sh "stklos" "stklos -I ." "NONE" "64"'
          stash name: 'reports', includes: 'reports/*'
          sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
        }
      }
    }

    stage('skint - srfi-64') {
      agent { docker { image 'schemers/skint' } }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          unstash 'tests'
          sh 'bash run_test.sh "skint" "skint --program" "NONE" "64"'
          sh 'cat *.log'
          unstash 'reports'
          sh 'bash jenkins_report.sh "skint" "skint --program" "NONE" "64"'
          stash name: 'reports', includes: 'reports/*'
          sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'
        }
      }
    }

    stage('tr7 - srfi-64') {
      agent { docker { image 'schemers/tr7' } }
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          unstash 'tests'
          sh 'bash run_test.sh "tr7" "tr7i" "NONE" "64"'
          sh 'cat *.log'
          unstash 'reports'
          sh 'bash jenkins_report.sh "tr7" "tr7i" "NONE" "64"'
          stash name: 'reports', includes: 'reports/*'
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
