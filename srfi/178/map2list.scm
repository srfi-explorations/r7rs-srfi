;;; SPDX-FileCopyrightText: 2020 Wolfgang Corcoran-Mathe <wcm@sigwinch.xyz>
;;;
;;; SPDX-License-Identifier: MIT

(define bitvector-map->list/int
  (case-lambda
    ((f bvec)                    ; fast path
     (bitvector-fold-right/int (lambda (xs b) (cons (f b) xs))
                               '()
                               bvec))
    ((f . bvecs)
     (apply bitvector-fold-right/int
            (lambda (xs . bs) (cons (apply f bs) xs))
            '()
            bvecs))))

(define bitvector-map->list/bool
  (case-lambda
    ((f bvec)                    ; fast path
     (bitvector-fold-right/bool (lambda (xs b) (cons (f b) xs))
                                '()
                                bvec))
    ((f . bvecs)
     (apply bitvector-fold-right/bool
            (lambda (xs . bs) (cons (apply f bs) xs))
            '()
            bvecs))))

