(define-library
  (srfi 39)
  (cond-expand
    (chibi (import (chibi)))
    (mit-scheme (import (scheme base)))
    (racket (import (scheme base)))
    (else (import (except (scheme base) make-parameter parameterize))))
  (export make-parameter parameterize)
  (cond-expand
    (chibi (include-shared "39/param")
           (cond-expand
             (threads (include "39/syntax.scm"))
             (else (include "39/syntax-no-threads.scm"))))
    (racket (begin #t))
    (else (include "39.scm"))))
