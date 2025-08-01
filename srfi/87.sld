(define-library
  (srfi 87)
  (cond-expand
    ((or larceny loko mit-scheme racket)
     (import (scheme base)))
    (else
      (import (except (scheme base) case))))
  (export case)
  (cond-expand
    ((or larceny loko mit-scheme racket)
     (begin #t))
    (else
      (include "87.scm"))))
