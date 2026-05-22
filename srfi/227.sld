;; R7RS small implementation of lambda-optional, assuming an optimized
;; case-lambda, by Daphne Preston-Kendal.

;; Edited to remove rename by Retropikzel

(define-library (srfi 227)
  (import (scheme base)
          (scheme case-lambda))
  (export opt-lambda
          opt*-lambda
          let-optionals
          let-optionals*)
  (include "227.scm")
  (begin
    (define-syntax let-optionals
      (syntax-rules ()
        ((_ expr opt-formals body1 ... body2)
         (apply (opt-lambda opt-formals body1 ... body2) expr))))
    (define-syntax let-optionals*
      (syntax-rules ()
        ((_ expr opt-formals body1 ... body2)
         (apply (opt*-lambda opt-formals body1 ... body2) expr))))))
