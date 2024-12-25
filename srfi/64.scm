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

;; R7RS-SRFI Util:

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

(define string-trim-both
  (lambda (str . args)
    ;; TODO
    str))

(define (display-to-string value)
  (let ((output-string (open-output-string)))
    (display value output-string)
    (get-output-string output-string)))

;;; Code:

;(define (set-documentation! symbol docstring)
;"Set the docstring for @var{symbol} in current module to @var{docstring}.

;Do not use this procedure for forms that already support setting the
;docstring.  Should directly follow the definition of @var{symbol}.

;Example:

;@lisp
;(define answer 42)
;(set-documentation! 'answer
;\"The answer to life, the universe, and everything.\")
;@end lisp"
;(set-object-property! (module-ref (current-module) symbol)
;'documentation
;docstring)
;#t
;)

;(cond-expand-provide (current-module) '(srfi-64))

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

(define (test-runner-group-path runner)
  ;"Return list of names of groups we're nested in, with the outermost group first."
  (reverse (test-runner-group-stack runner)))

(define (test-runner-fail-count r)
  ;"Return the number of tests that failed, but were expected to pass."
  (or (assq-ref (test-runner-counts r) 'fail) 0))

(define (test-runner-pass-count r)
  ;"Return the number of tests that passed, and were expected to pass."
  (or (assq-ref (test-runner-counts r) 'pass) 0))

(define (test-runner-skip-count r)
  ;"Return the number of tests or test groups that were skipped."
  (or (assq-ref (test-runner-counts r) 'skip) 0))

(define (test-runner-xfail-count r)
  ;"Return the number of tests that failed, and were expected to fail."
  (or (assq-ref (test-runner-counts r) 'xfail) 0))

(define (test-runner-xpass-count r)
  ;"Return the number of tests that passed, but were expected to fail."
  (or (assq-ref (test-runner-counts r) 'xpass) 0))

;;;
;;; Test specifiers
;;;
(define (test-match-name name)
  ;"Return a specifier matching the current test name against @var{name}."
  (lambda (runner)
    (equal? name (test-runner-test-name runner))))

(define (test-match-nth n . count-arg)
  ;"Return a stateful predicate.  A counter keeps track of how many times it
  ;has been called.  The predicate matches the @var{n}'th time it is
  ;called (where 1 is the first time), and the next @code{(- @var{count} 1)}
  ;times, where @var{count} defaults to 1."
  (let* ((count (if (null? count-arg) 1 (car count-arg)))
         (i 0)
         (m (+ n (- count 1))))
    (lambda (runner)
      (set! i (+ i 1))
      (and (>= i n) (<= i m)))))

(define (obj->specifier obj)
  ;"Convert an object to a specifier accounting for the convenience short-hands."
  (cond ((procedure? obj) obj)
        ((string? obj)
         (display "HERE: ")
         (write obj)
         (newline)
         (test-match-name obj))
        ((integer? obj) (test-match-nth 1 obj))))

(define test-match-any
  (lambda specifiers-arg
    ;"Return specifier matching if any specifier in @var{specifiers} matches.
    ;Each specifier is applied, in order, so side-effects from a later specifier
    ;happen even if an earlier specifier is true."
    (let ((specifiers (map obj->specifier specifiers-arg)))
      (lambda (runner)
        (fold (lambda (specifier seed)
                (or (specifier runner) seed))
              #f
              specifiers)))))

(define test-match-all
  (lambda specifiers-arg
    ;"Return specifier matching if all @var{specifiers} match.  Each specifier is
    ;applied, in order, so side-effects from a later specifier happen even if an
    ;earlier specifier is true."
    (let ((specifiers (map obj->specifier specifiers-arg)))
      (lambda (runner)
        (fold (lambda (specifier seed)
                (and (specifier runner) seed))
              #t
              specifiers)))))

;;;
;;; Skipping selected tests
;;;
(define (test-skip specifier)
  ;  "Evaluating test-skip adds the resulting specifier to the set of currently
  ;active skip-specifiers.  Before each test (or test-group) the set of active
  ;skip-specifiers are applied to the active test-runner.  If any specifier
  ;matches, then the test is skipped.
  ;
  ;@var{specifier} can be a predicate of one argument (the test runner), a
  ;string (used as if @code{(test-match-name @var{specifier})}) or an
  ;integer (used as if @code{(test-match-nth 1 @var{specifier})})."
  (let ((r (test-runner-current)))
    (test-runner-skip-list! r (cons (obj->specifier specifier)
                                    (test-runner-skip-list r)))))

(define (any-specifier-matches? specifiers)
  ;  "Does any specifier in @var{specifiers} match current test?

  ;All specifiers are always evaluated."
  (let ((r (test-runner-current)))
    (fold (lambda (specifier seed)
            (or (specifier r) seed))
          #f
          specifiers)))

(define (should-skip?)
  ;"Should current test be skipped?"
  (any-specifier-matches? (test-runner-skip-list (test-runner-current))))

;;;
;;; Expected failures
;;;
(define (test-expect-fail specifier)
  ;  "Matching tests (where matching is defined as in test-skip) are expected to
  ;fail.  This only affects test reporting, not test execution."
  (let ((r (test-runner-current)))
    (test-runner-fail-list! r (cons (obj->specifier specifier)
                                    (test-runner-fail-list r)))))

(define (should-fail?)
  ;"Should the current test fail?"
  (any-specifier-matches? (test-runner-fail-list (test-runner-current))))

;;;
;;; Test result properties
;;;
(define test-result-ref
  (lambda (runner pname . default-arg)
    ;"Returns the property value associated with the @var{pname} property name.
    ;If there is no value associated with @var{pname} return @var{default}, or
    ;@code{#f} if @var{default} is not specified."
    (let ((default (if (null? default-arg) #f (car default-arg))))
      (or (assoc-ref (test-runner-result-alist runner) pname)
          default))))

(define (test-result-set! runner pname value)
  ;  "Sets the property value associated with the @var{pname} property name to
  ;@var{value}."
  (test-runner-result-alist! runner
                             (assoc-set! (test-runner-result-alist runner)
                                         pname
                                         value)))

(define (test-result-remove runner pname)
  ;"Remove the property with the name @var{pname}."
  (test-runner-result-alist! runner
                             (assoc-remove! (test-runner-result-alist runner)
                                            pname)))

(define (test-result-clear runner)
  ;"Remove all result properties."
  ;; Standard says the following for test-result-alist:
  ;; > However, a test-result-clear does not modify the returned alist.
  ;;
  ;; Therefore we assign a new empty list instead of removing all entries.
  (test-runner-result-alist! runner '()))

(define test-result-alist test-runner-result-alist)
;(set-documentation! 'test-result-alist
;"Returns an association list of the current result properties.  It is
;unspecified if the result shares state with the test-runner.  The result
;should not be modified; on the other hand, the result may be implicitly
;modified by future @code{test-result-set!} or @code{test-result-remove} calls.
;However, a @code{test-result-clear} does not modify the returned alist."
;)

;;;
;;; Result kind
;;;
(define test-result-kind
  (lambda runner-arg
    ;"Result code of most recent test.  Returns @code{#f} if no tests have been run yet.
    ;If we have started on a new test, but do not have a result yet, then the
    ;result kind is @code{'xfail} if the test is expected to fail, @code{'skip} if
    ;the test is supposed to be skipped, or @code{#f} otherwise."
    (test-result-ref (if (null? runner-arg) (test-runner-current) (car runner-arg)) 'result-kind)))

(define test-passed?
  (lambda runner-arg
    ;  "Is the value of @code{(test-result-kind [runner])} one of @code{'pass} or
    ;@code{'xpass}?
    ;
    ;This function is of little use, since @code{'xpass} is type of failure.  You
    ;should write your own wrapper checking @code{'pass} and @code{'xfail}
    ;instead."
    (let ((result (test-result-kind (if (null? runner-arg) (test-runner-current) (car runner-arg)))))
      (or (eq? result 'pass)
          (eq? result 'xpass)))))

;;;
;;; Simple test runner
;;;
(define (test-on-bad-count-simple runner actual-count expected-count)
  ;"Log the discrepancy between expected and actual test counts."
  (display (format "*** Expected to run ~a tests, but ~a was executed. ***~%"
                   expected-count actual-count)))

(define (test-on-bad-end-name-simple runner begin-name end-name)
  ;"Log the discrepancy between the -begin and -end suite names."
  (display (format "*** Suite name mismatch: test-begin (~a) != test-end (~a) ***~%"
                   begin-name end-name)))

(define (test-on-final-simple runner)
  ;"Display summary of the test suite."
  (display "*** Test suite finished. ***\n")
  (for-each (lambda (x)
              (let ((count ((cdr x) runner)))
                  (display (format "*** # of ~a: ~a~%" (car x) count))))
            `(("expected passes    " . ,test-runner-pass-count)
              ("expected failures  " . ,test-runner-xfail-count)
              ("unexpected passes  " . ,test-runner-xpass-count)
              ("unexpected failures" . ,test-runner-fail-count)
              ("skips              " . ,test-runner-skip-count))))

(define (test-on-group-begin-simple runner suite-name count)
  ;"Log that the group is beginning."
  (if count
    (display (format "*** Entering test group: ~a (# of tests: ~a) ***~%" suite-name count))
    (display (format "*** Entering test group: ~a ***~%" suite-name))))

(define (test-on-group-end-simple runner)
  ;"Log that the group is ending."
  ;; There is no portable way to get the test group name.
  (display (format "*** Leaving test group: ~a ***~%"
                   (car (test-runner-group-stack runner)))))

(define (test-on-test-begin-simple runner)
  ;"Do nothing."
  #f)

(define (test-on-test-end-simple runner)
  ;"Log that test is done."
  (letrec* ((maybe-print-prop
              (lambda (prop pretty?)
                (let* ((val (test-result-ref runner prop))
                       (val (string-trim-both (display-to-string val))))
                  (when val (display (format "~a: ~a~%" prop val)))))))

    (let ((result-kind (test-result-kind runner)))
      ;; Skip tests not executed due to run list.
      (when result-kind
        (display (format "* ~a: ~a~%"
                         (string-upcase (symbol->string result-kind))
                         (test-runner-test-name runner)))
        (unless (member result-kind '(pass xfail))
          ;(maybe-print-prop 'source-file    #f)
          ;(maybe-print-prop 'source-line    #f)
          ;(maybe-print-prop 'source-form    #t)
          (maybe-print-prop 'expected-value #f)
          (maybe-print-prop 'expected-error #t)
          (maybe-print-prop 'actual-value   #f)
          (maybe-print-prop 'actual-error   #t))))))

(define (test-runner-simple)
  ;  "Creates a new simple test-runner, that prints errors and a summary on the
  ;standard output port."
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

;;;
;;; Test runner
;;;

(define test-runner-current (make-parameter #f))
;(set-documentation! 'test-runner-current
;  "Parameter representing currently installed test runner.")

(define (test-runner-get)
  ;"Get current test runner if any, raise an exception otherwise."
  (or (test-runner-current)
      (error 'no-test-runner)))

(define test-runner-factory (make-parameter test-runner-simple))
;(set-documentation! 'test-runner-factory
;  "Factory producing new test runner.  Has to be a procedure of arity 0
;returning new test runner.  Defaults to @code{test-runner-simple}.")

(define (test-runner-create)
  ;"Create a new test-runner. Equivalent to @code{((test-runner-factory))}."
  ((test-runner-factory)))

(define (test-runner-null)
  (let ((r (%make-test-runner))
        (dummy-1 (lambda (_) #f))
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

;;;
;;; Test groups and paths
;;;
(define-record-type <group>
  (make-group name count executed-count installed-runner? previous-skip-list)
  group?
  (name               group-name)
  (count              group-count)
  (executed-count     group-executed-count group-executed-count!)
  (installed-runner?  group-installed-runner?)
  (previous-skip-list group-previous-skip-list))

(define (increment-executed-count r)
  ;"Increment executed count of the first group."
  (let ((groups (test-runner-groups r)))
    (unless (null? groups)
      (let ((group (car groups)))
        (group-executed-count! group
                               (+ (group-executed-count group) 1))))))

(define (test-begin suite-name . count-arg)
  ;"Enter a new test group.

  ;As implementation extension, in addition to strings, symbols are also
  ;supported as @var{suite-name}."
  (let* ((count (if (null? count-arg) #f (car count-arg)))
         (r (if (test-runner-current) (test-runner-current) (test-runner-create)))
         (install? (if (test-runner-current) #f #t))
         (group (make-group suite-name
                            count
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

(define (%cmp-group-name a b)
  (cond ((and (string? a) (string? b)) (string=? a b))
        ((and (symbol? a) (symbol? b)) (eq? a b))
        (else #f)))

(define test-end
  (lambda suite-name-arg
    ;"Leave the current test group."
    (let* ((r (test-runner-current))
           (group (car (test-runner-groups r))))

      (let* ((suite-name (if (null? suite-name-arg) #f (car suite-name-arg)))
             (begin-name (car (test-runner-group-stack r)))
             (end-name suite-name))
        (when (and end-name (not (%cmp-group-name begin-name end-name)))
          ((test-runner-on-bad-end-name r) r begin-name end-name)
          (error "Bad end name" begin-name end-name)))

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
        (test-runner-current #f)))))

(define-syntax test-group
  (syntax-rules ()
    ;"Execute @var{decl-or-expr ...} in a named test group.  The whole group is
    ; skipped if it matches an active test-skip."
    ((_ suite-name decl-or-expr ...)
     (let ((r (test-runner-current))
           (name suite-name))
       ;; Since test-runner stores skip state, if we do not have test-runner,
       ;; the test cannot be on skip list (it does not exist).
       (when (or (not r)
                 (begin
                   ;; Specifiers are using -test-name, so we need to do this
                   ;; here and not rely on test-begin.
                   (test-runner-test-name! r name)
                   (not (should-skip?))))
         (dynamic-wind
           (lambda () (test-begin name))
           (lambda () decl-or-expr ...)
           (lambda () (test-end   name))))))))

;;;
;;; Handling set-up and cleanup
;;;
(define-syntax test-group-with-cleanup
  (syntax-rules ()
    ;"Execute each of the @var{decl-or-expr} forms in order, and then execute
    ;the @var{cleanup-form}.  The latter shall be executed even if one of a
    ;@var{decl-or-expr} forms raises an exception."
    ((_ suite-name decl-or-expr ... cleanup-form)
     (dynamic-wind
       (lambda () #t)
       (lambda () (test-group suite-name decl-or-expr ...))
       (lambda () cleanup-form)))))

;;;
;;; Simple test-cases
;;;
(define (preliminary-result-kind! r fail? skip?)
  ;"Set result-kind before the test was run based on @var{fail?} and @var{skip?}."
  (test-result-set! r 'result-kind (cond
                                     ;; I think this order is stupid, but it is
                                     ;; what SRFI demands.
                                     (fail? 'xfail)
                                     (skip? 'skip)
                                     (else  #f))))

(define (final-result-kind! r match? fail-expected?)
  ;"Set the final result-kind based on @var{match?} and @var{fail-expected?}."
  (test-result-set! r
                    'result-kind
                    (cond ((and match? fail-expected?) 'xpass)
                          (match? 'pass)
                          (fail-expected? 'xfail)
                          (else 'fail))))

(define-syntax fail-on-exception
  (syntax-rules ()
    ((_ thunk)
     ;"Run the thunk and return the result.  If exception occurs, record it and return @code{#f}."
     (call-with-current-continuation
       (lambda (k)
         (with-exception-handler
           (lambda (exc)
             (test-result-set! (test-runner-current) 'actual-error exc)
             (k #f))
           (lambda () (thunk))))))))

(define (increment-test-count r)
  ;"Increment the test count for the current 'result-kind."
  (let* ((kind (test-result-kind r))
         (counts (test-runner-counts r))
         (c (or (assq-ref counts kind) 0)))
    (test-runner-counts! r (assq-set! counts kind (+ c 1)))))

(define-syntax test-thunk
  ;"Run test @var{thunk} while taking into account currently active skip list
  ;and such.  The result alist is initially set to @var{properties}, however
  ;@var{thunk} is expected to make additions (actual, expected values, ...).

  ;@var{thunk} must return @code{#f} to indicate test failure.  Otherwise the
  ;test is considered successful."
  (syntax-rules ()
    ((_ test-name thunk)
     (let ((r (test-runner-current)))
       ;; Since skip checks are using -test-name, set it first.
       (test-runner-test-name! r (or test-name ""))
       ;(test-runner-result-alist! r properties)

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
         (increment-test-count r))))))

(define-syntax %test-assert
  (syntax-rules ()
    ((_ test-name expression)
     (test-thunk (let () test-name)
                 (lambda ()
                   (let ((r (test-runner-current))
                         (a (let () expression)))
                     (test-result-set! r 'actual-value a)
                     a))))))

(define-syntax test-assert
  (syntax-rules ()
    ((_ test-name expression)
     (%test-assert test-name expression))
    ((_ expression)
     (%test-assert #f expression))))
;(set-documentation! 'test-assert
;  "@defspec test-assert test-name expression
;@defspecx test-assert expression
;Evaluate the @var{expression}, the test passes if the result is true.
;
;@var{test-name} and @var{expression} are evaluated just once.  It is an error
;to invoke @code{test-assert} if there is no current test runner.
;
;@end defspec")

(define-syntax %%test-2
  (syntax-rules ()
    ((_ test-proc test-name expected test-expr)
     (test-thunk (let () test-name)
                 (lambda ()
                   (let ((r (test-runner-current))
                         (e (let () expected))
                         (a (let () test-expr)))
                     (test-result-set! r 'expected-value e)
                     (test-result-set! r 'actual-value   a)
                     (test-proc e a)))))))

#;(define-syntax %test-2
(syntax-rules ()
  ((_ name test-proc)
   (define-syntax name
     (syntax-rules ()
       ((_ test-name expected test-expr)
        (%%test-2 test-proc test-name expected test-expr))
       ((_ expected test-expr)
        (%%test-2 test-proc #f expected test-expr)))))))

;(%test-2 test-eq eq?)
;(%test-2 test-eqv eqv?)
;(%test-2 test-equal equal?)

(define-syntax test-eq
  (syntax-rules ()
    ((_ test-name expected test-expr)
     (%%test-2 eq? test-name expected test-expr))
    ((_ expected test-expr)
     (%%test-2 eq? #f expected test-expr))))

(define-syntax test-eqv
  (syntax-rules ()
    ((_ test-name expected test-expr)
     (%%test-2 eqv? test-name expected test-expr))
    ((_ expected test-expr)
     (%%test-2 eqv? #f expected test-expr))))

(define-syntax test-equal
  (syntax-rules ()
    ((_ test-name expected test-expr)
     (%%test-2 equal? test-name expected test-expr))
    ((_ expected test-expr)
     (%%test-2 equal? #f expected test-expr))))

;(set-documentation! 'test-eq
;  "@defspec test-eq test-name expected test-expr
;@defspecx test-eq expected test-expr
;Test whether result of @var{test-expr} matches @var{expected} using
;@code{eq?}.
;
;@end defspec")
;(set-documentation! 'test-eqv
;  "@defspec test-eqv test-name expected test-expr
;@defspecx test-eqv expected test-expr
;Test whether result of @var{test-expr} matches @var{expected} using
;@code{eqv?}.
;
;@end defspec")
;(set-documentation! 'test-equal
;  "@defspec test-equal test-name expected test-expr
;@defspecx test-equal expected test-expr
;Test whether result of @var{test-expr} matches @var{expected} using
;@code{equal?}.
;
;@end defspec")

(define (within-epsilon eps)
  (lambda (expected actual)
    (and (>= actual (- expected eps))
         (<= actual (+ expected eps)))))

(define-syntax %test-approximate
  (syntax-rules ()
    ((_ test-name expected test-expr error)
     (test-thunk (let () test-name)
                 (lambda ()
                   (let ((r (test-runner-current))
                         (e (let () expected))
                         (a (let () test-expr))
                         (eps (let () error)))
                     (test-result-set! r 'expected-value e)
                     (test-result-set! r 'actual-value   a)
                     (test-result-set! r 'epsilon        eps)
                     ((within-epsilon eps) e a)))))))

(define-syntax test-approximate
  (syntax-rules ()
    ((_ test-name expected test-expr error)
     (%test-approximate test-name expected test-expr error))
    ((_ expected test-expr error)
     (%test-approximate #f expected test-expr error))))
;(set-documentation! 'test-approximate
;  "@defspec test-approximate test-name expected test-expr error
;@defspecx test-approximate expected test-expr error
;Test whether result of @var{test-expr} is within @var{error} of
;@var{expected}.
;
;@end defspec")

(define-syntax %test-error
  (syntax-rules ()
    ((_ test-name error-type test-expr)
     (test-thunk (let () test-name)
                 (lambda ()
                   (let ((r (test-runner-current))
                         (e-type (let () error-type)))
                     (test-result-set! r 'expected-error e-type)
                     (call-with-current-continuation
                       (lambda (k)
                         (with-exception-handler
                           (lambda (exc)
                             (test-result-set! r 'actual-error exc)
                             (k
                               (cond
                                 ((equal? e-type #t) #t)
                                 ((equal? e-type #f) #f)
                                 ((symbol? e-type)
                                  ;; TODO
                                  ;(eq? e-type (exception-kind exc))
                                  (display "%test-error 1 :")
                                  (display e-type)
                                  (newline)
                                  #f
                                  )
                                 ((procedure? e-type)
                                  (e-type exc))
                                 ;; TODO
                                 ;((exception-type? e-type) ((exception-predicate e-type) exc))
                                 (else
                                   (display "%test-error 2 :")
                                   (display e-type)
                                   (newline)))))
                           (lambda ()
                             test-expr
                             (not e-type)))))))))))

(define-syntax test-error
  (syntax-rules ()
    ((_ test-name error-type test-expr)
     (%test-error test-name error-type test-expr))
    ((_ error-type test-expr)
     (%test-error #f error-type test-expr))
    ((_ test-expr)
     (%test-error #f #t test-expr))))
;(set-documentation! 'test-error
;  "@defspec test-error test-name error-type test-expr
;@defspecx test-error error-type test-expr
;@defspecx test-error test-expr
;Evaluating @var{test-expr} is expected to signal an error.  The kind of error
;is indicated by @var{error-type}.  It is always evaluated (even when no
;exception is raised) and can be one of the following.
;
;@table @code
;@item #t
;Per specification, this matches any exception.
;
;@item #f
;Pass if no exception is raised.
;
;@item symbol?
;Symbols can be used to match against exceptions created using
;@code{throw} and @code{error}.
;
;@item procedure?
;The exception object is passed to the predicate procedure.  Example
;would be @code{external-error?}.
;
;@item exception-type?
;Exception type like for example @code{&external-error}.
;
;@end table
;
;@end defspec")
;
;;;
;;; Testing syntax
;;;
(define (test-read-eval-string string)
  ;"Parse the @var{string} (using @code{read}), evaluate and return the
  ;result.
  ;
  ;  An error is signaled if there are unread characters after the @code{read} is
  ;  done."
  (let* ((string-port (open-input-string string))
         (exp (read string-port)))
    (unless (eof-object? (read-char))
      (error "read did not consume whole string"))
    (close-port string-port)
    (eval exp (cond-expand
                (cyclone (create-environment))
                (else (environment '(scheme base)))))))

;;;
;;; Running specific tests with a specified runner
;;;
(define-syntax test-with-runner
  (syntax-rules ()
    ;"Execute each @var{decl-or-expr} in order in a context where the current
    ;test-runner is @var{runner}."
    ((_ runner decl-or-expr ...)
     (parameterize ((test-runner-current runner))
       #t
       decl-or-expr ...))))

(define (should-run?)
  ;"Should current test be considered for execution according to currently active run list?"
  (let ((run-list ((test-runner-run-list (test-runner-current)))))
    (if run-list
      (any-specifier-matches? run-list)
      #t)))

(define test-apply
  (lambda (maybe-runner . args)
    (let ((thunk (car (reverse args)))
          (runner (if (test-runner? (car args))
                    (car args)
                    (if (test-runner-current)
                      (test-runner-current)
                      (test-runner-create))))
          (specifiers (if (= (length args) 1)
                        (list)
                        (map obj->specifier (reverse (list-tail (reverse args) 1))))))
      (test-with-runner runner
                        (parameterize (((test-runner-run-list runner)
                                        (if (null? specifiers)
                                          #f
                                          (map obj->specifier specifiers))))
                          (thunk))))))

;(set-documentation! 'test-apply
;  "@defunx test-apply runner specifier ... procedure
;@defunx test-apply specifier ... procedure
;
;Call @var{procedure} with no arguments using the specified @var{runner} as the
;current test-runner.  If runner is omitted, then @code{(test-runner-current)}
;is used.  If there is no current runner, one is created as in
;@code{test-begin}.  If one or more @var{specifiers} are listed then only tests
;matching the @var{specifiers} are executed.  A specifier has the same form as
;one used for @code{test-skip}.  A test is executed if it matches any of the
;specifiers in the @code{test-apply} and does not match any active
;@code{test-skip} specifiers.")
