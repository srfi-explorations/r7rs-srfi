(define-library
  (srfi 38)
  (cond-expand
    (chibi (import (chibi) (srfi 69) (chibi ast)))
    (else (import (scheme base)
                  (scheme char)
                  (scheme cxr)
                  (scheme write))))
  (cond-expand
    (chibi (export write-with-shared-structure
                   write/ss
                   read-with-shared-structure
                   read/ss))
    (else (export write-with-shared-structure
                  read-with-shared-structure)))
  (cond-expand
    (chibi (include "38.chibi.scm"))
    (else (include "38.scm"))))
