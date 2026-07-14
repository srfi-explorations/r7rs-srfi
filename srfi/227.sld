;; R7RS small implementation of lambda-optional, assuming an optimized
;; case-lambda, by Daphne Preston-Kendal.

;; Edited by Retropikzel

(define-library (srfi 227)
  (import (scheme base)
          (scheme case-lambda))
  (export opt-lambda
          opt*-lambda
          let-optionals
          let-optionals*)
  (cond-expand
    ((or chicken stklos)
     (export define-optional*
             %lambda-optional*-case-lambda
             %lambda-optional*-parse
             define-optional
             %lambda-optional-case-lambda
             %lambda-optional-generate-temporaries
             %lambda-optional-parse
             define-optional*
             %lambda-optional*-case-lambda))
    (else))
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
