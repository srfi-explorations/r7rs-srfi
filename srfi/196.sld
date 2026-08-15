(define-library (srfi 196)
  (import (scheme base)
          (scheme case-lambda)
          (only (srfi 1) reduce unfold xcons every concatenate))

  (cond-expand
    ((library (srfi 133))
     (import (only (srfi 133) vector-unfold)))
    ((library (srfi 43))
     (import (only (srfi 43) vector-unfold)))
    (else
     (begin
      ;; The "seedless" case is all we need.
      (define (vector-unfold f len)
        (let ((res (make-vector len)))
          (let lp ((i 0))
            (cond ((= i len) res)
                  (else (vector-set! res i (f i))
                        (lp (+ i 1))))))))))

  (cond-expand
    ((library (srfi 145))
     (import (srfi 145)))
    (else
      (begin
        (define (assume . rest) #t))))

  (export range numeric-range vector-range string-range range-append
          iota-range range? range=? range-length range-ref range-first
          range-last subrange range-segment range-split-at range-take
          range-take-right range-drop range-drop-right range-count
          range-map->list range-for-each range-fold range-fold-right
          range-any range-every range-filter->list range-remove->list
          range-reverse range-map range-map->vector range-filter
          range-remove range-filter-map range-filter-map->list
          range-index range-index-right range-take-while
          range-drop-while range-take-while-right
          range-drop-while-right vector->range range->string
          range->list range->generator range->vector)

  (include "196.scm"))
