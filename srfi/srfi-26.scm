(define-library
  (srfi 26)
  (import (scheme base))
  (export cut cute)
  (cond-expand
    (foment (include "srfi/26.scm"))
    (else (include "26.scm"))))

