(define-library
  (srfi 26)
  (import (scheme base))
  (export cut cute)
  (cond-expand
    (chicken (include "26.scm"))
    (foment (include "srfi/26.scm"))
    (guile (include "26.scm"))))
