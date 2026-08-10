;;; SPDX-FileCopyrightText: 2020 Wolfgang Corcoran-Mathe <wcm@sigwinch.xyz>
;;;
;;; SPDX-License-Identifier: MIT

(define (bitvector-prefix-length bvec1 bvec2)
  (let ((end (min (bitvector-length bvec1) (bitvector-length bvec2))))
    (if (eqv? bvec1 bvec2)
        end
        (let lp ((i 0))
          (if (or (>= i end)
                  (not (= (bitvector-ref/int bvec1 i)
                          (bitvector-ref/int bvec2 i))))
              i
              (lp (+ i 1)))))))

(define (bitvector-suffix-length bvec1 bvec2)
  (let ((end1 (bitvector-length bvec1))
        (end2 (bitvector-length bvec2)))
    (let* ((delta (min end1 end2))
           (start (- end1 delta)))
      (if (eqv? bvec1 bvec2)
          delta
          (let lp ((i (- end1 1)) (j (- end2 1)))
            (if (or (< i start)
                    (not (= (bitvector-ref/int bvec1 i)
                            (bitvector-ref/int bvec2 j))))
                (- (- end1 i) 1)
                (lp (- i 1) (- j 1))))))))

(define (bitvector-prefix? bvec1 bvec2)
  (let ((len1 (bitvector-length bvec1)))
    (and (<= len1 (bitvector-length bvec2))
         (= (bitvector-prefix-length bvec1 bvec2) len1))))

(define (bitvector-suffix? bvec1 bvec2)
  (let ((len1 (bitvector-length bvec1)))
    (and (<= len1 (bitvector-length bvec2))
         (= (bitvector-suffix-length bvec1 bvec2) len1))))

(define (bitvector-pad bit bvec len)
  (let ((old-len (bitvector-length bvec)))
    (if (<= len old-len)
        bvec
        (let ((result (make-bitvector len bit)))
          (bitvector-copy! result (- len old-len) bvec)
          result))))

(define (bitvector-pad-right bit bvec len)
  (if (<= len (bitvector-length bvec))
      bvec
      (let ((result (make-bitvector len bit)))
        (bitvector-copy! result 0 bvec)
        result)))

(define (%bitvector-skip bvec bit)
  (let ((len (bitvector-length bvec))
        (int (bit->integer bit)))
    (let lp ((i 0))
      (and (< i len)
           (if (= int (bitvector-ref/int bvec i))
               (lp (+ i 1))
               i)))))

(define (%bitvector-skip-right bvec bit)
  (let ((len (bitvector-length bvec))
        (int (bit->integer bit)))
    (let lp ((i (- len 1)))
      (and (>= i 0)
           (if (= int (bitvector-ref/int bvec i))
               (lp (- i 1))
               i)))))

(define (bitvector-trim bit bvec)
  (cond ((%bitvector-skip bvec bit) =>
         (lambda (skip)
           (bitvector-copy bvec skip (bitvector-length bvec))))
        (else (bitvector))))

(define (bitvector-trim-right bit bvec)
  (cond ((%bitvector-skip-right bvec bit) =>
         (lambda (skip)
           (bitvector-copy bvec 0 (+ skip 1))))
        (else (bitvector))))

(define (bitvector-trim-both bit bvec)
  (cond ((%bitvector-skip bvec bit) =>
         (lambda (skip)
           (bitvector-copy bvec skip (+ 1 (%bitvector-skip-right bvec bit)))))
        (else (bitvector))))
