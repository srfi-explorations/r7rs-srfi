(define-library
  (srfi 8)
  (import (scheme base))
  (export receive)
  (cond-expand
    (chicken (include "8.scm"))
    (guile (include "8.scm"))))
