(define-library
  (srfi 28)
  (import (scheme base)
          (scheme write))
  (export format)
  (cond-expand
    (foment (include "srfi/28.scm"))
    (else (include "28.scm"))))

