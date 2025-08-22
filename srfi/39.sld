(define-library
  (srfi 39)
  (cond-expand
    (racket (import (scheme base)))
    (tr7 (import (scheme base)))
    (else (import (except (scheme base) make-parameter parameterize))))
  (cond-expand
    (stklos (export make-parameter parameterize dynamic-bind))
    (cyclone (export make-parameter parameterize dynamic-bind))
    (mit (export make-parameter parameterize dynamic-bind))
    (else (export make-parameter parameterize)))
  (cond-expand
    (mit (include "39.scm"))
    (foment (include "39.scm"))
    (racket (begin #t))
    (tr7 (begin #t))
    (else (include "39.scm"))))
