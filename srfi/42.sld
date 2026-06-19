(define-library
  (srfi 42)
  (cond-expand
    (tr7 (import (scheme base)
                 (scheme read)
                 (scheme cxr)))
    (stklos (import (scheme base)
                  (scheme read)
                  (scheme cxr)
                  (scheme complex)
                  (only (stklos) keyword-colon-position)))
    (else (import (scheme base)
                  (scheme read)
                  (scheme cxr)
                  (scheme complex))))
  (cond-expand
    (stklos (when-load-and-compile (keyword-colon-position 'none)))
    (else #f))
  (cond-expand
    (stklos
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
              |:|
              |:list|
              |:string|
              |:vector|
              |:integers|
              |:range|
              |:real-range|
              |:char-range|
              |:port|
              |:dispatched|
              |:do|
              |:let|
              |:parallel|
              |:while|
              |:until|))
    (else
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
              :until)))
  (cond-expand
    ((or chicken stklos)
     (export ec-guarded-do-ec
             internal-generator-proc
             internal-until-1
             internal-while-2
             internal-while-1
             internal-parallel-1
             ec-simplify
             ec-guarded-do-ec
             internal-generator-proc
             internal-until-1
             internal-while-2
             internal-while-1
             internal-parallel-1
             ec-simplify
             do-ec:do))
    (else))
  (include "42.scm"))
