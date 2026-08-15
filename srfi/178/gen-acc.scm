;;; SPDX-FileCopyrightText: 2020 Wolfgang Corcoran-Mathe <wcm@sigwinch.xyz>
;;;
;;; SPDX-License-Identifier: MIT

(define (%make-bitvector-generator bvec ref-proc)
  (let ((len (bitvector-length bvec))
        (i 0))
    (lambda ()
      (if (= i len)
          (eof-object)
          (let ((r (ref-proc bvec i)))
            (set! i (+ i 1))
            r)))))

(define (make-bitvector/int-generator bvec)
  (%make-bitvector-generator bvec bitvector-ref/int))

(define (make-bitvector/bool-generator bvec)
  (%make-bitvector-generator bvec bitvector-ref/bool))

(define (make-bitvector-accumulator)
  (let ((r '()))
    (lambda (x)
      (if (eof-object? x)
        (reverse-list->bitvector r)
        (set! r (cons x r))))))
