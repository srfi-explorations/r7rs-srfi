(import (scheme base)
        (scheme write)
        (scheme file)
        (scheme process-context)
        (scheme file)
        (arvyy mustache))

(include "util.scm")
(include "implementations.scm")
(include "srfis.scm")

(define s-a string-append)

(define (srfi-number srfi)
  (cdr (assoc 'number srfi)))

(define (implementation-symbol impl)
  (cdr (assoc 'name impl)))

(define (implementation-command impl)
  (cdr (assoc 'command impl)))

(define (implementation-library-command impl)
  (let ((entry (assoc 'library-command impl)))
    (and entry (cdr entry))))

(define full-library-command
  (lambda (implementation srfi)
    (let ((name (symbol->string (cdr (assoc 'name implementation))))
          (number (number->string (cdr (assoc 'number srfi))))
          (library-command (assoc 'library-command implementation)))
      (cond ((not library-command) #f)
            ((string=? name "chicken")
             (string-append "cp srfi/" number ".sld"
                            " "
                            "srfi-" number ".sld"
                            " ; "
                            (cdr library-command)
                            " "
                            "srfi-" number ".sld"))
            (else (string-append (cdr library-command) " srfi/" number ".sld"))))))

(define full-command
  (lambda (implementation srfi)
    (let* ((impname (symbol->string (implementation-symbol implementation)))
           (command (implementation-command implementation))
           (number (number->string (srfi-number srfi)))
           (convert-file "srfi-test/convert.scm")
           (convert-command (s-a command " " convert-file))
           (test-file (s-a "srfi-test/" impname "/" number ".scm"))
           (test-command (s-a command " " test-file))
           (library-file (s-a "srfi-test/" number))
           (library-command (implementation-library-command implementation)))
      (if library-command
          (s-a library-command " srfi-test/" number)
          (s-a convert-command " && " test-command)))))

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
            (execute jenkinsfile-job
                     `((name . ,(cdr (assoc 'name implementation)))
                       (command . ,(full-command implementation srfi))
                       (library-command . ,(full-library-command implementation srfi))
                       (number . ,(cdr (assoc 'number srfi))))
                     out)
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
        (let ((number (number->string (cdr (assoc 'number srfi)))))
          (for-each
            (lambda (implementation)
              (let* ((name (symbol->string (cdr (assoc 'name implementation)))))
                (execute makefile-job
                         `((name . ,name)
                           (command . ,(full-command implementation srfi))
                           (library-command . ,(full-library-command implementation srfi))
                           (number . ,number))
                         out))
              (newline out))
            implementations)))
      srfis)
    (execute makefile-bottom '() out)
    (newline out)))
