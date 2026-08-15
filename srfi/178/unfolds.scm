;;; SPDX-FileCopyrightText: 2020 Wolfgang Corcoran-Mathe <wcm@sigwinch.xyz>
;;;
;;; SPDX-License-Identifier: MIT

;;;; unfold

;;; These procedures work by building temporary lists, then converting
;;; them to vectors. This uses more space than pre-allocating a bitvector
;;; and filling it, but it's referentially transparent: there's no way
;;; to capture a partially-filled bitvector through continuation tricks.

;; Unfold a list. f is passed the current index and list of seeds
;; on each step, and must return a bit and new seeds on each step.
(define (%unfold/index f len seeds)
  (letrec
   ((build
     (lambda (i seeds)
       (if (= i len)
           '()
           (let-values (((b . seeds*) (apply f i seeds)))
             (cons b (build (+ i 1) seeds*)))))))

    (build 0 seeds)))

(define (bitvector-unfold f len . seeds)
  (list->bitvector (%unfold/index f len seeds)))

;;;; unfold-right

;; Unfold a list from the right. f is passed the current index and
;; list of seeds on each step, and must return a bit and new seeds
;; on each step.
(define (%unfold-right/index f len seeds)
  (letrec
   ((build
     (lambda (i seeds res)
       (if (< i 0)
           res
           (let-values (((b . seeds*) (apply f i seeds)))
             (build (- i 1) seeds* (cons b res)))))))

    (build (- len 1) seeds '())))

(define (bitvector-unfold-right f len . seeds)
  (list->bitvector (%unfold-right/index f len seeds)))
