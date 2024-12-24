(define-library
  (srfi 39)
  (cond-expand
    (foment (import (except (scheme base) make-parameter parameterize)))
    (guile (import (except (scheme base) make-parameter parameterize))))
  (export make-parameter parameterize)
  (cond-expand
    (foment (include "srfi/39.scm"))
    (guile (include "39.scm"))))
