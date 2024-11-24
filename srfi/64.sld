(define-library
  (srfi 64)
  (import (scheme base)
          (scheme char)
          (scheme eval)
          (scheme file)
          (scheme read)
          (scheme write)
          (scheme process-context)
          (srfi 1)
          (srfi 8)
          (srfi 26)
          (srfi 28))
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
    test-on-final-simple)
  (include "64.scm"))
