; From https://github.com/scheme-requests-for-implementation/srfi-27/tree/master/reference

(define-library
  (srfi 27)
  (import (scheme base)
          (scheme time)
          (scheme complex))
  (export random-integer
          random-real
          default-random-source
          make-random-source
          random-source?
          random-source-state-ref
          random-source-state-set!
          random-source-randomize!
          random-source-pseudo-randomize!
          random-source-make-integers
          random-source-make-reals)
  (include "27.scm"))
