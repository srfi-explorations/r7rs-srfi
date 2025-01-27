(define-library
  (srfi 13)
  (import (except (scheme base)
                  string-copy
                  string-map
                  string-for-each
                  string-fill!
                  string-copy!
                  string->list)
          (only (scheme char)
                char-ci=?
                char-ci<?
                char-downcase
                char-upcase
                char-alphabetic?
                ;string-downcase
                string-upcase)
          (srfi 8)
          (srfi 14)
          (srfi 60))
  (export string-map
          string-map!
          string-fold
          string-unfold
          string-fold-right
          string-unfold-right
          string-tabulate
          string-for-each
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
          ;string-downcase
          string-upcase
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
          string-parse-start+end
          string-parse-final-start+end
          let-string-start+end
          check-substring-spec
          substring-spec-ok?
          make-kmp-restart-vector
          kmp-step
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
          string-copy
          string-copy!
          substring/shared
          string-reverse
          string-reverse!
          reverse-list->string
          string-concatenate
          string-concatenate/shared
          string-concatenate-reverse
          string-concatenate-reverse/shared
          string-append/shared
          xsubstring
          string-xcopy!
          string-null?
          string-join
          string-tokenize
          string-replace)
  (cond-expand
    (chicken (include "13.scm"))
    (foment (include "srfi/13.scm"))
    (guile (include "13.scm"))))
