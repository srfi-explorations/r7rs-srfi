;;; SPDX-License-Identifier: MIT

(define-library
  (srfi 64)
  (cond-expand
    (loko
     (import (scheme base)
             (scheme case-lambda)
             (scheme complex)
             (scheme file)
             (scheme process-context)
             (scheme read)
             (scheme write)
             (srfi 1))
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
                  (<= ival (+ iexp margin))))))))
    ((library (scheme complex))
     (import (scheme base)
             (scheme case-lambda)
             (scheme complex)
             (scheme eval)
             (scheme file)
             (scheme process-context)
             (scheme read)
             (scheme write)
             (srfi 1))
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
                  (<= ival (+ iexp margin))))))))
    (else
      (import (scheme base)
              (scheme case-lambda)
              (scheme eval)
              (scheme file)
              (scheme process-context)
              (scheme read)
              (scheme write)
              (srfi 1))
      (begin
        (define (approx= margin)
          (lambda (value expected)
            (error "approx= not supported, missing (scheme complex)"))))))
  (cond-expand
    (chicken
      ; To reduce warnings
      (export test-error/source-info
              test-approximate/source-info
              test-compare/source-info
              test-compare
              test-assert/source-info
              false-if-error
              test-assert/source-info
              false-if-error
              source-info))
    (stklos
     ; Need to export these to work
     (export %test-assert
             %test-compare
             %test-error
             %test-group
             test-assert/source-info
             test-compare/source-info
             test-error/source-info))
    (else))
  ;; Source info
   (cond-expand
     (guile (import (only (guile) assq-ref syntax-source)))
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
          test-apply
          test-with-runner
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
  (include "64/source-info.scm")
  (include "64/simple-runner.scm")
  (include "64.scm"))
