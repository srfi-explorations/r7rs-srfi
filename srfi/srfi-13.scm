(define-library
  (srfi 13)
  (import (scheme base)
          (scheme char)
          (srfi 8)
          (srfi 14)
          (srfi 33))
  (export
    ;; Already in R7RS
    ;string-map
    string-map!
    string-fold
    string-unfold
    string-fold-right
    string-unfold-right
    string-tabulate
    ;; Already in R7RS
    ;string-for-each
    string-for-each-index
    string-every
    string-any
    string-hash
    string-hash-ci
    string-compare
    string-compare-ci
    string=
    string<
    string>
    string<=
    string>=
    string<>
    string-ci=
    string-ci<
    string-ci>
    string-ci<=
    string-ci>=
    string-ci<>
    ;; Already in R7RS
    ;string-downcase
    ;; Already in R7RS
    ;string-upcase
    string-titlecase
    string-downcase!
    string-upcase!
    string-titlecase!
    string-take
    string-take-right
    string-drop
    string-drop-right
    string-pad
    string-pad-right
    string-trim
    string-trim-right
    string-trim-both
    string-filter
    string-delete
    string-index
    string-index-right
    string-skip
    string-skip-right
    string-count
    string-prefix-length
    string-prefix-length-ci
    string-suffix-length
    string-suffix-length-ci
    string-prefix?
    string-prefix-ci?
    string-suffix?
    string-suffix-ci?
    string-contains
    string-contains-ci
    ;; Already in R7RS
    ;string-copy!
    substring/shared
    ;; Already in R7RS
    ;string-reverse
    string-reverse!
    reverse-list->string
    string-concatenate
    string-concatenate/shared
    string-concatenate-reverse
    string-append/shared
    xsubstring
    string-xcopy!
    string-null?
    string-join
    string-tokenize
    string-replace)
  (include "13.scm"))
