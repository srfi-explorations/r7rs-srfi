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
           (library-command (assoc 'library-command implementation))
           ; SRFI-64 is used for testing so it needs always to be compiled
           (srfi-64-command (lambda (library-command)
                              (string-append (cdr library-command) " srfi/64.sld && "))))
      (cond ((not library-command) #f)
            ((string=? name "chicken")
             (string-append "cp srfi/64.sld srfi.64.sld"
                            " && " (cdr library-command) " srfi.64.sld "
                            " && cp srfi/" number ".sld"
                            " "
                            "srfi-" number ".sld"
                            " && "
                            (cdr library-command)
                            " "
                            "srfi-" number ".sld"))
            (else (string-append (srfi-64-command library-command)
                                 (cdr library-command)
                                 " srfi/" number ".sld"))))))

(define full-command
  (lambda (implementation srfi)
    (let* ((name (symbol->string (cdr (assoc 'name implementation))))
           (number (number->string (cdr (assoc 'number srfi))))
           (command
             (string-append
               (cdr (assoc 'command implementation))
               " "
               "srfi-test/r7rs-programs/"
               number
               ".scm"))
           (library-command (assoc 'library-command implementation)))
      (cond
        ((not library-command) command)
        (else (string-append command " && srfi-test/r7rs-programs/" number " && rm srfi-test/r7rs-programs/" number))))))

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
