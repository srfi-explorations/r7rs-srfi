;;; SPDX-FileCopyrightText: 2020 Wolfgang Corcoran-Mathe <wcm@sigwinch.xyz>
;;;
;;; SPDX-License-Identifier: MIT

(define (u1-not a)
  (- 1 a))

(define (bitvector-not avec)
  (bitvector-map/int u1-not avec))

(define (bitvector-not! avec)
  (bitvector-map!/int u1-not avec))

(define (u1-and . args)
  (I (apply * args)))

(define (bitvector-and  . vecs)
  (apply bitvector-map/int u1-and vecs))

(define (bitvector-and!  . vecs)
  (apply bitvector-map!/int u1-and vecs))

(define (u1-ior . args)
  (I (apply + args)))

(define (bitvector-ior . vecs)
  (apply bitvector-map/int u1-ior vecs))

(define (bitvector-ior! . vecs)
  (apply bitvector-map!/int u1-ior vecs))

(define (u1-xor . args)
  (I (odd? (apply + args))))

(define (bitvector-xor . vecs)
  (apply bitvector-map/int u1-xor vecs))

(define (bitvector-xor! . vecs)
  (apply bitvector-map!/int u1-xor vecs))

(define (u1-eqv . args)
  (let ((xor-value (apply u1-xor args)))
    (if (odd? (length args))
      xor-value
      (u1-not xor-value))))

(define (bitvector-eqv . vecs)
  (apply bitvector-map/int u1-eqv vecs))

(define (bitvector-eqv! . vecs)
  (apply bitvector-map!/int u1-eqv vecs))

(define (u1-nand a b)
  (u1-not (u1-and a b)))

(define (bitvector-nand a b)
  (bitvector-map/int u1-nand a b))

(define (bitvector-nand! a b)
  (bitvector-map!/int u1-nand a b))

(define (u1-nor a b)
  (u1-not (u1-ior a b)))

(define (bitvector-nor a b)
  (bitvector-map/int u1-nor a b))

(define (bitvector-nor! a b)
  (bitvector-map!/int u1-nor a b))

(define (u1-andc1 a b)
  (u1-and (u1-not a) b))

(define (bitvector-andc1 a b)
  (bitvector-map/int u1-andc1 a b))

(define (bitvector-andc1! a b)
  (bitvector-map!/int u1-andc1 a b))

(define (u1-andc2 a b)
  (u1-and a (u1-not b)))

(define (bitvector-andc2 a b)
  (bitvector-map/int u1-andc2 a b))

(define (bitvector-andc2! a b)
  (bitvector-map!/int u1-andc2 a b))

(define (u1-orc1 a b)
  (u1-ior (u1-not a) b))

(define (bitvector-orc1 a b)
  (bitvector-map/int u1-orc1 a b))

(define (bitvector-orc1! a b)
  (bitvector-map!/int u1-orc1 a b))

(define (u1-orc2 a b)
  (u1-ior a (u1-not b)))

(define (bitvector-orc2 a b)
  (bitvector-map/int u1-orc2 a b))

(define (bitvector-orc2! a b)
  (bitvector-map!/int u1-orc2 a b))

