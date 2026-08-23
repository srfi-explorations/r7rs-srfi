(define-library
  (srfi 112)
  (import (scheme base)
          (scheme char)
          (scheme read)
          (scheme write)
          (scheme file)
          (scheme process-context))
  (cond-expand
    (gauche (import (only (gauche base) gauche-version)))
    (loko (import (only (loko) loko-version)))
    (racket (import (only (racket base) version)))
    (else))
  (export implementation-name
          implementation-version
          cpu-architecture
          machine-name
          os-name
          os-version)
  (include "112.scm"))
