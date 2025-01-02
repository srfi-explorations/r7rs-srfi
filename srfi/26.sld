(define-library
  (srfi 26)
  (cond-expand
    (stklos (import (scheme base)
                    (only (stklos) %find-macro-clause)))
    (else (import (scheme base))))
  (export cut cute)
  (cond-expand
    (foment (include "srfi/26.scm"))
    (else (include "26.scm"))))

