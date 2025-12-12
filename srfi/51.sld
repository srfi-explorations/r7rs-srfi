(define-library
  (srfi 51)
  (import (scheme base)
          (only (srfi 1) every append-reverse))
  (export rest-values
          arg-and
          arg-ands
          err-and
          err-ands
          arg-or
          arg-ors
          err-or
          err-ors)
  (include "51.scm"))


