(define-library
  (srfi 38)
  (import (scheme base)
          (scheme char)
          (scheme cxr)
          (scheme write))
  (export write-with-shared-structure
          read-with-shared-structure)
  (cond-expand
    (foment (include "srfi/38.scm"))
    (else (include "38.scm"))))
