(define-library
  (srfi 37)
  (import (except (scheme base)
                  let-values
                  let*-values)
          (srfi 11))
  (export option
          option-names
          option-required-arg?
          option-optional-arg?
          option-processor
          args-fold)
  (include "37.scm"))
