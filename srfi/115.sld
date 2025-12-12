;;> A regular expression engine implementing SRFI 115 using a
;;> non-backtracking Thompson NFA algorithm.
;; Copyright (c) 2013-2016 Alex Shinn.  All rights reserved.
;; Copyright (c) 2025 Retropikzel All rights reserved.
;; BSD-style license: http://synthcode.com/license.txt

(define-library
  (srfi 115)
  (import (scheme base)
          (scheme char)
          (only (srfi 1) every)
          (srfi 14)
          (srfi 60)
          (srfi 69))
  (export regexp
          regexp?
          valid-sre?
          rx
          regexp->sre
          char-set->sre
          regexp-matches
          regexp-matches?
          regexp-search
          regexp-replace
          regexp-replace-all
          regexp-fold
          regexp-extract
          regexp-split
          regexp-partition
          regexp-match?
          regexp-match-count
          regexp-match-submatch
          regexp-match-submatch/list
          regexp-match-submatch-start
          regexp-match-submatch-end
          regexp-match->list
          regexp-match->sexp
          ;; low-level
          regexp-advance!
          regexp-state?
          make-regexp-state
          regexp-state-accept
          regexp-state-searchers
          regexp-state-matches
          regexp-match-ref)
  (include "115.scm"))
