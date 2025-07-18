(define-library
  (srfi 42)
  (import (scheme base)
          (scheme read)
          (scheme complex)
          (scheme cxr))
  (export do-ec
          list-ec
          append-ec
          string-ec
          string-append-ec
          vector-ec
          vector-of-length-ec
          sum-ec
          product-ec
          min-ec
          max-ec
          any?-ec
          every?-ec
          first-ec
          last-ec
          fold-ec
          fold3-ec)
  (include "42.scm"))


