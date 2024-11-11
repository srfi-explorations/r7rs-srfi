(import (scheme base)
        (scheme write)
        (scheme file)
        (scheme process-context)
        (scheme file)
        (arvyy mustache))

(include "util.scm")
(include "implementations.scm")
(include "srfis.scm")

(define full-library-command
  (lambda (implementation srfi)
    (let* ((name (symbol->string (cdr (assoc 'name implementation))))
           (number (number->string (cdr (assoc 'number srfi))))
           (library-command (assoc 'library-command implementation)))
      (cond ((not library-command) #f)
            ; Note that Chicken needs to have the SRFI library as srfi-N.scm in same folder
            ((string=? name "chicken")
             (string-append " cp srfi/" number ".sld srfi-" number ".sld"
                            " && " (cdr library-command) " srfi-" number ".sld"))
            (else (string-append (cdr library-command)
                                 " srfi/" number (if (string=? name "gambit") "" ".sld")))))))

(define full-command
  (lambda (implementation srfi)
    (let* ((name (symbol->string (cdr (assoc 'name implementation))))
           (number (number->string (cdr (assoc 'number srfi))))
           (command
             (string-append
               (cdr (assoc 'command implementation))
               " srfi-test/r7rs-programs/" number ".scm"))
           (library-command (assoc 'library-command implementation)))
      (cond
        ((not library-command) command)
        (else (string-append command
                             " && srfi-test/r7rs-programs/" number
                             " && rm srfi-test/r7rs-programs/" number))))))

(define jenkinsfile-top (compile (slurp "templates/Jenkinsfile-top")))
(define jenkinsfile-job-top (compile (slurp "templates/Jenkinsfile-job-top")))
(define jenkinsfile-job (compile (slurp "templates/Jenkinsfile-job")))
(define jenkinsfile-job-bottom (compile (slurp "templates/Jenkinsfile-job-bottom")))
(define jenkinsfile-bottom (compile (slurp "templates/Jenkinsfile-bottom")))

(define generate-jenkinsfile
  (lambda (head?)
    (call-with-output-file
      (string-append "Jenkinsfile" (if head? "-head" ""))
      (lambda (out)
        (execute jenkinsfile-top '() out)
        (newline out)
        (for-each
          (lambda (implementation)
            (let ((name (symbol->string (cdr (assoc 'name implementation)))))
              (execute jenkinsfile-job-top
                       `((name . ,name)
                         (dockerimage . ,(if (assoc 'docker-image implementation)
                                           (cdr (assoc 'docker-image implementation))
                                           (string-append "schemers/"
                                                          name
                                                          (if head? ":head" ":latest"))))) out)
              (for-each
                (lambda (srfi)
                  (execute jenkinsfile-job
                           `((name . ,name)
                             (command . ,(full-command implementation srfi))
                             (library-command . ,(full-library-command implementation srfi))
                             (number . ,(cdr (assoc 'number srfi))))
                           out))
                srfis)
              (execute jenkinsfile-job-bottom `((name . ,(cdr (assoc 'name implementation)))) out)
              (newline out)))
          implementations)
        (execute jenkinsfile-bottom '() out)
        (newline out)))))

(generate-jenkinsfile #f)
(generate-jenkinsfile #t)

(define makefile-top (compile (slurp "templates/Makefile-top")))
(define makefile-job (compile (slurp "templates/Makefile-job")))
(define makefile-bottom (compile (slurp "templates/Makefile-bottom")))

(call-with-output-file
  "Makefile.tests"
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
