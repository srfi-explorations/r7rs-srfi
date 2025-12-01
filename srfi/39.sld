(define-library
  (srfi 39)
  (import (except (scheme base) make-parameter parameterize))
  (cond-expand
    (mit (export make-parameter parameterize dynamic-bind))
    (else (export make-parameter parameterize)))
  (include "39.scm"))
