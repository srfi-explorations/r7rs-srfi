
;;; Copyright (C) 2024 Tomas Volf <~@wolfsden.cz>
;;; Copyright (C) 2024 Retropikzel <retropikzel@iki.fi>

;;
;; This library is free software; you can redistribute it and/or
;; modify it under the terms of the GNU Lesser General Public
;; License as published by the Free Software Foundation; either
;; version 3 of the License, or (at your option) any later version.
;;
;; This library is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; Lesser General Public License for more details.
;;
;; You should have received a copy of the GNU Lesser General Public
;; License along with this library; if not, write to the Free Software
;; Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA

;;; Commentary:

;;; Implementation of the SRFI-64.  In contrast to the reference
;;; implementation of @samp{(srfi srfi-64)} it aims to implement the
;;; standard fully and correctly.

;;; R7RS-SRFI brought in utilities:

(define-syntax receive
  (syntax-rules ()
    ((_ formals expression body ...)
     (call-with-values (lambda () expression)
                       (lambda formals body ...)))))

(define (%cars+cdrs+ lists cars-final)
  (call-with-current-continuation
    (lambda (abort)
      (let recur ((lists lists))
        (if (pair? lists)
          (receive (list other-lists) (car+cdr lists)
                   (if (null? list) (abort '() '()) ; LIST is empty -- bail out
                     (receive (a d) (car+cdr list)
                              (receive (cars cdrs) (recur other-lists)
                                       (values (cons a cars) (cons d cdrs))))))
          (values (list cars-final) '()))))))

(define (car+cdr pair) (values (car pair) (cdr pair)))

(define (fold kons knil lis1 . lists)
  (if (pair? lists)
    (let lp ((lists (cons lis1 lists)) (ans knil))    ; N-ary case
      (receive (cars+ans cdrs) (%cars+cdrs+ lists ans)
               (if (null? cars+ans) ans ; Done.
                 (lp cdrs (apply kons cars+ans)))))

    (begin
      (let lp ((lis lis1) (ans knil))           ; Fast path
        (if (null? lis) ans
          (lp (cdr lis) (kons (car lis) ans)))))))


(define format
  (lambda (arg1 . args)
    ;; TODO
    (display args)
    (newline)))

(define-syntax assq-ref
  (syntax-rules ()
    ((_ alist key)
     (if (assq key alist)
       (cdr (assq key alist))
       #f))))

(define-syntax assq-set!
  (syntax-rules ()
    ((_ alist key value)
     (let ((result (list))
           (found? #f))
       (for-each
         (lambda (item)
           (if (eq? (car item) key)
             (begin
               (set! found? #t)
               (set! result (cons (cons key value) result)))
             (set! result (cons item result))))
         alist)
       (when (not found?) (set! result (cons (cons key value) result)))
       result))))

(define-syntax assoc-ref
  (syntax-rules ()
    ((_ alist key)
     (if (assoc key alist)
       (cdr (assoc key alist))
       #f))))

(define-syntax assoc-set!
  (syntax-rules ()
    ((_ alist key value)
     (let ((result (list))
           (found? #f))
       (for-each
         (lambda (item)
           (if (equal? (car item) key)
             (begin
               (set! found? #t)
               (set! result (cons (cons key value) result)))
             (set! result (cons item result))))
         alist)
       (when (not found?) (set! result (cons (cons key value) result)))
       result))))

(define-syntax assoc-remove!
  (syntax-rules ()
    ((_ alist key)
     (let ((result (list)))
       (for-each
         (lambda (item)
           (when (not (equal? (car item) key))
             (set! result (cons item result))))
         alist)
       result))))

(define string-trim-both
  (lambda (str . args)
    ;; TODO
    str))

(define-syntax with-output-to-string
  (syntax-rules ()
    ((_ thunk)
     (parameterize
       ((current-output-port
          (open-output-string)))
       thunk
       (get-output-string (current-output-port))))))

;;; Code:

(define-record-type <group>
  (make-group name count executed-count installed-runner? previous-skip-list)
  group?
  (name               group-name)
  (count              group-count)
  (executed-count     group-executed-count group-executed-count!)
  (installed-runner?  group-installed-runner?)
  (previous-skip-list group-previous-skip-list))

(define-record-type <test-runner>
  (%make-test-runner)
  test-runner?
  ;; Test result properties
  (result-alist test-runner-result-alist test-runner-result-alist!)
  ;; Call-back hooks
  (on-bad-count     test-runner-on-bad-count     test-runner-on-bad-count!)
  (on-bad-end-name  test-runner-on-bad-end-name  test-runner-on-bad-end-name!)
  (on-final         test-runner-on-final         test-runner-on-final!)
  (on-group-begin   test-runner-on-group-begin   test-runner-on-group-begin!)
  (on-group-end     test-runner-on-group-end     test-runner-on-group-end!)
  (on-test-begin    test-runner-on-test-begin    test-runner-on-test-begin!)
  (on-test-end      test-runner-on-test-end      test-runner-on-test-end!)
  ;; Test-runner components
  (counts       test-runner-counts       test-runner-counts!)

  (test-name    test-runner-test-name    test-runner-test-name!)

  (group-stack  test-runner-group-stack  test-runner-group-stack!)

  (aux-value    test-runner-aux-value    test-runner-aux-value!)

  ;; Implementation details
  (fail-list test-runner-fail-list test-runner-fail-list!)
  (groups    test-runner-groups    test-runner-groups!)
  (run-list  test-runner-run-list  test-runner-run-list!)
  (skip-list test-runner-skip-list test-runner-skip-list!))

;; Parameter representing currently installed test runner.
(define test-runner-current (make-parameter #f))

(define (test-runner-reset runner)
  (test-runner-result-alist! runner '())

  (test-runner-counts! runner '())

  (test-runner-test-name! runner #f)

  (test-runner-group-stack! runner '())

  (test-runner-fail-list! runner '())
  (test-runner-groups!    runner '())
  ;; run-list is not documented as part of the test-runner, so it should *not*
  ;; be cleared.
  (test-runner-skip-list! runner '()))

(define (test-on-bad-count-simple runner actual-count expected-count)
  ;; Log the discrepancy between expected and actual test counts.
  (format #t "*** Expected to run ~a tests, but ~a was executed. ***~%"
          expected-count actual-count))

(define (test-on-bad-end-name-simple runner begin-name end-name)
  ;; Log the discrepancy between the -begin and -end suite names.
  (format #t "*** Suite name mismatch: test-begin (~a) != test-end (~a) ***~%"
          begin-name end-name))

(define (test-runner-fail-count r)
  ;; Return the number of tests that failed, but were expected to pass.
  (or (assq-ref (test-runner-counts r) 'fail) 0))

(define (test-runner-pass-count r)
  ;; Return the number of tests that passed, and were expected to pass.
  (or (assq-ref (test-runner-counts r) 'pass) 0))

(define (test-runner-skip-count r)
  ;; Return the number of tests or test groups that were skipped.
  (or (assq-ref (test-runner-counts r) 'skip) 0))

(define (test-runner-xfail-count r)
  ;; Return the number of tests that failed, and were expected to fail.
  (or (assq-ref (test-runner-counts r) 'xfail) 0))

(define (test-runner-xpass-count r)
  ;; Return the number of tests that passed, but were expected to fail.
  (or (assq-ref (test-runner-counts r) 'xpass) 0))

(define (test-on-final-simple runner)
  ;; Display summary of the test suite.
  (display "*** Test suite finished. ***\n")
  (for-each (lambda (x)
              (let ((count ((cdr x) runner)))
                (when (> count 0)
                  (format #t "*** # of ~a: ~a~%" (car x) count))))
            `(("expected passes    " . ,test-runner-pass-count)
              ("expected failures  " . ,test-runner-xfail-count)
              ("unexpected passes  " . ,test-runner-xpass-count)
              ("unexpected failures" . ,test-runner-fail-count)
              ("skips              " . ,test-runner-skip-count))))

(define (test-on-group-begin-simple runner suite-name count)
  ;; Log that the group is beginning.
  (format #t "*** Entering test group: ~a~@[ (# of tests: ~a) ~] ***~%"
          suite-name count))

(define (test-on-group-end-simple runner)
  ;; Log that the group is ending.
  ;; There is no portable way to get the test group name.
  (format #t "*** Leaving test group: ~a ***~%"
          (car (test-runner-group-stack runner))))
(define (test-on-test-begin-simple runner)
  ;; Do nothing.
  #f)

(define (test-result-ref runner pname . default)
  ;; Returns the property value associated with the @var{pname} property name.
  ;; If there is no value associated with @var{pname} return @var{default}, or
  ;; @code{#f} if @var{default} is not specified."
  (or (assoc-ref (test-runner-result-alist runner) pname)
      (if (null? default) default (car default))))

(define (test-result-kind . runner)
  ;; Result code of most recent test.  Returns @code{#f} if no tests have been run yet.
  ;; If we have started on a new test, but do not have a result yet, then the
  ;; result kind is @code{'xfail} if the test is expected to fail, @code{'skip} if
  ;; the test is supposed to be skipped, or @code{#f} otherwise.
  (test-result-ref (if (null? runner) (test-runner-current) (car runner)) 'result-kind))

(define (test-on-test-end-simple runner)
  ;; Log that test is done.
  (define (maybe-print-prop prop pretty?)
    (let* ((val (test-result-ref runner prop))
           (val (string-trim-both
                 (with-output-to-string
                   (lambda ()
                     (if pretty?
                       (write val) ;; TODO
                         ;; (pretty-print val #:per-line-prefix "             ")
                         (display val)))))))
      (when val
        (format #t "~a: ~a~%" prop val))))

  (let ((result-kind (test-result-kind runner)))
    ;; Skip tests not executed due to run list.
    (when result-kind
      (format #t "* ~:@(~a~): ~a~%"
              result-kind
              (test-runner-test-name runner))
      (unless (member result-kind '(pass xfail))
        (maybe-print-prop 'source-file    #f)
        (maybe-print-prop 'source-line    #f)
        (maybe-print-prop 'source-form    #t)
        (maybe-print-prop 'expected-value #f)
        (maybe-print-prop 'expected-error #t)
        (maybe-print-prop 'actual-value   #f)
        (maybe-print-prop 'actual-error   #t)))))

(define (test-runner-simple)
  ;; Creates a new simple test-runner, that prints errors and a summary on the
  ;; standard output port.
  (let ((r (%make-test-runner)))
    (test-runner-reset r)

    (test-runner-on-bad-count!    r test-on-bad-count-simple)
    (test-runner-on-bad-end-name! r test-on-bad-end-name-simple)
    (test-runner-on-final!        r test-on-final-simple)
    (test-runner-on-group-begin!  r test-on-group-begin-simple)
    (test-runner-on-group-end!    r test-on-group-end-simple)
    (test-runner-on-test-begin!   r test-on-test-begin-simple)
    (test-runner-on-test-end!     r test-on-test-end-simple)

    (test-runner-run-list!        r (make-parameter #f))
    r))

;; Factory producing new test runner.  Has to be a procedure of arity 0
;; returning new test runner.  Defaults to @code{test-runner-simple}.
(define test-runner-factory (make-parameter test-runner-simple))

(define (test-runner-create)
  ;; Create a new test-runner. Equivalent to @code{((test-runner-factory))}.
  ((test-runner-factory)))

(define (test-begin suite-name . count)
  ;; Enter a new test group.
  ;; As implementation extension, in addition to strings, symbols are also
  ;; supported as @var{suite-name}.
  (let* ((r (if (test-runner-current)
              (test-runner-current)
              (test-runner-create)))
         (install? (if (test-runner-current) #f #t))
         (group (make-group suite-name
                            (if (null? count) 0 (car count))
                            0
                            install?
                            (test-runner-skip-list r))))
    (when install?
      (test-runner-current r))

    (test-runner-test-name! r suite-name)
    (test-runner-groups! r (cons group (test-runner-groups r)))
    ;; Per-strict reading of SRFI-64, -group-stack is required to be
    ;; non-copying, hence non-computed.  So duplicate the information already
    ;; present in -groups here.
    (test-runner-group-stack! r (cons suite-name (test-runner-group-stack r)))

    ((test-runner-on-group-begin r) r suite-name count)))

(define (test-runner-null)
  (let ((r (%make-test-runner))
        (dummy-1 (lambda (_)        #f))
        (dummy-3 (lambda (_ __ ___) #f)))
    (test-runner-reset r)

    (test-runner-on-bad-count!    r dummy-3)
    (test-runner-on-bad-end-name! r dummy-3)
    (test-runner-on-final!        r dummy-1)
    (test-runner-on-group-begin!  r dummy-3)
    (test-runner-on-group-end!    r dummy-1)
    (test-runner-on-test-begin!   r dummy-1)
    (test-runner-on-test-end!     r dummy-1)

    (test-runner-run-list!        r (make-parameter #f))
    r))

(define (any-specifier-matches? specifiers)
  ;; Does any specifier in @var{specifiers} match current test?
  ;; All specifiers are always evaluated.
  (let ((r (test-runner-current)))
    (fold (lambda (specifier seed)
            (or (specifier r) seed))
          #f
          specifiers)))

(define (should-fail?)
  ;; Should the current test fail?"
  (any-specifier-matches? (test-runner-fail-list (test-runner-current))))

(define (should-run?)
  ;; Should current test be considered for execution according to currently
  ;; active run list?"
  (let ((run-list ((test-runner-run-list (test-runner-current)))))
    (if run-list
        (any-specifier-matches? run-list)
        #t)))

(define (should-skip?)
  ;; Should current test be skipped?
  (any-specifier-matches? (test-runner-skip-list (test-runner-current))))

(define (preliminary-result-kind! r fail? skip?)
  ;;Set result-kind before the test was run based on @var{fail?} and
  ;; @var{skip?}.
  (test-result-set! r 'result-kind (cond
                                    ;; I think this order is stupid, but it is
                                    ;; what SRFI demands.
                                    (fail? 'xfail)
                                    (skip? 'skip)
                                    (else  #f))))

(define (final-result-kind! r match? fail-expected?)
  ;; Set the final result-kind based on @var{match?} and @var{fail-expected?}.
  (test-result-set! r 'result-kind (cond ((and match? fail-expected?)
                                          'xpass)
                                         (match?
                                          'pass)
                                         (fail-expected?
                                          'xfail)
                                         (else
                                          'fail))))

(define (test-result-set! runner pname value)
  ;; Sets the property value associated with the @var{pname} property name to
  ;; @var{value}.
  (test-runner-result-alist! runner
                             (assoc-set! (test-runner-result-alist runner)
                                         pname
                                         value)))

(define (fail-on-exception thunk)
  ;; Run the thunk and return the result.  If exception occurs, record it and
  ;; return @code{#f}.
  (call-with-current-continuation
    (lambda (return)
      (with-exception-handler
        (lambda (exc)
          (test-result-set! (test-runner-current) 'actual-error exc)
          (return #f))
        (lambda () (thunk))))))

(define (increment-executed-count r)
  ;; Increment executed count of the first group.
  (let ((groups (test-runner-groups r)))
    (unless (null? groups)
      (let ((group (car groups)))
        (group-executed-count! group
                               (+ (group-executed-count group) 1))))))

(define (increment-test-count r)
  ;; Increment the test count for the current 'result-kind.
  (let* ((kind (test-result-kind r))
         (counts (test-runner-counts r))
         (c (or (assq-ref counts kind) 0)))
    (test-runner-counts! r (assq-set! counts kind (+ c 1)))))

(define (test-thunk test-name properties thunk)
  ;; Run test @var{thunk} while taking into account currently active skip list
  ;; and such.  The result alist is initially set to @var{properties}, however
  ;; @var{thunk} is expected to make additions (actual, expected values, ...).

  ;; @var{thunk} must return @code{#f} to indicate test failure.  Otherwise the
  ;; test is considered successful.
  (let ((r (test-runner-current)))
    ;; Since skip checks are using -test-name, set it first.
    (test-runner-test-name! r (or test-name ""))
    (test-runner-result-alist! r properties)

    (let ((fail? (should-fail?))
          (run?  (should-run?))
          (skip? (should-skip?)))
      (preliminary-result-kind! r fail? skip?)
      ((test-runner-on-test-begin r) r)
      (when run?
        (if skip?
            (test-result-set! r 'result-kind 'skip)
            (begin
              (final-result-kind! r (fail-on-exception thunk) fail?)
              (increment-executed-count r))))
      ((test-runner-on-test-end r) r)
      (increment-test-count r))))

(define-syntax %test-assert
  (syntax-rules ()
    ((_ test-name expression)
     (test-thunk (begin test-name)
                 (list)
                 ;;'#,(syntax->source-properties #'syn)
                 (lambda ()
                    (let ((r (test-runner-current))
                          (a (begin expression)))
                      (test-result-set! r 'actual-value a)
                      a))))))

(define-syntax test-assert
  (syntax-rules  ()
    ((_ test-name expression)
     (%test-assert test-name expression))
    ((_ expression)
     (%test-assert #f        expression))))

(define-syntax test-with-runner
  (syntax-rules ()
    ;; Execute each @var{decl-or-expr} in order in a context where the current
    ;; test-runner is @var{runner}."
    ((_ runner decl-or-expr ...)
     (parameterize ((test-runner-current runner))
       #t
       decl-or-expr ...))))

(define-syntax %%test-2
  (syntax-rules ()
    ((_ test-proc test-name expected test-expr)
     (test-thunk (begin test-name)
                 (list)
                 ;; '#,(syntax->source-properties #'syn)
                 (lambda ()
                    (let ((r (test-runner-current))
                          (e (begin expected))
                          (a (begin test-expr)))
                      (test-result-set! r 'expected-value e)
                      (test-result-set! r 'actual-value   a)
                      (test-proc e a)))))))

(define-syntax %test-2
  (syntax-rules ()
    ((_ name test-proc)
     (define-syntax name
         (syntax-rules ()
           ((_ test-name expected test-expr)
            (%%test-2 test-proc test-name expected test-expr))
           ((_ expected test-expr)
            (%%test-2 test-proc #f expected test-expr)))))))

(%test-2 test-eq    eq?)
(%test-2 test-eqv   eqv?)
(%test-2 test-equal equal?)

(define (%cmp-group-name a b)
  ;(match (list a b)
    ;(((? string?) (? string?))
     ;(string=? a b))
    ;(((? symbol?) (? symbol?))
     ;(eq? a b))
    ;(_ #f))
    (display "A: ")
    (display a)
    (newline)
    (display "B: ")
    (display b)
    (newline)
    (cond ((and (string? a) (string? b)) (string=? a b))
          ((and (symbol? a) (symbol? b)) (eq? a b))
          ;((or (null? a) (null? b)) #t)
          (else #f))
  )

(define (test-end . suite-name-arg)
  ;; Leave the current test group.
  (let* ((suite-name (if (null? suite-name-arg) #f (car suite-name-arg)))
         (r (test-runner-current))
         (group (car (test-runner-groups r))))

    ;; FIXME
    #;(let ((begin-name (car (test-runner-group-stack r)))
          (end-name   suite-name))
      (when (and end-name (not (%cmp-group-name begin-name end-name)))
        ((test-runner-on-bad-end-name r) r begin-name end-name)
        (error "" begin-name end-name)))

    (let ((expected-count (group-count group))
          (actual-count   (group-executed-count group)))
      (when (and expected-count (not (= expected-count actual-count)))
        ((test-runner-on-bad-count r) r actual-count expected-count)))

    ((test-runner-on-group-end r) r)

    (test-runner-groups!      r (cdr (test-runner-groups      r)))
    (test-runner-group-stack! r (cdr (test-runner-group-stack r)))
    (test-runner-skip-list!   r (group-previous-skip-list group))

    (if (null? (test-runner-group-stack r))
        ((test-runner-on-final r) r)
        (increment-executed-count r))

    (when (group-installed-runner? group)
      (test-runner-current #f))))
