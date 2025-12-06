(define-library
  (srfi srfi-112)
  (import (scheme base)
          (scheme read)
          (scheme file))
  (export implementation-name
          implementation-version
          cpu-architecture
          machine-name
          os-name
          os-version)
  (include "112.scm"))
