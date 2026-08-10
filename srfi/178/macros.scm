;;; SPDX-FileCopyrightText: 2020 Wolfgang Corcoran-Mathe <wcm@sigwinch.xyz>
;;;
;;; SPDX-License-Identifier: MIT

;;;;; SRFI 178 macros for internal use

;;; Bitvector type definition
;;; W wraps a u8vector as a bitvector, U unwraps it again

(define-record-type <bitvector>
  (W u8vec)
  bitvector?
  (u8vec U))

;; Convert a bit to an integer
(define-syntax I
  (syntax-rules ()
    ((I bit)
     (cond
       ((eqv? bit 0) 0)
       ((not bit) 0)
       (else 1)))))

;; Convert a bit to a bool
(define-syntax B
  (syntax-rules ()
    ((B bit) (not (or (eqv? bit 0) (not bit))))))
