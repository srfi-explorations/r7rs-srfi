(define-library
  (srfi 43)
  (import (scheme base)
          (scheme cxr))
  (export make-vector
          vector
          vector-unfold
          vector-unfold-right
          vector-copy
          vector-reverse-copy
          vector-append
          vector-concatenate
          vector?
          vector-empty?
          vector=
          vector-ref
          vector-length
          vector-fold
          vector-fold-right
          vector-map
          vector-map!
          vector-for-each
          vector-count
          vector-index
          vector-index-right
          vector-skip
          vector-skip-right
          vector-binary-search
          vector-any
          vector-every
          vector-set!
          vector-swap!
          vector-fill!
          vector-reverse!
          vector-copy!
          vector-reverse-copy!
          vector->list
          reverse-vector->list
          list->vector
          reverse-list->vector)
  (include "43.scm"))



