(define-library
  (srfi 48)
  (import (scheme base)
          (scheme char)
          (scheme complex)
          (scheme write)
          (srfi 38))
  (export format)
  (cond-expand
    (foment (include "srfi/48.scm"))
    (else (include "48.scm"))))
