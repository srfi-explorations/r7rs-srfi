(define-library
  (srfi 44)
  (import (except (scheme base)
                  define-record-type
                  vector?
                  make-vector
                  vector
                  list?
                  make-list
                  list
                  string?
                  make-string
                  string
                  map
                  vector-ref
                  string-ref
                  list-ref
                  string->list
                  string-copy
                  vector->list
                  vector-copy
                  vector-set!)
          (prefix (only (scheme base) map list list-ref) r7rs:)
          (scheme case-lambda)
          (except (srfi 1) map)
          (srfi 8)
          (srfi 256))
  (include "44.scm"))
