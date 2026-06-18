(define-library
  (srfi 95)
  (import (except (scheme base) equal?)
          (srfi 63))
  (export sorted?
          merge
          merge!
          sort
          sort!)
  (include "95.scm"))
