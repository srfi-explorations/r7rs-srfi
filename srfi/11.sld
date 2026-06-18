(define-library
  (srfi 11)
  (cond-expand
    (stklos (import (scheme base)))
    (else (import (except (scheme base)
                          let-values
                          let*-values))))
  (export let-values
          let*-values)
  (cond-expand
    (stklos)
    (else (include "11.scm"))))
