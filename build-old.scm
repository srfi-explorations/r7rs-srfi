(import (scheme base)
        (scheme write)
        (scheme process-context)
        (scheme file)
        (arvyy mustache))

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
    (for-each
      (lambda (implementation)
        (for-each
          (lambda (srfi)
            (let ((name (symbol->string (cdr (assoc 'name implementation))))
                  (command (cdr (assoc 'command implementation)))
                  (library-command (if (assoc 'library-command implementation)
                                     (cdr (assoc 'library-command implementation))
                                     "NONE"))
                  (srfi-number (number->string (cdr (assoc 'number srfi)))))
              (print-lines
                ""
                (string-append "    stage('" name " - " "srfi-" srfi-number "') {")
                ;(string-append "      agent { docker { image 'schemers/" name "' } }")
                "      steps {"
                "        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {"
                "          sh 'echo \"test\"'"
                ;"          unstash 'tests'"
                #;(string-append "          sh 'bash run_test.sh \""
                               name "\" \""
                               command "\" \""
                               library-command "\" \""
                               srfi-number
                               "\"'")
                ;"          sh 'cat *.log'"
                ;"          unstash 'reports'"
                #;(string-append "          sh 'bash jenkins_report.sh \""
                               name "\" \""
                               command "\" \""
                               library-command "\" \""
                               srfi-number
                               "\"'")
                ;"          stash name: 'reports', includes: 'reports/*'"
                ; Dont put things after this line, if any test fails they wont be run
                ;(string-append "          sh 'test $(grep result-kind: *.log | grep fail | grep -v xfail -c) -eq 0 || exit 1'")
                "        }"
                "      }"
                "    }")))
          srfis))
      implementations)
    (print-lines
      "  }"
      ;"  post {"
      ;"   always {"
      ;"     unstash 'reports'"
      ;"     archiveArtifacts artifacts: 'reports/*.html'"
      ;"   }"
      ;"  }"
      "}")))