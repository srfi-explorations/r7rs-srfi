(define-library
  (srfi 60)
  (import (scheme base))
  (export logand
          bitwise-and
          logior
          bitwise-ior
          logxor
          bitwise-xor
          lognot
          bitwise-not
          bitwise-if
          bitwise-merge
          logtest
          any-bits-set?
          logcount
          bit-count
          integer-length
          log2-binary-factors
          first-set-bit
          logbit?
          bit-set?
          copy-bit
          bit-field
          copy-bit-field
          ash
          arithmetic-shift
          rotate-bit-field
          reverse-bit-field
          integer->list
          list->integer
          booleans->integer)
  (cond-expand
    (foment (include "srfi/60.scm"))
    (else (include "60.scm"))))

