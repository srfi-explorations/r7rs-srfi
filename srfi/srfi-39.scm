(define-library
  (srfi 39)
  (cond-expand
    (foment (import (scheme base)))
    (guile (import (except (scheme base) make-parameter parameterize))))
  (export make-parameter parameterize)
  (cond-expand
    (foment (begin #t)) ;(include "srfi/39.scm"))
    (guile (include "39.scm"))))
