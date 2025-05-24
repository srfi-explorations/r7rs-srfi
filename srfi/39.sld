(define-library
  (srfi 39)
  (cond-expand
    (chibi (import (chibi)))
    (racket (import (scheme base)))
    (tr7 (import (scheme base)))
    (else (import (except (scheme base) make-parameter parameterize))))
  (cond-expand
    (stklos (export make-parameter parameterize dynamic-bind))
    (cyclone (export make-parameter parameterize dynamic-bind))
    (mit (export make-parameter parameterize dynamic-bind))
    (else (export make-parameter parameterize)))
  (cond-expand
    (racket (begin #t))
    (tr7 (begin #t))
    (else (include "39.scm"))))
