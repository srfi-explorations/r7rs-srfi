(define-library
  (srfi 38)
  (import (scheme base)
          (scheme char)
          (scheme cxr)
          (scheme write))
  (export write-with-shared-structure
          read-with-shared-structure)
  (include "38.scm"))
