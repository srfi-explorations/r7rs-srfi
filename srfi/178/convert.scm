;;; SPDX-FileCopyrightText: 2020 Wolfgang Corcoran-Mathe <wcm@sigwinch.xyz>
;;;
;;; SPDX-License-Identifier: MIT

;;;; Bit conversions

(define (bit->integer bit) (I bit))

(define (bit->boolean bit) (B bit))

(define (bitvector->string bvec)
  (let loop ((i (- (bitvector-length bvec) 1))
             (r '()))
    (if (< i 0)
      (list->string (cons #\# (cons #\* r)))
      (loop (- i 1)
            (cons (if (bitvector-ref/bool bvec i) #\1 #\0) r)))))

(define (string->bitvector str)
  (call/cc
   (lambda (return)
     (and
       (> (string-length str) 1)
       (char=? (string-ref str 0) #\#)
       (char=? (string-ref str 1) #\*)
       (bitvector-unfold
        (lambda (ri si)
          (case (string-ref str si)
            ((#\0) (values 0 (+ si 1)))
            ((#\1) (values 1 (+ si 1)))
            (else (return #f))))
        (- (string-length str) 2)
        2)))))

;;;; Bitvector/integer conversions

(define (bitvector->integer bvec)
  (bitvector-fold-right/int (lambda (r b) (+ (* r 2) b)) 0 bvec))

(define integer->bitvector
  (case-lambda
    ((int) (integer->bitvector int (integer-length int)))
    ((int len)
     (bitvector-unfold
      (lambda (_ int)
        (values (bit-set? 0 int) (arithmetic-shift int -1)))
      len
      int))))

;;; Additional vector conversions

(define reverse-vector->bitvector
  (case-lambda
    ((vec) (reverse-vector->bitvector vec 0 (vector-length vec)))
    ((vec start) (reverse-vector->bitvector vec start (vector-length vec)))
    ((vec start end)
     (bitvector-unfold
      (lambda (i)
        (vector-ref vec (- end 1 i)))
      (- end start)))))

(define reverse-bitvector->vector/int
  (case-lambda
    ((bvec)
     (reverse-bitvector->vector/int bvec 0 (bitvector-length bvec)))
    ((bvec start)
     (reverse-bitvector->vector/int bvec start (bitvector-length bvec)))
    ((bvec start end)
     (let ((u8vec (U bvec)))
       (vector-unfold (lambda (i)
                        (u8vector-ref u8vec (- end 1 i)))
                      (- end start))))))

(define reverse-bitvector->vector/bool
  (case-lambda
    ((bvec)
     (reverse-bitvector->vector/bool bvec 0 (bitvector-length bvec)))
    ((bvec start)
     (reverse-bitvector->vector/bool bvec start (bitvector-length bvec)))
    ((bvec start end)
     (let ((u8vec (U bvec)))
       (vector-unfold (lambda (i)
                        (B (u8vector-ref u8vec (- end 1 i))))
                      (- end start))))))
