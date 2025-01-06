(import (scheme base)
        (scheme write)
        (scheme file)
        (scheme process-context)
        (scheme file)
        (arvyy mustache))

(include "util.scm")
(include "implementations.scm")
(include "srfis.scm")

(when (file-exists? "srfi-numbers.txt")
  (delete-file "srfi-numbers.txt"))
(with-output-to-file
  "srfi-numbers.txt"
  (lambda ()
    (for-each
      (lambda (srfi)
        (display (cdr (assoc 'number srfi)))
        (display " "))
      srfis)))


(define full-library-command
  (lambda (implementation srfi)
    (let* ((name (symbol->string (cdr (assoc 'name implementation))))
           (number (number->string (cdr (assoc 'number srfi))))
           (library-command (assoc 'library-command implementation)))
      (cond ((not library-command) #f)
            ; Note that Chicken needs to have the SRFI library as srfi-N.scm in same folder
            ((or (string=? name "chicken-compiler")
                 (string=? name "chicken-interpreter"))
             (string-append "cp srfi/srfi-" number ".scm ."
                            " && " (cdr library-command) " srfi-" number ".scm"))
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
        ((and (assoc 'compiler? implementation)
              (cdr (assoc 'compiler? implementation)))
         (if (or (string=? name "loko-compiler")
                 (string=? name "cyclone-compiler"))
           (string-append command " && mv srfi-test/r7rs-programs/" number " ./test && ./test")
           (string-append command " && ./test")))
        (else command)))))

(define jenkinsfile-top (compile (slurp "templates/Jenkinsfile-top")))
(define jenkinsfile-job-top (compile (slurp "templates/Jenkinsfile-job-top")))
(define jenkinsfile-job (compile (slurp "templates/Jenkinsfile-job")))
(define jenkinsfile-job-bottom (compile (slurp "templates/Jenkinsfile-job-bottom")))
(define jenkinsfile-bottom (compile (slurp "templates/Jenkinsfile-bottom")))

(define generate-jenkinsfile
  (lambda ()
    (when (file-exists? "Jenkinsfile") (delete-file "Jenkinsfile"))
    (call-with-output-file
      "Jenkinsfile"
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
                                                          ":latest")))) out)
              (execute jenkinsfile-job
                           `((name . ,name)
                             (command . ,(cdr (assoc 'command implementation)))
                             (library-command . ,(if (assoc 'library-command implementation)
                                                   (cdr (assoc 'library-command implementation))
                                                   ""))
                             (numbers . ,(apply string-append
                                                (map (lambda (srfi)
                                                       (string-append (number->string (cdr (assoc 'number srfi)))
                                                                      " "))
                                                     srfis))))
                           out)
              (execute jenkinsfile-job-bottom `((name . ,(cdr (assoc 'name implementation)))) out)
              (newline out)))
          implementations)
        (execute jenkinsfile-bottom '() out)
        (newline out)))))

(generate-jenkinsfile)

(define makefile-top (compile (slurp "templates/Makefile-top")))
(define makefile-job (compile (slurp "templates/Makefile-job")))
(define makefile-bottom (compile (slurp "templates/Makefile-bottom")))

(when (file-exists? "Makefile") (delete-file "Makefile"))
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
                     (dockerimage (if (assoc 'docker-image implementation)
                                       (cdr (assoc 'docker-image implementation))
                                       (string-append "schemers/" name ":latest"))))
                (execute makefile-job
                         `((name . ,name)
                           (command . ,(full-command implementation srfi))
                           (library-command . ,(full-library-command implementation srfi))
                           (dockerimage . ,dockerimage)
                           (number . ,number))
                         out))
              (newline out))
            implementations)))
      srfis)
    (execute makefile-bottom '() out)
    (newline out)))
