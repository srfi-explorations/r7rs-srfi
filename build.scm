(import (scheme base)
        (scheme write)
        (scheme file)
        (scheme process-context)
        (scheme file)
        (arvyy mustache))

(include "implementations.scm")
(include "srfis.scm")

(define slurp-loop
  (lambda (line result)
    (if (eof-object? line)
      result
      (slurp-loop (read-line) (string-append result line (string #\newline))))))

(define slurp
  (lambda (path)
    (with-input-from-file
      path
      (lambda ()
        (slurp-loop (read-line) "")))))

(define jenkinsfile-top (compile (slurp "templates/Jenkinsfile-top")))
(define jenkinsfile-job (compile (slurp "templates/Jenkinsfile-job")))
(define jenkinsfile-bottom (compile (slurp "templates/Jenkinsfile-bottom")))

(call-with-output-file
  "Jenkinsfile"
  (lambda (out)
    (execute jenkinsfile-top '() out)
    (newline out)
    (for-each
      (lambda (srfi)
        (for-each
          (lambda (implementation)
            (execute jenkinsfile-job (append implementation (list srfi)) out)
            (newline out))
          implementations))
      srfis)
    (execute jenkinsfile-bottom '() out)
    (newline out)))

(define makefile-top (compile (slurp "templates/Makefile-top")))
(define makefile-job (compile (slurp "templates/Makefile-job")))
(define makefile-bottom (compile (slurp "templates/Makefile-bottom")))

(call-with-output-file
  "Makefile"
  (lambda (out)
    (execute makefile-top '() out)
    (for-each
      (lambda (srfi)
        (for-each
          (lambda (implementation)
            (execute makefile-job (append implementation (list srfi)) out)
            (newline out))
          implementations))
      srfis)
    (execute makefile-bottom '() out)
    (newline out)))
