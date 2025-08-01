(define-library
  (srfi 66)
  (import (scheme base))
  (export u8vector?
          make-u8vector
          u8vector
          u8vector->list
          list->u8vector
          u8vector-length
          u8vector-ref
          u8vector-set!
          u8vector=?
          u8vector-compare
          u8vector-copy!
          u8vector-copy)
  (include "66.scm"))
