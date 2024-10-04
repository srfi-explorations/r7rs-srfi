;; Copyright (c) 2005, 2006, 2007, 2012, 2013 Per Bothner
;; Added "full" support for Chicken, Gauche, Guile and SISC.
;;   Alex Shinn, Copyright (c) 2005.
;; Modified for Scheme Spheres by Álvaro Castro-Castilla, Copyright (c) 2012.
;; Support for Guile 2 by Mark H Weaver <mhw@netris.org>, Copyright (c) 2014.
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

(define-syntax internal-test-export
  (syntax-rules ()
    ((internal-test-export . names) (if #f #f))))

(define-syntax internal-test-record-define
  (syntax-rules ()
    ((internal-test-record-define tname alloc runner? (name index getter setter) ...)
     (define-record-type tname
       (alloc)
       runner?
       (name getter setter) ...))))

(internal-test-record-define
  test-runner
  internal-test-runner-alloc test-runner?
  ;; Cumulate count of all tests that have passed and were expected to.
  (pass-count 1 test-runner-pass-count test-runner-pass-count!)
  (fail-count 2 test-runner-fail-count test-runner-fail-count!)
  (xpass-count 3 test-runner-xpass-count test-runner-xpass-count!)
  (xfail-count 4 test-runner-xfail-count test-runner-xfail-count!)
  (skip-count 5 test-runner-skip-count test-runner-skip-count!)
  (skip-list 6 internal-test-runner-skip-list internal-test-runner-skip-list!)
  (fail-list 7 internal-test-runner-fail-list internal-test-runner-fail-list!)
  ;; Normally #t, except when in a test-apply.
  (run-list 8 internal-test-runner-run-list internal-test-runner-run-list!)
  (skip-save 9 internal-test-runner-skip-save internal-test-runner-skip-save!)
  (fail-save 10 internal-test-runner-fail-save internal-test-runner-fail-save!)
  (group-stack 11 test-runner-group-stack test-runner-group-stack!)
  (on-test-begin 12 test-runner-on-test-begin test-runner-on-test-begin!)
  (on-test-end 13 test-runner-on-test-end test-runner-on-test-end!)
  ;; Call-back when entering a group. Takes (runner suite-name count).
  (on-group-begin 14 test-runner-on-group-begin test-runner-on-group-begin!)
  ;; Call-back when leaving a group.
  (on-group-end 15 test-runner-on-group-end test-runner-on-group-end!)
  ;; Call-back when leaving the outermost group.
  (on-final 16 test-runner-on-final test-runner-on-final!)
  ;; Call-back when expected number of tests was wrong.
  (on-bad-count 17 test-runner-on-bad-count test-runner-on-bad-count!)
  ;; Call-back when name in test=end doesn't match test-begin.
  (on-bad-end-name 18 test-runner-on-bad-end-name test-runner-on-bad-end-name!)
  ;; Cumulate count of all tests that have been done.
  (total-count 19 internal-test-runner-total-count internal-test-runner-total-count!)
  ;; Stack (list) of (count-at-start . expected-count):
  (count-list 20 internal-test-runner-count-list internal-test-runner-count-list!)
  (result-alist 21 test-result-alist test-result-alist!)
  ;; Field can be used by test-runner for any purpose.
  ;; test-runner-simple uses it for a log file.
  (aux-value 22 test-runner-aux-value test-runner-aux-value!))

(define (test-runner-reset runner)
  (test-result-alist! runner '())
  (test-runner-pass-count! runner 0)
  (test-runner-fail-count! runner 0)
  (test-runner-xpass-count! runner 0)
  (test-runner-xfail-count! runner 0)
  (test-runner-skip-count! runner 0)
  (internal-test-runner-total-count! runner 0)
  (internal-test-runner-count-list! runner '())
  (internal-test-runner-run-list! runner #t)
  (internal-test-runner-skip-list! runner '())
  (internal-test-runner-fail-list! runner '())
  (internal-test-runner-skip-save! runner '())
  (internal-test-runner-fail-save! runner '())
  (test-runner-group-stack! runner '()))

(define (test-runner-group-path runner)
  (reverse (test-runner-group-stack runner)))

(define (internal-test-null-callback runner) #f)

(define (test-runner-null)
  (let ((runner (internal-test-runner-alloc)))
    (test-runner-reset runner)
    (test-runner-on-group-begin! runner (lambda (runner name count) #f))
    (test-runner-on-group-end! runner internal-test-null-callback)
    (test-runner-on-final! runner internal-test-null-callback)
    (test-runner-on-test-begin! runner internal-test-null-callback)
    (test-runner-on-test-end! runner internal-test-null-callback)
    (test-runner-on-bad-count! runner (lambda (runner count expected) #f))
    (test-runner-on-bad-end-name! runner (lambda (runner begin end) #f))
    runner))

;; Not part of the specification.  FIXME
;; Controls whether a log file is generated.
(define test-log-to-file #t)

(define (test-on-group-begin-simple runner suite-name count)
  (if (null? (test-runner-group-stack runner))
    (begin
      (display "--- Starting test ")
      (display suite-name)
      (if test-log-to-file
        (let* ((log-name (if (string? test-log-to-file) test-log-to-file
                           (string-append suite-name ".log")))
               ;; Replace "bad" characters in log file name with #\_
               (fix-invalid-char
                 (lambda (ch)
                   (if (or (char-alphabetic? ch)
                           (char-numeric? ch)
                           (char=? ch #\space)
                           (char=? ch #\-)
                           (char=? ch #\+)
                           (char=? ch #\_)
                           (char=? ch #\.)
                           (char=? ch #\,))
                     ch
                     #\_)))
               (log-file-name (string-map fix-invalid-char log-name))
               (log-file
                 (begin
                   (when (file-exists? log-file-name) (delete-file log-file-name))
                   (open-output-file log-file-name))))
          (display "---- Starting test " log-file)
          (display suite-name log-file)
          (newline log-file)
          (test-runner-aux-value! runner log-file)
          (display "  (Writing full log to \"")
          (display log-file-name)
          (display "\")")))
      (newline)))
  (let ((log (test-runner-aux-value runner)))
    (if (output-port? log)
      (begin
        (display "Group begin: " log)
        (display suite-name log)
        (newline log))))
  #f)

(define (test-on-group-end-simple runner)
  (let ((log (test-runner-aux-value runner)))
    (if (output-port? log)
      (begin
        (display "Group end: " log)
        (display (car (test-runner-group-stack runner)) log)
        (newline log))))
  #f)

(define (test-on-final-simple runner)
  (internal-test-final-report-simple runner (current-output-port))
  (let ((log (test-runner-aux-value runner)))
    (if (output-port? log)
      (internal-test-final-report-simple runner log))))

(define (test-on-test-begin-simple runner)
  (let ((log (test-runner-aux-value runner)))
    (if (output-port? log)
      (let* ((results (test-result-alist runner))
             (source-file (assq 'source-file results))
             (source-line (assq 'source-line results))
             (source-form (assq 'source-form results))
             (test-name (assq 'test-name results)))
        (display "Test begin:" log)
        (newline log)
        (if test-name (internal-test-write-result1 test-name log))
        (if source-file (internal-test-write-result1 source-file log))
        (if source-line (internal-test-write-result1 source-line log))
        (if source-form (internal-test-write-result1 source-form log))))))

(define-syntax test-result-ref
  (syntax-rules ()
    ((test-result-ref runner pname)
     (test-result-ref runner pname #f))
    ((test-result-ref runner pname default)
     (let ((p (assq pname (test-result-alist runner))))
       (if p (cdr p) default)))))

(define (test-on-test-end-simple runner)
  (let ((log (test-runner-aux-value runner))
        (kind (test-result-ref runner 'result-kind)))
    (if (memq kind '(fail xpass))
      (let* ((results (test-result-alist runner))
             (source-file (assq 'source-file results))
             (source-line (assq 'source-line results))
             (test-name (assq 'test-name results)))
        (if (or source-file source-line)
          (begin
            (if source-file (display (cdr source-file)))
            (display ":")
            (if source-line (display (cdr source-line)))
            (display ": ")))
        (display (if (eq? kind 'xpass) "XPASS" "FAIL"))
        (if test-name
          (begin
            (display " ")
            (display (cdr test-name))))
        (newline)))
    (if (output-port? log)
      (begin
        (display "Test end:" log)
        (newline log)
        (let loop ((list (test-result-alist runner)))
          (if (pair? list)
            (let ((pair (car list)))
              ;; Write out properties not written out by on-test-begin.
              (if (not (memq (car pair)
                             '(test-name source-file source-line source-form)))
                (internal-test-write-result1 pair log))
              (loop (cdr list)))))))))

(define (test-on-bad-count-simple runner count expected-count)
  (internal-test-on-bad-count-write runner count expected-count (current-output-port))
  (let ((log (test-runner-aux-value runner)))
    (if (output-port? log)
      (internal-test-on-bad-count-write runner count expected-count log))))

(define (test-on-bad-end-name-simple runner begin-name end-name)
  (let ((msg (string-append (internal-test-format-line runner) "test-end " begin-name
                            " does not match test-begin " end-name)))
    (error msg)))

(define (test-runner-simple)
  (let ((runner (internal-test-runner-alloc)))
    (test-runner-reset runner)
    (test-runner-on-group-begin! runner test-on-group-begin-simple)
    (test-runner-on-group-end! runner test-on-group-end-simple)
    (test-runner-on-final! runner test-on-final-simple)
    (test-runner-on-test-begin! runner test-on-test-begin-simple)
    (test-runner-on-test-end! runner test-on-test-end-simple)
    (test-runner-on-bad-count! runner test-on-bad-count-simple)
    (test-runner-on-bad-end-name! runner test-on-bad-end-name-simple)
    runner))

(define internal-test-runner-factory test-runner-simple)

(define-syntax test-runner-factory
  (syntax-rules ()
    ((test-runner-factory)
     internal-test-runner-factory)
    ((test-runner-factory runner)
     (set! internal-test-runner-factory runner))))

(define (test-runner-create)
  ((test-runner-factory)))

(define test-runner-current-actual #f)
(set! test-runner-current-actual (test-runner-create))

(define-syntax test-runner-current
  (syntax-rules ()
    ((test-runner-current)
     test-runner-current-actual)
    ((test-runner-current runner)
     (set! test-runner-current-actual runner))))

;; A safer wrapper to test-runner-current.
(define (test-runner-get)
  (let ((r (test-runner-current)))
    (when (not r) (error "test-runner not initialized - test-begin missing?"))
    r))

(define (internal-test-specifier-matches spec runner)
  (spec runner))

(define (internal-test-any-specifier-matches list runner)
  (let ((result #f))
    (let loop ((l list))
      (cond ((null? l) result)
            (else
              (if (internal-test-specifier-matches (car l) runner)
                (set! result #t))
              (loop (cdr l)))))))

;; Returns #f, #t, or 'xfail.
(define (internal-test-should-execute runner)
  (let ((run (internal-test-runner-run-list runner)))
    (cond ((or (not (or (eqv? run #t)
                        (internal-test-any-specifier-matches run runner)))
               (internal-test-any-specifier-matches
                 (internal-test-runner-skip-list runner)
                 runner))
           (test-result-set! runner 'result-kind 'skip)
           #f)
          ((internal-test-any-specifier-matches
             (internal-test-runner-fail-list runner)
             runner)
           (test-result-set! runner 'result-kind 'xfail)
           'xfail)
          (else #t))))

(define (internal-test-begin suite-name count)
  (when (not (test-runner-current))
    (test-runner-current (test-runner-create)))
  (let ((runner (test-runner-current)))
    ((test-runner-on-group-begin runner) runner suite-name count)
    (internal-test-runner-skip-save! runner
                                     (cons (internal-test-runner-skip-list runner)
                                           (internal-test-runner-skip-save runner)))
    (internal-test-runner-fail-save! runner
                                     (cons (internal-test-runner-fail-list runner)
                                           (internal-test-runner-fail-save runner)))
    (internal-test-runner-count-list! runner
                                      (cons (cons (internal-test-runner-total-count runner)
                                                  count)
                                            (internal-test-runner-count-list runner)))
    (test-runner-group-stack! runner (cons suite-name
                                           (test-runner-group-stack runner)))))

(define-syntax test-begin
  (syntax-rules ()
    ((test-begin suite-name)
     (internal-test-begin suite-name #f))
    ((test-begin suite-name count)
     (internal-test-begin suite-name count))))

(define (internal-test-on-bad-count-write runner count expected-count port)
  (display "*** Total number of tests was " port)
  (display count port)
  (display " but should be " port)
  (display expected-count port)
  (display ". ***" port)
  (newline port)
  (display "*** Discrepancy indicates testsuite error or exceptions. ***" port)
  (newline port))

(define (internal-test-final-report1 value label port)
  (if (> value 0)
    (begin
      (display label port)
      (display value port)
      (newline port))))

(define (internal-test-final-report-simple runner port)
  (internal-test-final-report1 (test-runner-pass-count runner)
                               "# of expected passes      " port)
  (internal-test-final-report1 (test-runner-xfail-count runner)
                               "# of expected failures    " port)
  (internal-test-final-report1 (test-runner-xpass-count runner)
                               "# of unexpected successes " port)
  (internal-test-final-report1 (test-runner-fail-count runner)
                               "# of unexpected failures  " port)
  (internal-test-final-report1 (test-runner-skip-count runner)
                               "# of skipped tests        " port))

(define (internal-test-format-line runner)
  (let* ((line-info (test-result-alist runner))
         (source-file (assq 'source-file line-info))
         (source-line (assq 'source-line line-info))
         (file (if source-file (cdr source-file) "")))
    (if source-line
      (string-append file ":"
                     (number->string (cdr source-line)) ": ")
      "")))

(define (internal-test-end suite-name line-info)
  (let* ((r (test-runner-get))
         (groups (test-runner-group-stack r))
         (line (internal-test-format-line r)))
    (test-result-alist! r line-info)
    (if (null? groups)
      (error (string-append line "test-end not in a group")))
    (if (and suite-name (not (equal? suite-name (car groups))))
      ((test-runner-on-bad-end-name r) r suite-name (car groups)))
    (let* ((count-list (internal-test-runner-count-list r))
           (expected-count (cdar count-list))
           (saved-count (caar count-list))
           (group-count (- (internal-test-runner-total-count r) saved-count)))
      (if (and expected-count
               (not (= expected-count group-count)))
        ((test-runner-on-bad-count r) r group-count expected-count))
      ((test-runner-on-group-end r) r)
      (test-runner-group-stack! r (cdr (test-runner-group-stack r)))
      (internal-test-runner-skip-list! r (car (internal-test-runner-skip-save r)))
      (internal-test-runner-skip-save! r (cdr (internal-test-runner-skip-save r)))
      (internal-test-runner-fail-list! r (car (internal-test-runner-fail-save r)))
      (internal-test-runner-fail-save! r (cdr (internal-test-runner-fail-save r)))
      (internal-test-runner-count-list! r (cdr count-list))
      (cond ((null? (test-runner-group-stack r))
             ((test-runner-on-final r) r)
             (test-runner-current #f))))))

(define-syntax test-group
  (syntax-rules ()
    ((test-group suite-name . body)
     (let ((r (test-runner-current)))
       ;; Ideally should also set line-number, if available.
       (test-result-alist! r (list (cons 'test-name suite-name)))
       (if (internal-test-should-execute r)
         (dynamic-wind
           (lambda () (test-begin suite-name))
           (lambda () . body)
           (lambda () (test-end  suite-name))))))))

(define-syntax test-group-with-cleanup
  (syntax-rules ()
    ((test-group-with-cleanup suite-name form cleanup-form)
     (test-group suite-name
                 (dynamic-wind
                   (lambda () #f)
                   (lambda () form)
                   (lambda () cleanup-form))))
    ((test-group-with-cleanup suite-name cleanup-form)
     (test-group-with-cleanup suite-name #f cleanup-form))
    ((test-group-with-cleanup suite-name form1 form2 form3 . rest)
     (test-group-with-cleanup suite-name (begin form1 form2) form3 . rest))))

(define (internal-test-write-result1 pair port)
  (display "  " port)
  (display (car pair) port)
  (display ": " port)
  (write (cdr pair) port)
  (newline port))

(define (test-result-set! runner pname value)
  (let* ((alist (test-result-alist runner))
         (p (assq pname alist)))
    (if p
      (set-cdr! p value)
      (test-result-alist! runner (cons (cons pname value) alist)))))

(define (test-result-actual-value! runner value)
  (test-result-set! runner 'actual-value value))

(define (test-result-expected-value! runner value)
  (test-result-set! runner 'expected-value value))

(define (test-result-clear runner)
  (test-result-alist! runner '()))

(define (test-result-remove runner pname)
  (let* ((alist (test-result-alist runner))
         (p (assq pname alist)))
    (if p
      (test-result-alist! runner
                          (let loop ((r alist))
                            (if (eq? r p) (cdr r)
                              (cons (car r) (loop (cdr r)))))))))

(define (test-result-kind . rest)
  (let ((runner (if (pair? rest) (car rest) (test-runner-current))))
    (test-result-ref runner 'result-kind)))

(define (test-passed? . rest)
  (let ((runner (if (pair? rest) (car rest) (test-runner-get))))
    (memq (test-result-ref runner 'result-kind) '(pass xpass))))

(define (internal-test-report-result)
  (let* ((r (test-runner-get))
         (result-kind (test-result-kind r)))
    (case result-kind
      ((pass)
       (test-runner-pass-count! r (+ 1 (test-runner-pass-count r))))
      ((fail)
       (test-runner-fail-count! r (+ 1 (test-runner-fail-count r))))
      ((xpass)
       (test-runner-xpass-count! r (+ 1 (test-runner-xpass-count r))))
      ((xfail)
       (test-runner-xfail-count! r (+ 1 (test-runner-xfail-count r))))
      (else
        (test-runner-skip-count! r (+ 1 (test-runner-skip-count r)))))
    (internal-test-runner-total-count! r (+ 1 (internal-test-runner-total-count r)))
    ((test-runner-on-test-end r) r)))

(define-syntax internal-test-evaluate-with-catch
  (syntax-rules ()
    ((internal-test-evaluate-with-catch test-expression)
     (guard (err (else #f)) test-expression))))

(define (internal-test-source-line2 form) '())

(define (internal-test-on-test-begin r)
  (internal-test-should-execute r)
  ((test-runner-on-test-begin r) r)
  (not (equal? 'skip (test-result-ref r 'result-kind))))

(define (internal-test-on-test-end r result)
  (test-result-set! r 'result-kind
                    (if (eq? (test-result-ref r 'result-kind) 'xfail)
                      (if result 'xpass 'xfail)
                      (if result 'pass 'fail))))

(define (test-runner-test-name runner)
  (test-result-ref runner 'test-name ""))

(define-syntax internal-test-comp2body
  (syntax-rules ()
    ((internal-test-comp2body r comp expected expr)
     (let ()
       (if (internal-test-on-test-begin r)
         (let ((exp expected))
           (test-result-expected-value! r exp)
           (let ((res (internal-test-evaluate-with-catch expr)))
             (test-result-actual-value! r res)
             (internal-test-on-test-end r (comp exp res)))))
       (internal-test-report-result)))))

(define (internal-test-approximate= error)
  (lambda (value expected)
    (let ((rval (real-part value))
          (ival (imag-part value))
          (rexp (real-part expected))
          (iexp (imag-part expected)))
      (and (>= rval (- rexp error))
           (>= ival (- iexp error))
           (<= rval (+ rexp error))
           (<= ival (+ iexp error))))))

(define-syntax internal-test-comp1body
  (syntax-rules ()
    ((internal-test-comp1body r expr)
     (let ()
       (if (internal-test-on-test-begin r)
         (let ()
           (let ((res (internal-test-evaluate-with-catch expr)))
             (test-result-actual-value! r res)
             (internal-test-on-test-end r res))))
       (internal-test-report-result)))))

(define-syntax test-end
  (syntax-rules ()
    ((test-end)
     (internal-test-end #f '()))
    ((test-end suite-name)
     (internal-test-end suite-name '()))))

(define-syntax test-assert
  (syntax-rules ()
    ((test-assert tname test-expression)
     (let* ((r (test-runner-get))
            (name tname))
       (test-result-alist! r '((test-name . tname)))
       (internal-test-comp1body r test-expression)))
    ((test-assert test-expression)
     (let* ((r (test-runner-get)))
       (test-result-alist! r '())
       (internal-test-comp1body r test-expression)))))

(define-syntax internal-test-comp2
  (syntax-rules ()
    ((internal-test-comp2 comp tname expected expr)
     (let* ((r (test-runner-get))
            (name tname))
       (test-result-alist! r (list (cons 'test-name tname)))
       (internal-test-comp2body r comp expected expr)))
    ((internal-test-comp2 comp expected expr)
     (let* ((r (test-runner-get)))
       (test-result-alist! r '())
       (internal-test-comp2body r comp expected expr)))))

(define-syntax test-equal
  (syntax-rules ()
    ((test-equal . rest)
     (internal-test-comp2 equal? . rest))))

(define-syntax test-eqv
  (syntax-rules ()
    ((test-eqv . rest)
     (internal-test-comp2 eqv? . rest))))

(define-syntax test-eq
  (syntax-rules ()
    ((test-eq . rest)
     (internal-test-comp2 eq? . rest))))

(define-syntax test-approximate
  (syntax-rules ()
    ((test-approximate tname expected expr error)
     (internal-test-comp2 (internal-test-approximate= error) tname expected expr))
    ((test-approximate expected expr error)
     (internal-test-comp2 (internal-test-approximate= error) expected expr))))

(define-syntax internal-test-error
  (syntax-rules ()
    ((internal-test-error r etype expr)
     (internal-test-comp1body r (guard (ex (else #t)) expr #f)))))

(define-syntax test-error
  (syntax-rules ()
    ((test-error name etype expr)
     (let ((r (test-runner-get)))
       (test-result-alist! r `((test-name . ,name)))
       (internal-test-error r etype expr)))
    ((test-error etype expr)
     (let ((r (test-runner-get)))
       (test-result-alist! r '())
       (internal-test-error r etype expr)))
    ((test-error expr)
     (let ((r (test-runner-get)))
       (test-result-alist! r '())
       (internal-test-error r #t expr)))))

(define-syntax test-with-runner
  (syntax-rules ()
    ((test-with-runner runner form ...)
     (let ((saved-runner (test-runner-current)))
       (dynamic-wind
         (lambda () (test-runner-current runner))
         (lambda () form ...)
         (lambda () (test-runner-current saved-runner)))))))

(define (test-apply first . rest)
  (if (test-runner? first)
    (test-with-runner first (apply test-apply rest))
    (let ((r (test-runner-current)))
      (if r
        (let ((run-list (internal-test-runner-run-list r)))
          (cond ((null? rest)
                 (internal-test-runner-run-list! r (reverse run-list))
                 (first)) ;; actually apply procedure thunk
                (else
                  (internal-test-runner-run-list!
                    r
                    (if (eq? run-list #t) (list first) (cons first run-list)))
                  (apply test-apply rest)
                  (internal-test-runner-run-list! r run-list))))
        (let ((r (test-runner-create)))
          (test-with-runner r (apply test-apply first rest))
          ((test-runner-on-final r) r))))))

;;; Predicates

(define (internal-test-match-nth n count)
  (let ((i 0))
    (lambda (runner)
      (set! i (+ i 1))
      (and (>= i n) (< i (+ n count))))))

(define-syntax test-match-nth
  (syntax-rules ()
    ((test-match-nth n)
     (test-match-nth n 1))
    ((test-match-nth n count)
     (internal-test-match-nth n count))))

(define (internal-test-match-all . pred-list)
  (lambda (runner)
    (let ((result #t))
      (let loop ((l pred-list))
        (if (null? l)
          result
          (begin
            (if (not ((car l) runner))
              (set! result #f))
            (loop (cdr l))))))))

(define-syntax test-match-all
  (syntax-rules ()
    ((test-match-all pred ...)
     (internal-test-match-all (internal-test-as-specifier pred) ...))))

(define (internal-test-match-any . pred-list)
  (lambda (runner)
    (let ((result #f))
      (let loop ((l pred-list))
        (if (null? l)
          result
          (begin
            (if ((car l) runner)
              (set! result #t))
            (loop (cdr l))))))))

(define-syntax test-match-any
  (syntax-rules ()
    ((test-match-any pred ...)
     (internal-test-match-any (internal-test-as-specifier pred) ...))))

;; Coerce to a predicate function:
(define (internal-test-as-specifier specifier)
  (cond ((procedure? specifier) specifier)
        ((integer? specifier) (test-match-nth 1 specifier))
        ((string? specifier) (test-match-name specifier))
        (else
          (error "not a valid test specifier"))))

(define-syntax test-skip
  (syntax-rules ()
    ((test-skip pred ...)
     (let ((runner (test-runner-get)))
       (internal-test-runner-skip-list! runner
                                        (cons (test-match-all (internal-test-as-specifier pred)  ...)
                                              (internal-test-runner-skip-list runner)))))))

(define-syntax test-expect-fail
  (syntax-rules ()
    ((test-expect-fail pred ...)
     (let ((runner (test-runner-get)))
       (internal-test-runner-fail-list! runner
                                        (cons (test-match-all (internal-test-as-specifier pred)  ...)
                                              (internal-test-runner-fail-list runner)))))))

(define (test-match-name name)
  (lambda (runner)
    (equal? name (test-runner-test-name runner))))

(define (test-read-eval-string string)
  (let* ((port (open-input-string string))
         (form (read port)))
    (if (eof-object? (read-char port))
      (cond-expand
        (cyclone (eval form (create-environment '(scheme base))))
        (else (eval form (environment '(scheme base)))))
      (error "(not at eof)"))))

