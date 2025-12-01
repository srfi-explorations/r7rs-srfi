(define-library
  (srfi 39)
  (import (except (scheme base) make-parameter parameterize))
  (export make-parameter parameterize)
  (include "39.scm"))
