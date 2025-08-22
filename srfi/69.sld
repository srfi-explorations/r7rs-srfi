(define-library
  (srfi 69)
  (cond-expand
    (chibi (import (chibi) (srfi 9)))
    (else (import (scheme base)
                  (scheme char)
                  (scheme complex)
                  (scheme cxr))))
  (export make-hash-table
          hash-table?
          alist->hash-table
          hash-table-equivalence-function
          hash-table-hash-function
          hash-table-ref
          hash-table-ref/default
          hash-table-set!
          hash-table-delete!
          hash-table-exists?
          hash-table-update!
          hash-table-update!/default
          hash-table-size
          hash-table-keys
          hash-table-values
          hash-table-walk
          hash-table-fold
          hash-table->alist
          hash-table-copy
          hash-table-merge!
          hash
          string-hash
          string-ci-hash
          hash-by-identity)
  (cond-expand
    (chibi
       (include-shared "69/hash")
       (include "69/type.scm" "69/interface.scm"))
    (else (include "69.scm"))))



