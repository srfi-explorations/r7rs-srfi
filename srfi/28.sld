(define-library
  (srfi 28)
  (cond-expand
    (stklos (import (scheme base)
                    (scheme write)
                    (only (stklos) %find-macro-clause)))
    (else (import (scheme base)
                  (scheme write))))
  (export format)
  (cond-expand
    (foment (include "srfi/28.scm"))
    (else (include "28.scm"))))

