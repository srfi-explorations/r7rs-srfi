(define-library
  (srfi 25)
  (import (scheme base)
          (scheme write))
  (export array?
          make-array
          shape
          array
          array-rank
          array-start
          array-end
          array-ref
          array-set!
          share-array)
  (include "25.scm"))


