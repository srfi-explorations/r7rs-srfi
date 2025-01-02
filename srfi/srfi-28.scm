(define-library
  (srfi 28)
  (import (scheme base)
          (scheme write))
  (export format)
  (cond-expand
    (chicken (include "28.scm"))
    (foment (include "srfi/28.scm"))
    (guile (include "28.scm"))))

