(define-library
  (srfi 48)
  (cond-expand
    (tr7
      (import (scheme base)
              (scheme char)
              (scheme write)
              (srfi 38)))
    (else
      (import (scheme base)
              (scheme char)
              (scheme complex)
              (scheme write)
              (srfi 38))))
  (export format)
  (include "48.scm"))
