(define-library
  (srfi 26)
  (import (scheme base))
  (cond-expand
    (skint (export cut cute <> <...>))
    (else (export cut cute)))
  (include "26.scm"))

