(define-library
  (srfi 5)
  (import (rename (scheme base)
                  (let standard-let)))
  (export (rename srfi-5-let let)
          let-loop)
  (include "5.scm"))

