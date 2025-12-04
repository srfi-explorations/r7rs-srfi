(define-library
  (srfi srfi-95)
  (import (scheme base)
          (srfi 63))
  (export sorted?
          merge
          merge!
          sort
          sort!)
  (include "95.scm"))
