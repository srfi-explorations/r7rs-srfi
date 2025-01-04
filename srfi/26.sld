(define-library
  (srfi 26)
  (cond-expand
    (stklos (import (scheme base)
                    (only (stklos) %find-macro-clause)))
    (else (import (scheme base))))
  (export cut cute)
  (include "26.scm"))

