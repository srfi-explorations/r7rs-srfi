(define-library
  (srfi 11)
  (import (except (scheme base)
                  let-values
                  let*-values))
  (export let-values
          let*-values)
  (include "11.scm"))
