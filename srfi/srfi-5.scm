(define-library
  (srfi 5)
  (import (rename (scheme base)
                  (let standard-let)))
  (export let
          let-loop)
  (include "5.scm"))

