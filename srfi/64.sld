(define-library
  (srfi 64)
  (cond-expand
    (stklos
      (import (except (scheme base) make-parameter parameterize)
              (scheme char)
              (scheme eval)
              (scheme file)
              (scheme read)
              (scheme write)
              (scheme process-context)
              (srfi 1)
              (only (srfi 13) string-trim-both)
              (srfi 26)
              (srfi 28)
              (srfi 39)
              (only (stklos) %find-macro-clause)))
    (else
      (import (except (scheme base) make-parameter parameterize)
              (scheme char)
              (scheme eval)
              (scheme file)
              (scheme read)
              (scheme write)
              (scheme process-context)
              (srfi 1)
              (only (srfi 13) string-trim-both)
              (srfi 26)
              (srfi 28)
              (srfi 39))))
  (cond-expand
    (stklos
      (export
        ; Need to export these for stklos to work
        ; See: https://github.com/egallesio/STklos/issues/703
        internal-test-assert
        test-thunk
        test-runner-test-name!
        should-fail?
        should-run?
        should-skip?
        preliminary-result-kind!
        fail-on-exception
        final-result-kind!
        increment-executed-count
        increment-test-count
        internal-test-2
        ; Normal exports start
        test-assert
        test-eqv
        test-equal
        test-eq
        test-approximate
        test-error
        test-read-eval-string
        test-begin
        test-end
        test-group
        test-group-with-cleanup
        test-match-name
        test-match-nth
        test-match-any
        test-match-all
        test-skip
        test-expect-fail
        test-runner?
        test-runner-current
        test-runner-get
        test-runner-simple
        test-runner-null
        test-runner-create
        test-runner-factory
        test-apply
        test-with-runner
        test-result-kind
        test-passed?
        test-result-ref
        test-result-set!
        test-result-remove
        test-result-clear
        test-result-alist
        test-runner-on-test-begin
        test-runner-on-test-begin!
        test-runner-on-test-end
        test-runner-on-test-end!
        test-runner-on-group-begin
        test-runner-on-group-begin!
        test-runner-on-group-end
        test-runner-on-group-end!
        test-runner-on-bad-count
        test-runner-on-bad-count!
        test-runner-on-bad-end-name
        test-runner-on-bad-end-name!
        test-runner-on-final
        test-runner-on-final!
        test-on-test-end-simple
        test-on-group-begin-simple
        test-on-group-end-simple
        test-on-bad-count-simple
        test-on-bad-end-name-simple
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
        test-runner-reset
        test-on-final-simple))
    (cyclone
      (export
        ; Need to export these for Cyclone to work
        internal-test-assert
        test-thunk
        test-runner-test-name!
        should-fail?
        should-run?
        should-skip?
        preliminary-result-kind!
        fail-on-exception
        final-result-kind!
        increment-executed-count
        increment-test-count
        internal-test-2
        ; Normal exports start
        test-assert
        test-eqv
        test-equal
        test-eq
        test-approximate
        test-error
        test-read-eval-string
        test-begin
        test-end
        test-group
        test-group-with-cleanup
        test-match-name
        test-match-nth
        test-match-any
        test-match-all
        test-skip
        test-expect-fail
        test-runner?
        test-runner-current
        test-runner-get
        test-runner-simple
        test-runner-null
        test-runner-create
        test-runner-factory
        test-apply
        test-with-runner
        test-result-kind
        test-passed?
        test-result-ref
        test-result-set!
        test-result-remove
        test-result-clear
        test-result-alist
        test-runner-on-test-begin
        test-runner-on-test-begin!
        test-runner-on-test-end
        test-runner-on-test-end!
        test-runner-on-group-begin
        test-runner-on-group-begin!
        test-runner-on-group-end
        test-runner-on-group-end!
        test-runner-on-bad-count
        test-runner-on-bad-count!
        test-runner-on-bad-end-name
        test-runner-on-bad-end-name!
        test-runner-on-final
        test-runner-on-final!
        test-on-test-end-simple
        test-on-group-begin-simple
        test-on-group-end-simple
        test-on-bad-count-simple
        test-on-bad-end-name-simple
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
        test-runner-reset
        test-on-final-simple))
    (else
      (export
        test-assert
        test-eqv
        test-equal
        test-eq
        test-approximate
        test-error
        test-read-eval-string
        test-begin
        test-end
        test-group
        test-group-with-cleanup
        test-match-name
        test-match-nth
        test-match-any
        test-match-all
        test-skip
        test-expect-fail
        test-runner?
        test-runner-current
        test-runner-get
        test-runner-simple
        test-runner-null
        test-runner-create
        test-runner-factory
        test-apply
        test-with-runner
        test-result-kind
        test-passed?
        test-result-ref
        test-result-set!
        test-result-remove
        test-result-clear
        test-result-alist
        test-runner-on-test-begin
        test-runner-on-test-begin!
        test-runner-on-test-end
        test-runner-on-test-end!
        test-runner-on-group-begin
        test-runner-on-group-begin!
        test-runner-on-group-end
        test-runner-on-group-end!
        test-runner-on-bad-count
        test-runner-on-bad-count!
        test-runner-on-bad-end-name
        test-runner-on-bad-end-name!
        test-runner-on-final
        test-runner-on-final!
        test-on-test-end-simple
        test-on-group-begin-simple
        test-on-group-end-simple
        test-on-bad-count-simple
        test-on-bad-end-name-simple
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
        test-runner-reset
        test-on-final-simple)))
  (include "64.scm"))
