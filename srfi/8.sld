(define-library
  (srfi 8)
  (cond-expand
    (stklos (import (scheme base)
                    (only (stklos) %find-macro-clause)))
    (else (import (scheme base))))
  (export receive)
  (cond-expand
    (foment (include "srfi/8.scm"))
    (else (include "8.scm"))))

