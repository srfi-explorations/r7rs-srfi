(define-library
  (srfi 8)
  (import (scheme base))
  (export receive)
  (cond-expand
    (foment (include "srfi/8.scm"))
    (else (include "srfi/8.scm"))))
