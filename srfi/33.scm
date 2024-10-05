;; The following code is from SLIB https://people.csail.mit.edu/jaffer/SLIB
;; The names of procedures might ne changed
;; Comments starting with ";;#" Are not from original code

;; From slib begins


;; Copyright included

;;;; "logical.scm", bit access and operations for integers for Scheme
;;; Copyright (C) 1991, 1993, 2001, 2003, 2005 Aubrey Jaffer
;
;Permission to copy this software, to modify it, to redistribute it,
;to distribute modified versions, and to use it for any purpose is
;granted, subject to the following restrictions and understandings.
;
;1.  Any copy made of this software must include this copyright notice
;in full.
;
;2.  I have made no warranty or representation that the operation of
;this software will be error-free, and I am under no obligation to
;provide any services, by way of maintenance, update, or otherwise.
;
;3.  In conjunction with products arising from the use of this
;material, there shall be no use of my name in any advertising,
;promotional, or sales literature without prior written consent in
;each case.

;;# bitwise-not
;;# Original name lognot
(define (bitwise-not n) (- -1 n))


;;# bitwise-and
(define (logical:ash-4 x)
  (if (negative? x)
    (+ -1 (quotient (+ 1 x) 16))
    (quotient x 16)))

(define logical:boole-and
  '#(#(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
     #(0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1)
     #(0 0 2 2 0 0 2 2 0 0 2 2 0 0 2 2)
     #(0 1 2 3 0 1 2 3 0 1 2 3 0 1 2 3)
     #(0 0 0 0 4 4 4 4 0 0 0 0 4 4 4 4)
     #(0 1 0 1 4 5 4 5 0 1 0 1 4 5 4 5)
     #(0 0 2 2 4 4 6 6 0 0 2 2 4 4 6 6)
     #(0 1 2 3 4 5 6 7 0 1 2 3 4 5 6 7)
     #(0 0 0 0 0 0 0 0 8 8 8 8 8 8 8 8)
     #(0 1 0 1 0 1 0 1 8 9 8 9 8 9 8 9)
     #(0 0 2 2 0 0 2 2 8 8 10 10 8 8 10 10)
     #(0 1 2 3 0 1 2 3 8 9 10 11 8 9 10 11)
     #(0 0 0 0 4 4 4 4 8 8 8 8 12 12 12 12)
     #(0 1 0 1 4 5 4 5 8 9 8 9 12 13 12 13)
     #(0 0 2 2 4 4 6 6 8 8 10 10 12 12 14 14)
     #(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15)))

(define (logical:reduce op4 ident)
  (lambda args
    (do ((res ident (op4 res (car rgs) 1 0))
         (rgs args (cdr rgs)))
      ((null? rgs) res))))

;;# Original name logand
(define bitwise-and
  (letrec
    ((lgand
       (lambda (n2 n1 scl acc)
         (cond ((= n1 n2) (+ acc (* scl n1)))
               ((zero? n2) acc)
               ((zero? n1) acc)
               (else (lgand (logical:ash-4 n2)
                            (logical:ash-4 n1)
                            (* 16 scl)
                            (+ (* (vector-ref (vector-ref logical:boole-and
                                                          (modulo n1 16))
                                              (modulo n2 16))
                                  scl)
                               acc)))))))
    (logical:reduce lgand -1)))

;;# bitwise-ior
;;# Original name logior

(define bitwise-ior
  (letrec
    ((lgior
       (lambda (n2 n1 scl acc)
         (cond ((= n1 n2) (+ acc (* scl n1)))
               ((zero? n2) (+ acc (* scl n1)))
               ((zero? n1) (+ acc (* scl n2)))
               (else (lgior (logical:ash-4 n2)
                            (logical:ash-4 n1)
                            (* 16 scl)
                            (+ (* (- 15 (vector-ref
                                          (vector-ref logical:boole-and
                                                      (- 15 (modulo n1 16)))
                                          (- 15 (modulo n2 16))))
                                  scl)
                               acc)))))))
    (logical:reduce lgior 0)))

;;# bitwise-xor

(define logical:boole-xor
  '#(#(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15)
     #(1 0 3 2 5 4 7 6 9 8 11 10 13 12 15 14)
     #(2 3 0 1 6 7 4 5 10 11 8 9 14 15 12 13)
     #(3 2 1 0 7 6 5 4 11 10 9 8 15 14 13 12)
     #(4 5 6 7 0 1 2 3 12 13 14 15 8 9 10 11)
     #(5 4 7 6 1 0 3 2 13 12 15 14 9 8 11 10)
     #(6 7 4 5 2 3 0 1 14 15 12 13 10 11 8 9)
     #(7 6 5 4 3 2 1 0 15 14 13 12 11 10 9 8)
     #(8 9 10 11 12 13 14 15 0 1 2 3 4 5 6 7)
     #(9 8 11 10 13 12 15 14 1 0 3 2 5 4 7 6)
     #(10 11 8 9 14 15 12 13 2 3 0 1 6 7 4 5)
     #(11 10 9 8 15 14 13 12 3 2 1 0 7 6 5 4)
     #(12 13 14 15 8 9 10 11 4 5 6 7 0 1 2 3)
     #(13 12 15 14 9 8 11 10 5 4 7 6 1 0 3 2)
     #(14 15 12 13 10 11 8 9 6 7 4 5 2 3 0 1)
     #(15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0)))

;;# Original name logxor
(define bitwise-xor
  (letrec
    ((lgxor
       (lambda (n2 n1 scl acc)
         (cond ((= n1 n2) acc)
               ((zero? n2) (+ acc (* scl n1)))
               ((zero? n1) (+ acc (* scl n2)))
               (else (lgxor (logical:ash-4 n2)
                            (logical:ash-4 n1)
                            (* 16 scl)
                            (+ (* (vector-ref (vector-ref logical:boole-xor
                                                          (modulo n1 16))
                                              (modulo n2 16))
                                  scl)
                               acc)))))))
    (logical:reduce lgxor 0)))

;;# arithmetic-shift
(define (arithmetic-shift n count)
  (if (negative? count)
    (let ((k (expt 2 (- count))))
      (if (negative? n)
        (+ -1 (quotient (+ 1 n) k))
        (quotient n k)))
    (* (expt 2 count) n)))

;;# bit-count
;;# Original name logcount
(define (bit-count n)
  (cond ((negative? n) (bitwise-bit-count (lognot n)))
        (else (bitwise-bit-count n))))

;;# bitwise-bit-count
(define (lognot n) (- -1 n))
(define bitwise-bit-count
  (letrec ((logcnt (lambda (n tot)
                     (if (zero? n)
                       tot
                       (logcnt (quotient n 16)
                               (+ (vector-ref
                                    '#(0 1 1 2 1 2 2 3 1 2 2 3 2 3 3 4)
                                    (modulo n 16))
                                  tot))))))
    (lambda (n)
      (cond ((negative? n) (lognot (logcnt (lognot n) 0)))
            ((positive? n) (logcnt n 0))
            (else 0)))))

;;# integer-length

(define integer-length
  (letrec ((intlen (lambda (n tot)
                     (case n
                       ((0 -1) (+ 0 tot))
                       ((1 -2) (+ 1 tot))
                       ((2 3 -3 -4) (+ 2 tot))
                       ((4 5 6 7 -5 -6 -7 -8) (+ 3 tot))
                       (else (intlen (logical:ash-4 n) (+ 4 tot)))))))
    (lambda (n) (intlen n 0))))

;; From slib ends


;; The following code is from reference implementation
;; From reference implementation begins


;;; The seven non-trivial boolean functions in terms
;;; of not, and, or & xor.

(define (bitwise-nand  i j)  (bitwise-not (bitwise-and i j)))
(define (bitwise-nor   i j)  (bitwise-not (bitwise-ior i j)))
(define (bitwise-andc1 i j)  (bitwise-and (bitwise-not i) j))
(define (bitwise-andc2 i j)  (bitwise-and i (bitwise-not j)))
(define (bitwise-orc1  i j)  (bitwise-ior (bitwise-not i) j))
(define (bitwise-orc2  i j)  (bitwise-ior i (bitwise-not j)))

(define (bitwise-eqv . args)
  (let lp ((args args) (ans -1))
    (if (pair? args)
      (lp (cdr args) (bitwise-not (bitwise-xor ans (car args))))
      ans)))

;;; Helper function -- make a mask of SIZE 1-bits, e.g. (%MASK 3) = #b111.
;;; Suppose your Scheme's fixnums are N bits wide (counting the sign bit,
;;; not counting any tag bits). This version, due to Marc Feeley, will
;;; handle SIZE in the range [0,N-1] without overflowing to bignums.
;;; (For SIZE >= N, the correct bignum value is also produced.)

(define (%mask size) (bitwise-not (arithmetic-shift -1 size)))

;;; This alternate, mathematically-equivalent expression
;;;     (- (arithmetic-shift 1 size) 1)
;;; is not as good -- it only handles SIZE in the range [0,N-2] without
;;; overflowing to bignums.
;;;
;;; Finally, note that even Feeley's expression can't build an N-bit mask
;;; without bignum help. This is fundamental, since the interpretation
;;; of fixed-size fixnum bit patterns as semi-infinite-bit-strings is that
;;; you replicate the high bit out to infinity. So you have to have a
;;; zero "stop bit" appearing after that highest one bit to turn off the
;;; replication of the ones.

(define (bit-set? index n)
  (not (zero? (bitwise-and (arithmetic-shift 1 index) n))))

(define (any-bits-set? test-bits n) (not (zero? (bitwise-and test-bits n))))

(define (all-bits-set? test-bits n) (= test-bits (bitwise-and test-bits n)))

(define (bitwise-merge mask n0 n1)
  (bitwise-ior (bitwise-and mask n1)
               (bitwise-and (bitwise-not mask) n0)))

;;; Bit-field ops

(define (extract-bit-field size position n)
  (bitwise-and (%mask size) (arithmetic-shift n (- position))))

(define (test-bit-field? size position n)
  (not (zero? (bitwise-and (arithmetic-shift n (- position)) (%mask size)))))

;; Integrating i-b-f reduces nicely.
(define (clear-bit-field size position n)
  (replace-bit-field size position 0 n))

;;; Oops -- intermediate ARITHMETIC-SHIFT can fixnum-overflow on fixnum args.
;(define (replace-bit-field size position newfield n)
;  (copy-bit-field size position (arithmetic-shift newfield position) n))

;;; This three-line version won't fixnum-overflow on fixnum args.
(define (replace-bit-field size position newfield n)
  (let ((m (%mask size)))
    (bitwise-ior (bitwise-and n (bitwise-not (arithmetic-shift m position)))
                 (arithmetic-shift (bitwise-and newfield m) position))))

(define (copy-bit-field size position from to)
  (bitwise-merge (arithmetic-shift (%mask size) position) to from))

;; Simple definition
;(define (first-set-bit i)
;  (and (not (zero? i))
;       (let lp ((j 0) (i start))
;         (if (bit-set? i 0) j
;             (lp (+ j 1) (arithmetic-shift i 1))))))

;;; Clever definition, assuming you have a fast BIT-COUNT.
(define (first-set-bit i) (- (bit-count (bitwise-xor i (- i 1))) 1))

;; From reference implementation ends
