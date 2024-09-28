(import (scheme base)
        (scheme write)
        (scheme file)
        (scheme process-context)
        (scheme file)
        (arvyy mustache))

(include "util.scm")
(include "implementations.scm")
(include "srfis.scm")

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
                       (command . ,(cdr (assoc 'command implementation)))
                       (library-command . ,(if (assoc 'library-command implementation)
                                             (cdr (assoc 'library-command implementation))
                                             ""))
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
              (let* ((name (symbol->string (cdr (assoc 'name implementation))))
                     (library-command
                       (let ((library-command (assoc 'library-command implementation)))
                         (cond ((not library-command) #f)
                               ((string=? name "chicken")
                                (string-append "cp srfi/" number ".sld"
                                               " "
                                               "srfi-" number ".sld"
                                               " ; "
                                               (cdr library-command)
                                               " "
                                               "srfi-" number ".sld"))
                               (else
                                 (string-append (cdr library-command)
                                                " srfi/" number ".sld"))))))
                (when (string=? name "chicken")
                  (display (string-append "\t cp srfi/" number ".sld srfi-" number ".sld") out)
                  (newline out))
                (execute makefile-job
                         `((name . ,name)
                           (command . ,(cdr (assoc 'command implementation)))
                           (library-command . ,library-command)
                           (number . ,number))
                         out))
              (newline out))
            implementations)))
      srfis)
    (execute makefile-bottom '() out)
    (newline out)))
