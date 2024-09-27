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
      (slurp-loop (read-line) (string-append result line)))))

(define slurp
  (lambda (path)
    (with-input-from-file
      path
      (lambda ()
        (slurp-loop (read-line) "")))))

(define jenkinsfile-template (compile (slurp "templates/Jenkinsfile")))

(call-with-output-file "Jenkinsfile"
                       (lambda (out)
                         (execute jenkinsfile-template
                                  `((implementations ,implementations)
                                    (srfis ,srfis))
                                  out)))
