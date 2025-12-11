(define-library
  (srfi 64)
  (cond-expand
    (racket
      (import (scheme base)
              (scheme case-lambda)
              (scheme eval)
              (scheme file)
              (scheme process-context)
              (scheme read)
              (scheme write)))
    (tr7
      (import (except (scheme base) make-parameter parameterize)
              (scheme case-lambda)
              (scheme eval)
              (scheme file)
              (scheme process-context)
              (scheme read)
              (scheme write)
              (srfi 39))
      (begin
        (define (approx= margin)
          (lambda (value expected)
            (error "approx= not supported, missing (scheme complex)")))))
    (else
      (import (except (scheme base) make-parameter parameterize)
              (scheme case-lambda)
              (scheme complex)
              (scheme eval)
              (scheme file)
              (scheme process-context)
              (scheme read)
              (scheme write)
              (srfi 39))
      (begin
        (define (approx= margin)
          (lambda (value expected)
            (let ((rval (real-part value))
                  (ival (imag-part value))
                  (rexp (real-part expected))
                  (iexp (imag-part expected)))
              (and (>= rval (- rexp margin))
                   (>= ival (- iexp margin))
                   (<= rval (+ rexp margin))
                   (<= ival (+ iexp margin)))))))))
  (cond-expand
    ((or stklos mit cyclone)
     ; Need to export extra for these to work
     (export %test-assert
             %test-compare
             %test-error
             %test-group
             test-assert/source-info
             test-compare/source-info
             test-error/source-info))
    (else))
  (export test-begin
          test-end
          test-group
          test-group-with-cleanup
          test-skip
          test-expect-fail
          test-match-name
          test-match-nth
          test-match-all
          test-match-any
          test-assert
          test-eqv
          test-eq
          test-equal
          test-approximate
          test-error
          test-read-eval-string
          test-apply test-with-runner
          test-exit
          test-runner-null
          test-runner?
          test-runner-reset
          test-result-alist
          test-result-alist!
          test-result-ref
          test-result-set!
          test-result-remove
          test-result-clear
          test-runner-pass-count
          test-runner-fail-count
          test-runner-xpass-count
          test-runner-xfail-count
          test-runner-skip-count
          test-runner-test-name
          test-runner-group-path
          test-runner-group-stack
          test-runner-aux-value
          test-runner-aux-value!
          test-result-kind test-passed?
          test-runner-on-test-begin
          test-runner-on-test-begin!
          test-runner-on-test-end
          test-runner-on-test-end!
          test-runner-on-group-begin
          test-runner-on-group-begin!
          test-runner-on-group-end
          test-runner-on-group-end!
          test-runner-on-final
          test-runner-on-final!
          test-runner-on-bad-count
          test-runner-on-bad-count!
          test-runner-on-bad-end-name
          test-runner-on-bad-end-name!
          test-runner-factory
          test-runner-create
          test-runner-current
          test-runner-get
          test-runner-simple
          test-on-group-begin-simple
          test-on-group-end-simple
          test-on-final-simple
          test-on-test-begin-simple
          test-on-test-end-simple
          test-on-bad-count-simple
          test-on-bad-end-name-simple)

  (cond-expand
    ;; racket-r7rs has bug with records https://github.com/lexi-lambda/racket-r7rs/pull/26
    (racket
      (begin
        (define-record-type <test-runner>
          (internal-make-test-runner data)
          test-runner?
          (data test-runner:data test-runner:data!))

        (define-syntax test-runner-get-value
          (syntax-rules ()
            ((_ key r)
             (let ((data (test-runner:data r)))
               (if (assoc key data)
                 (if (null? (assoc key data))
                   (list)
                   (car (cdr (assoc key data))))
                 (list))))))

        (define-syntax test-runner-set!
          (syntax-rules ()
            ((_ r key value)
             (test-runner:data! r
                                (let ((found? #f))
                                  (append
                                    (map (lambda (pair)
                                           (if (equal? (car pair) key)
                                             (begin
                                               (set! found? #t)
                                               (list (car pair) value))
                                             pair))
                                         (test-runner:data r))
                                    (if found? (list) (list (list key value)))))))))

        (define (make-test-runner)
          (internal-make-test-runner
            (list (list 'result-alist '())
                  (list 'pass-count 0)
                  (list 'fail-count 0)
                  (list 'xpass-count 0)
                  (list 'xfail-count 0)
                  (list 'skip-count 0)
                  (list 'total-count 0)
                  (list 'count-list '())
                  (list 'run-list '())
                  (list 'skip-list '())
                  (list 'fail-list '())
                  (list 'skip-save '())
                  (list 'fail-save '())
                  (list 'group-stack '())
                  (list 'on-group-begin '())
                  (list 'on-test-begin '())
                  (list 'on-test-end '())
                  (list 'on-group-end '())
                  (list 'on-final '())
                  (list 'on-bad-count '())
                  (list 'on-bad-end-name '())
                  (list 'on-bad-error-type '())
                  (list 'aux-value 0)
                  (list 'log-file #f)
                  (list 'log-port #f))))

        (define (test-result-alist test-runner)
          (test-runner-get-value 'result-alist test-runner))

        (define-syntax test-result-alist!
          (syntax-rules ()
            ((_ test-runner value)
             (test-runner-set! test-runner 'result-alist value))))

        (define (test-runner-pass-count test-runner)
          (test-runner-get-value 'pass-count test-runner))

        (define-syntax test-runner-pass-count!
          (syntax-rules ()
            ((_ test-runner value)
             (test-runner-set! test-runner 'pass-count value))))

        (define (test-runner-fail-count test-runner)
          (test-runner-get-value 'fail-count test-runner))

        (define-syntax test-runner-fail-count!
          (syntax-rules ()
            ((_ test-runner value)
             (test-runner-set! test-runner 'fail-count value))))

        (define (test-runner-xpass-count test-runner)
          (test-runner-get-value 'xpass-count test-runner))

        (define-syntax test-runner-xpass-count!
          (syntax-rules ()
            ((_ test-runner value)
             (test-runner-set! test-runner 'xpass-count value))))

        (define (test-runner-xfail-count test-runner)
          (test-runner-get-value 'xfail-count test-runner))

        (define-syntax test-runner-xfail-count!
          (syntax-rules ()
            ((_ test-runner value)
             (test-runner-set! test-runner 'xfail-count value))))

        (define (test-runner-skip-count test-runner)
          (test-runner-get-value 'skip-count test-runner))

        (define-syntax test-runner-skip-count!
          (syntax-rules ()
            ((_ test-runner value)
             (test-runner-set! test-runner 'skip-count value))))

        (define (%test-runner-total-count test-runner)
          (test-runner-get-value 'total-count test-runner))

        (define-syntax %test-runner-total-count!
          (syntax-rules ()
            ((_ test-runner value)
             (test-runner-set! test-runner 'total-count value))))

        (define (%test-runner-count-list test-runner)
          (test-runner-get-value 'count-list test-runner))

        (define-syntax %test-runner-count-list!
          (syntax-rules ()
            ((_ test-runner value)
             (test-runner-set! test-runner 'count-list value))))

        (define (%test-runner-run-list test-runner)
          (test-runner-get-value 'run-list test-runner))

        (define-syntax %test-runner-run-list!
          (syntax-rules ()
            ((_ test-runner value)
             (test-runner-set! test-runner 'run-list value))))

        (define (%test-runner-skip-list test-runner)
          (test-runner-get-value 'skip-list test-runner))

        (define-syntax %test-runner-skip-list!
          (syntax-rules ()
            ((_ test-runner value)
             (test-runner-set! test-runner 'skip-list value))))

        (define (%test-runner-fail-list test-runner)
          (test-runner-get-value 'fail-list test-runner))

        (define-syntax %test-runner-fail-list!
          (syntax-rules ()
            ((_ test-runner value)
             (test-runner-set! test-runner 'fail-list value))))

        (define (%test-runner-skip-save test-runner)
          (test-runner-get-value 'skip-save test-runner))

        (define-syntax %test-runner-skip-save!
          (syntax-rules ()
            ((_ test-runner value)
             (test-runner-set! test-runner 'skip-save value))))

        (define (%test-runner-fail-save test-runner)
          (test-runner-get-value 'fail-save test-runner))

        (define-syntax %test-runner-fail-save!
          (syntax-rules ()
            ((_ test-runner value)
             (test-runner-set! test-runner 'fail-save value))))

        (define (test-runner-group-stack test-runner)
          (test-runner-get-value 'group-stack test-runner))

        (define-syntax test-runner-group-stack!
          (syntax-rules ()
            ((_ test-runner value)
             (test-runner-set! test-runner 'group-stack value))))

        (define (test-runner-on-group-begin test-runner)
          (test-runner-get-value 'on-group-begin test-runner))

        (define-syntax test-runner-on-group-begin!
          (syntax-rules ()
            ((_ test-runner value)
             (test-runner-set! test-runner 'on-group-begin value))))

        (define (test-runner-on-test-begin test-runner)
          (test-runner-get-value 'on-test-begin test-runner))

        (define-syntax test-runner-on-test-begin!
          (syntax-rules ()
            ((_ test-runner value)
             (test-runner-set! test-runner 'on-test-begin value))))

        (define (test-runner-on-test-end test-runner)
          (test-runner-get-value 'on-test-end test-runner))

        (define-syntax test-runner-on-test-end!
          (syntax-rules ()
            ((_ test-runner value)
             (test-runner-set! test-runner 'on-test-end value))))

        (define (test-runner-on-group-end test-runner)
          (test-runner-get-value 'on-group-end test-runner))

        (define-syntax test-runner-on-group-end!
          (syntax-rules ()
            ((_ test-runner value)
             (test-runner-set! test-runner 'on-group-end value))))

        (define (test-runner-on-final test-runner)
          (test-runner-get-value 'on-final test-runner))

        (define-syntax test-runner-on-final!
          (syntax-rules ()
            ((_ test-runner value)
             (test-runner-set! test-runner 'on-final value))))

        (define (test-runner-on-bad-count test-runner)
          (test-runner-get-value 'on-bad-count test-runner))

        (define-syntax test-runner-on-bad-count!
          (syntax-rules ()
            ((_ test-runner value)
             (test-runner-set! test-runner 'on-bad-count value))))

        (define (test-runner-on-bad-end-name test-runner)
          (test-runner-get-value 'on-bad-end-name test-runner))

        (define-syntax test-runner-on-bad-end-name!
          (syntax-rules ()
            ((_ test-runner value)
             (test-runner-set! test-runner 'on-bad-end-name value))))

        (define (%test-runner-on-bad-error-type test-runner)
          (test-runner-get-value 'on-bad-error-type test-runner))

        (define-syntax %test-runner-on-bad-error-type!
          (syntax-rules ()
            ((_ test-runner value)
             (test-runner-set! test-runner 'on-bad-error-type value))))

        (define (test-runner-aux-value test-runner)
          (test-runner-get-value 'aux-value test-runner))

        (define-syntax test-runner-aux-value!
          (syntax-rules ()
            ((_ test-runner value)
             (test-runner-set! test-runner 'aux-value value))))

        (define (%test-runner-log-file test-runner)
          (test-runner-get-value 'log-file test-runner))

        (define-syntax %test-runner-log-file!
          (syntax-rules ()
            ((_ test-runner value)
             (test-runner-set! test-runner 'log-file value))))

        (define (%test-runner-log-port test-runner)
          (test-runner-get-value 'log-port test-runner))

        (define-syntax %test-runner-log-port!
          (syntax-rules ()
            ((_ test-runner value)
             (test-runner-set! test-runner 'log-port value))))))
    (else
      (begin
        (define-record-type <test-runner>
          (make-test-runner)
          test-runner?

          (result-alist test-result-alist test-result-alist!)

          (pass-count test-runner-pass-count test-runner-pass-count!)
          (fail-count test-runner-fail-count test-runner-fail-count!)
          (xpass-count test-runner-xpass-count test-runner-xpass-count!)
          (xfail-count test-runner-xfail-count test-runner-xfail-count!)
          (skip-count test-runner-skip-count test-runner-skip-count!)
          (total-count %test-runner-total-count %test-runner-total-count!)

          ;; Stack (list) of (count-at-start . expected-count):
          (count-list %test-runner-count-list %test-runner-count-list!)

          ;; Normally #f, except when in a test-apply.
          (run-list %test-runner-run-list %test-runner-run-list!)

          (skip-list %test-runner-skip-list %test-runner-skip-list!)
          (fail-list %test-runner-fail-list %test-runner-fail-list!)

          (skip-save %test-runner-skip-save %test-runner-skip-save!)
          (fail-save %test-runner-fail-save %test-runner-fail-save!)

          (group-stack test-runner-group-stack test-runner-group-stack!)

          ;; Note: on-test-begin and on-test-end are unrelated to the test-begin and
          ;; test-end forms in the execution library.  They're called at the
          ;; beginning/end of each individual test, whereas the test-begin and test-end
          ;; forms demarcate test groups.

          (on-group-begin test-runner-on-group-begin test-runner-on-group-begin!)
          (on-test-begin test-runner-on-test-begin test-runner-on-test-begin!)
          (on-test-end test-runner-on-test-end test-runner-on-test-end!)
          (on-group-end test-runner-on-group-end test-runner-on-group-end!)
          (on-final test-runner-on-final test-runner-on-final!)
          (on-bad-count test-runner-on-bad-count test-runner-on-bad-count!)
          (on-bad-end-name test-runner-on-bad-end-name test-runner-on-bad-end-name!)

          (on-bad-error-type %test-runner-on-bad-error-type
                             %test-runner-on-bad-error-type!)

          (aux-value test-runner-aux-value test-runner-aux-value!)

          (log-file %test-runner-log-file %test-runner-log-file!)
          (log-port %test-runner-log-port %test-runner-log-port!)))))
  (include "64.scm"))
