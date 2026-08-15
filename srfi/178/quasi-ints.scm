;;; SPDX-FileCopyrightText: 2020 Wolfgang Corcoran-Mathe <wcm@sigwinch.xyz>
;;;
;;; SPDX-License-Identifier: MIT

(define (bitvector-logical-shift bvec count bit)
  (cond ((positive? count)
         (%bitvector-left-shift bvec count (I bit)))
        ((negative? count)
         (%bitvector-right-shift bvec (- count) (I bit)))
        (else bvec)))

(define (%bitvector-left-shift bvec count bit)
  (let ((len (bitvector-length bvec)))
    (bitvector-unfold
     (lambda (i)
       (let ((i* (+ i count)))
         (if (< i* len) (bitvector-ref/int bvec i*) bit)))
     len)))

(define (%bitvector-right-shift bvec count bit)
  (bitvector-unfold
   (lambda (i)
     (if (< i count)
         bit
         (bitvector-ref/int bvec (- i count))))
   (bitvector-length bvec)))

(define (bitvector-count bit bvec)
  (let ((int (I bit)))
    (bitvector-fold/int (lambda (n b) (if (= b int) (+ n 1) n))
                        0
                        bvec)))

(define (bitvector-count-run bit bvec index)
  (let ((int (I bit))
        (len (bitvector-length bvec)))
    (let lp ((i index) (c 0))
      (if (or (>= i len) (not (= int (bitvector-ref/int bvec i))))
          c
          (lp (+ i 1) (+ c 1))))))

(define (bitvector-if if-bvec then-bvec else-bvec)
  (bitvector-map/bool (lambda (bit then-bit else-bit)
                        (if bit then-bit else-bit))
                      if-bvec
                      then-bvec
                      else-bvec))

(define (bitvector-first-bit bit bvec)
  (let ((int (I bit)) (len (bitvector-length bvec)))
    (let lp ((i 0))
      (cond ((>= i len) -1)
            ((= int (bitvector-ref/int bvec i)) i)
            (else (lp (+ i 1)))))))

