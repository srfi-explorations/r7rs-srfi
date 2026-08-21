;; Copyright (c) 2005, 2006, 2007, 2012, 2013 Per Bothner
;; Added "full" support for Chicken, Gauche, Guile and SISC.
;;   Alex Shinn, Copyright (c) 2005.
;; Modified for Scheme Spheres by Álvaro Castro-Castilla, Copyright (c) 2012.
;; Support for Guile 2 by Mark H Weaver <mhw@netris.org>, Copyright (c) 2014.
;; Refactored by Taylan Ulrich Bayırlı/Kammer, Copyright (c) 2014, 2015.
;; Modified for R7RS-SRFI project by Retropikzel, Copyright (c) 2025, 2026.
;;
;; Permission is hereby granted, free of charge, to any person
;; obtaining a copy of this software and associated documentation
;; files (the "Software"), to deal in the Software without
;; restriction, including without limitation the rights to use, copy,
;; modify, merge, publish, distribute, sublicense, and/or sell copies
;; of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:
;;
;; The above copyright notice and this permission notice shall be
;; included in all copies or substantial portions of the Software.
;;
;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
;; EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
;; MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
;; NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
;; BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
;; ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
;; CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
;; SOFTWARE.

(define (string-join strings delimiter)
  (if (null? strings)
    ""
    (let loop ((result (car strings))
               (rest (cdr strings)))
      (if (null? rest)
        result
        (loop (string-append result delimiter (car rest))
              (cdr rest))))))

(define display-log
  (lambda (runner . args)
    (let ((port (%test-runner-log-port runner)))
      (when port (map (lambda (item) (display item port)) args)))))

(define display-map
  (lambda args
    (map (lambda (item) (display item)) args)))

(define write-log
  (lambda (runner . args)
    (let ((port (%test-runner-log-port runner)))
      (when port (map (lambda (item) (write item port)) args)))))

;;; Main

(define (test-runner-simple)
  (let ((runner (test-runner-null)))
    (test-runner-reset runner)
    (test-runner-on-group-begin!     runner test-on-group-begin-simple)
    (test-runner-on-group-end!       runner test-on-group-end-simple)
    (test-runner-on-final!           runner test-on-final-simple)
    (test-runner-on-test-begin!      runner test-on-test-begin-simple)
    (test-runner-on-test-end!        runner test-on-test-end-simple)
    (test-runner-on-bad-count!       runner test-on-bad-count-simple)
    (test-runner-on-bad-end-name!    runner test-on-bad-end-name-simple)
    (%test-runner-on-bad-error-type! runner on-bad-error-type)
    runner))

(define (test-on-group-begin-simple runner name count)
  (if (null? (test-runner-group-stack runner))
    (begin (maybe-start-logging runner)
           (display-map "%%%% Starting test "
                        name
                        " "
                        "(Writing full log to \""
                        name
                        ".log\")"
                        #\newline)
           (display-log runner "%%%% Starting test " name #\newline)))
  (begin (display-log runner "Group begin: " name #\newline)))

(define (test-on-group-end-simple runner)
  (let ((name (car (test-runner-group-stack runner))))
    (display-log runner "Group end: " name #\newline)))

(define (test-on-final-simple runner)

  (when (> (test-runner-pass-count runner) 0)
    (display-map "# of expected passes      "
                 (test-runner-pass-count runner)
                 #\newline)
    (display-log runner
                 "# of expected passes      "
                 (test-runner-pass-count runner)
                 #\newline))

  (when (> (test-runner-xfail-count runner) 0)
    (display-map "# of expected failures    "
                 (test-runner-xfail-count runner)
                 #\newline)
    (display-log runner
                 "# of expected failures    "
                 (test-runner-xfail-count runner)
                 #\newline))

  (when (> (test-runner-xpass-count runner) 0)
    (display-map "# of unexpected successes "
                 (test-runner-xpass-count runner)
                 #\newline)
    (display-log runner
                 "# of unexpected passes    "
                 (test-runner-xpass-count runner)
                 #\newline))

  (when (> (test-runner-fail-count runner) 0)
    (display-map "# of failures             "
                 (test-runner-fail-count runner)
                 #\newline)
    (display-log runner
                 "# of failures             "
                 (test-runner-fail-count runner)
                 #\newline))

  (when (> (test-runner-skip-count runner) 0)
    (display-map "# of skipped tests        "
                 (test-runner-skip-count runner)
                 #\newline)
    (display-log runner
                 "# of skipped tests        "
                 (test-runner-skip-count runner)
                 #\newline))

  (maybe-finish-logging runner))

(define (maybe-start-logging runner)
  (let ((log-file (%test-runner-log-file runner)))
    (when log-file
      (when (file-exists? log-file) (delete-file log-file))
      (%test-runner-log-port! runner (open-output-file log-file)))))

(define (maybe-finish-logging runner)
  (let ((log-file (%test-runner-log-file runner)))
    (when log-file
      (close-output-port (%test-runner-log-port runner)))))

(define (test-on-test-begin-simple runner)
  (let ((name (test-runner-test-name runner))
        (file (test-result-ref runner 'source-file "(unknown file)"))
        (line (test-result-ref runner 'source-line "(unknown line)")))
    (display-log runner "Test begin:" #\newline)
    (display-log runner "  test-name: ")
    (write-log runner name)
    (display-log runner #\newline)
    (display-log runner "  source-file: ")
    (write-log runner file)
    (display-log runner #\newline)
    (display-log runner "  source-line: " line #\newline)
    (display-log runner "  source-form: ")
    (write-log runner (test-result-ref runner 'source-form))
    (display-log runner #\newline)
    (values)))

(define (test-on-test-end-simple runner)
  (let* ((result-kind (test-result-kind runner))
         (result-kind-name (case result-kind
                             ((pass) "pass")
                             ((fail) "fail")
                             ((xpass) "xpass")
                             ((xfail) "xfail")
                             ((skip) "skip")
                             (else "other")))
         (name (test-runner-test-name runner))
         (label (string-join (append (test-runner-group-path runner)
                                     (list name))
                             ": ")))
    (let ((nil (cons #f #f)))
      (let ((expected-value (test-result-ref runner 'expected-value nil))
            (actual-value (test-result-ref runner 'actual-value nil))
            (expected-error (test-result-ref runner 'expected-error nil))
            (actual-error (test-result-ref runner 'actual-error nil)))
        (display-log runner "Test end:" #\newline)
        (display-log runner "  result-kind: " result-kind-name #\newline)
        (display-log runner "  actual-value: ")
        (write-log runner (test-result-ref runner 'actual-value nil))
        (display-log runner #\newline)
        (display-log runner "  expected-value: ")
        (write-log runner (test-result-ref runner 'expected-value nil))
        (display-log runner #\newline)))))

(define (test-on-bad-count-simple runner count expected-count)
  (display-log runner
               "*** Total number of tests was "
               count
               " but should be "
               expected-count
               ". ***"
               #\newline)
  (display-log runner
               "*** Discrepancy indicates testsuite error or exceptions. ***"
               #\newline))

(define (test-on-bad-end-name-simple runner begin-name end-name)
  (error (string-append "Test-end \""
                        end-name
                        "\" does not match test-begin \""
                        begin-name
                        "\".")))

(define (on-bad-error-type runner type error)
  (display-log runner
               "WARNING: unknown error type predicate: "
               type
               #\newline)
  (display-log runner
               "         error was: "
               error
               #\newline))
