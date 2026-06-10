(define-library
  (srfi 42)
  (cond-expand
    (tr7 (import (scheme base)
                 (scheme read)
                 (scheme cxr)))
    (else (import (scheme base)
                  (scheme read)
                  (scheme cxr)
                  (scheme complex))))
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
          fold3-ec
          :
          :list
          :string
          :vector
          :integers
          :range
          :real-range
          :char-range
          :port
          :dispatched
          :do
          :let
          :parallel
          :while
          :until)
  (include "42.scm"))


