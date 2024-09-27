(import (scheme base)
        (scheme write)
        (scheme file)
        (scheme process-context)
        (scheme file)
        (arvyy mustache))

(include "util.scm")
(include "implementations.scm")
(include "srfis.scm")

(define report-top (compile (slurp "templates/Report-top")))
(define report-row (compile (slurp "templates/Report-row")))
(define report-bottom (compile (slurp "templates/Report-bottom")))

(define logfiles (list-tail (command-line) 1))



(call-with-output-file
  "reports/results.html"
  (lambda (out)
    (execute report-top '() out)
    (display "<tr>" out)
    (newline out)
    (display "<th>SRFI</th>" out)
    (for-each
      (lambda (implementation)
        (display (string-append "<th>" (symbol->string (cdr (assoc 'name implementation))) "</th>") out)
        (newline out))
      implementations)
    (display "</tr>" out)
    (newline out)
    (newline out)
    (for-each
      (lambda (srfi)
        (let ((number (cdr (assoc 'number srfi))))
          (display (string-append "<tr>") out)
          (newline out)
          (display (string-append "<td>" (number->string number) "</td>") out)
          (newline out)
          (for-each
            (lambda (implementation)
              (letrec* ((name (cdr (assoc 'name implementation)))
                        (command (cdr (assoc 'command implementation)))
                        (logfile (string-append "reports/"
                                                "SRFI-"
                                                (number->string number)
                                                "-"
                                                (symbol->string name)
                                                ".log"))
                        (read-results (lambda (line results)
                                        (if (eof-object? line)
                                          results
                                          (read-results (read-line)
                                                   (if (string-starts-with? line "# of")
                                                     (append results (list line))
                                                     results)))))
                        (results (if (not (file-exists? logfile))
                                   (list "" "" "" "")
                                   (with-input-from-file
                                     logfile
                                     (lambda ()
                                       (read-results (read-line) (list)))))))
                (execute report-row
                         `((name . ,name)
                           (command . ,command)
                           (color . red)
                           (library-command . ,(if (assoc 'library-command implementation)
                                                 (cdr (assoc 'library-command implementation))
                                                 ""))
                           (number . ,number)
                           (expected-passes . ,(list-ref results 0))
                           (expected-failures . ,(list-ref results 1))
                           (unexpected-failures . ,(if (> (length results) 1) (list-ref results 2) ""))
                           (skipped-tests . ,(if (> (length results) 2) (list-ref results 3) ""))

                           )
                         out)
                (newline out)))
            implementations)
          (display (string-append "</tr>") out)))
      srfis)
    (execute report-bottom '() out)
    (newline out)))
