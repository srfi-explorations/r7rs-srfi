(import (scheme base)
        (scheme write)
        (scheme process-context)
        (scheme file))

(define print-lines
  (lambda (item . rest)
    (for-each
      (lambda (line)
        (display line)
        (newline))
      (cons item rest))))

(include "implementations.scm")
(include "srfis.scm")


; Build the Makefile
(define test-makefile "Makefile")
(when (file-exists? test-makefile) (delete-file test-makefile))

(define make-docker-command
  (lambda (name command srfi-number)
    (string-append
      "docker run -v ${PWD}:/workdir schemers/" name
      " sh -c \"cd workdir && "
      command
      " srfi-test/" srfi-number ".scm "
      (if (or (string=? name "chicken")
              (string=? name "cyclone")
              (string=? name "loko"))
        " && ./srfi-test/64"
        "")
      "\"")))

(define make-chicken-library-docker-command
  (lambda (command srfi-number)
    (string-append
      "docker run -it -v ${PWD}:/workdir schemers/chicken sh -c \"cd workdir"
      " && cp srfi/64.sld srfi-64.sld"
      " && " command " " "srfi-" srfi-number ".sld" "\"")))

(define make-cyclone-library-docker-command
  (lambda (command srfi-number)
    (string-append
      "docker run -it -v ${PWD}:/workdir schemers/cyclone sh -c \"cd workdir "
      " && " command " " "srfi/" srfi-number ".sld" "\"")))

(with-output-to-file
  test-makefile
  (lambda ()
    (for-each
      (lambda (implementation)
        (for-each
          (lambda (srfi)
            (let ((name (symbol->string (cdr (assoc 'name implementation))))
                  (command (cdr (assoc 'command implementation)))
                  (library-command
                    (if (assoc 'library-command implementation)
                      (cdr (assoc 'library-command implementation))
                      ""))
                  (srfi-number (number->string (cdr (assoc 'number srfi)))))
              (print-lines
                (string-append "test-" name "-srfi-" srfi-number ":"))
              (cond
                ((string=? name "chicken")
                 (print-lines
                   (string-append (string #\tab)
                                  (make-chicken-library-docker-command library-command srfi-number))))
                ((string=? name "cyclone")
                 (print-lines
                   (string-append (string #\tab)
                                  (make-cyclone-library-docker-command library-command srfi-number)))))
              (print-lines
                (string-append (string #\tab) "echo \"" name "-srfi-" srfi-number "\" " "> test-prefix.txt")
                (string-append (string #\tab) (make-docker-command name command srfi-number))
                "")))
          srfis))
      implementations)
    (apply print-lines
           (append (list "clean:")
                   (map
                     (lambda (file)
                       (string-append (string #\tab) "find . -name \"" file "\" -delete"))
                     (list "*.c"
                           "*.o"
                           "*.so"
                           "*.dep"
                           "*.zo"
                           "*.meta"
                           "compiled"
                           "srfi.*.sld"
                           "srfi.*.scm"
                           "srfi-*.sld"
                           "srfi.*.import.scm"
                           "srfi-*.import.scm"
                           "*.log"
                           "test-prefix.txt"))))))

; Build the Jenkinsfile
(define test-jenkinsfile "Jenkinsfile")
(when (file-exists? test-jenkinsfile) (delete-file test-jenkinsfile))

(with-output-to-file
  test-jenkinsfile
  (lambda ()
    (print-lines
      "pipeline {"
      "  agent any"
      "  options { buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10')) }"
      "  stages {"
      "    stage(\"Init\") {"
      "      steps {"
      "        sh 'rm -rf srfi-test && git clone https://github.com/srfi-explorations/srfi-test.git'"
      "        sh 'mkdir -p reports'"
      "        stash name: 'tests', includes: 'srfi-test/*'"
      "      }"
      "    }")
    (for-each
      (lambda (implementation)
        (for-each
          (lambda (srfi)
            (let ((name (symbol->string (cdr (assoc 'name implementation))))
                  (command (cdr (assoc 'command implementation)))
                  (library-command (assoc 'library-command implementation))
                  (srfi-number (number->string (cdr (assoc 'number srfi)))))
              (print-lines
                ""
                (string-append "    stage('" name " - " "srfi-" srfi-number "') {")
                "      agent {"
                "        docker {"
                (string-append "          image 'schemers/" name "'")
                "        }"
                "      }"
                "      steps {"
                "        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {"
                (string-append "          unstash 'tests'")
                (string-append "          sh 'rm *.log'")
                (string-append "          sh 'ls'")
                (string-append "          sh 'ls srfi-test'")
                (string-append "          sh 'echo \"" name "-srfi-" srfi-number "\" " "> test-prefix.txt'")
                (if (string=? name "chicken")
                  (string-append "          sh 'cp srfi/" srfi-number ".sld" " " "srfi-64.sld'")
                  "")
                (if (string=? name "chicken")
                  (string-append "          sh '" (cdr library-command) " " "srfi-" srfi-number ".sld'")
                  "")
                (if (and library-command (not (string=? name "chicken")))
                   (string-append "          sh '" (cdr library-command) " " "srfi/" srfi-number ".sld'")
                   "")
                (if (or (string=? name "chicken")
                        (string=? name "cyclone")
                        (string=? name "gambit"))
                  (string-append "          sh '" command " " "srfi-test/" srfi-number ".scm && srfi-test/" srfi-number "'")
                  (string-append "          sh '" command " " "srfi-test/" srfi-number ".scm'"))
                (string-append "          sh 'cat *.log'")
                (string-append "          sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'")
                (string-append "          sh 'grep \"# of\" *.log'")
                (string-append "          sh 'rm *.log'")
                "        }"
                "      }"
                "    }")))
          srfis))
      implementations)
    (print-lines "  }" "}")))
