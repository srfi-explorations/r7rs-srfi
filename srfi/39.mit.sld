(define-library
  (srfi 39)
  (cond-expand
    (chibi (import (chibi)))
    (racket (import (scheme base)))
    (else (import (except (scheme base) make-parameter parameterize))))
  (cond-expand
    (stklos (export make-parameter parameterize dynamic-bind))
    (cyclone (export make-parameter parameterize dynamic-bind))
    (mit (export make-parameter parameterize dynamic-bind))
    (else (export make-parameter parameterize)))
  (cond-expand
    (mit (include "39.scm"))
    (foment (include "39.scm"))
    (chibi ;(include-shared "39/param")
           (cond-expand
             (threads (include "39/syntax.scm"))
             (else (include "39/syntax-no-threads.scm"))))
    (racket (begin #t))
    (else (include "39.scm"))))
