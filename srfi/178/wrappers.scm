;;; SPDX-FileCopyrightText: 2020 Wolfgang Corcoran-Mathe <wcm@sigwinch.xyz>
;;;
;;; SPDX-License-Identifier: MIT

;;;; SRFI 178 procedures that are just wrappers

(define make-bitvector
  (case-lambda
    ((size) (W (make-u8vector size)))
    ((size bit) (W (make-u8vector size (I bit))))))

(define bitvector-copy
  (case-lambda
    ((bvec) (W (u8vector-copy (U bvec))))
    ((bvec start) (W (u8vector-copy (U bvec) start)))
    ((bvec start end) (W (u8vector-copy (U bvec) start end)))))

(define bitvector-reverse-copy
  (case-lambda
    ((bvec) (W (u8vector-reverse-copy (U bvec))))
    ((bvec start) (W (u8vector-reverse-copy (U bvec) start)))
    ((bvec start end) (W (u8vector-reverse-copy (U bvec) start end)))))

(define (bitvector-append . bvecs)
  (bitvector-concatenate bvecs))

(define (bitvector-concatenate bvecs)
  (W (u8vector-concatenate (map U bvecs))))

(define (bitvector-append-subbitvectors . args)
  (W (apply u8vector-append-subvectors
            (map (lambda (x) (if (bitvector? x) (U x) x)) args))))

(define (bitvector-empty? bvec)
  (eqv? 0 (u8vector-length (U bvec))))

(define (bitvector=? . bvecs)
  (apply u8vector= (map U bvecs)))

(define (bitvector-ref/int bvec i)
  (u8vector-ref (U bvec) i))

(define (bitvector-ref/bool bvec i)
  (B (u8vector-ref (U bvec) i)))

(define (bitvector-length bvec)
  (u8vector-length (U bvec)))

(define (bitvector-take bvec n)
  (W (u8vector-take (U bvec) n)))

(define (bitvector-take-right bvec n)
  (W (u8vector-take-right (U bvec) n)))

(define (bitvector-drop bvec n)
  (W (u8vector-drop (U bvec) n)))

(define (bitvector-drop-right bvec n)
  (W (u8vector-drop-right (U bvec) n)))

(define (bitvector-segment bvec n)
  (unless (and (integer? n) (positive? n))
    (error "bitvector-segment: not a positive integer" n))
  (map W (u8vector-segment (U bvec) n)))

(define bitvector-fold/int
  (case-lambda
    ((kons knil bvec)
     (u8vector-fold kons knil (U bvec)))  ; fast path
    ((kons knil . bvecs)
     (apply u8vector-fold kons knil (map U bvecs)))))

(define bitvector-fold/bool
  (case-lambda
    ((kons knil bvec)
     (u8vector-fold (lambda (x b) (kons x (B b)))  ; fast path
                    knil
                    (U bvec)))
    ((kons knil . bvecs)
     (apply u8vector-fold
            (lambda (x . bits)
              (apply kons x (map bit->boolean bits)))
            knil
            (map U bvecs)))))

(define bitvector-fold-right/int
  (case-lambda
    ((kons knil bvec)
     (u8vector-fold-right kons knil (U bvec)))    ; fast path
    ((kons knil . bvecs)
     (apply u8vector-fold-right kons knil (map U bvecs)))))

(define bitvector-fold-right/bool
  (case-lambda
    ((kons knil bvec)
     (u8vector-fold-right (lambda (x bit) (kons x (B bit)))  ; fast path
                          knil
                          (U bvec)))
    ((kons knil . bvecs)
     (apply u8vector-fold-right
            (lambda (x . bits)
              (apply kons x (map bit->boolean bits)))
            knil
            (map U bvecs)))))

(define bitvector-map/int
  (case-lambda
    ((f bvec)
     (W (u8vector-map f (U bvec))))        ; one-bitvector fast path
    ((f bvec1 bvec2)
     (%bitvector-map2/int f bvec1 bvec2))  ; two-bitvector fast path
    ((f . bvecs)
     (W (apply u8vector-map f (map U bvecs))))))  ; normal path

;; Tuned two-bitvector version, mainly for binary logical ops.
(define (%bitvector-map2/int f bvec1 bvec2)
  (let ((u8vec1 (U bvec1))
        (u8vec2 (U bvec2)))
    (bitvector-unfold
     (lambda (i)
       (f (u8vector-ref u8vec1 i) (u8vector-ref u8vec2 i)))
     (bitvector-length bvec1))))

(define bitvector-map/bool
  (case-lambda
    ((f bvec)          ; one-bitvector fast path
     (W (u8vector-map (lambda (n) (I (f (B n)))) (U bvec))))
    ((f bvec1 bvec2)   ; two-bitvector fast path
     (%bitvector-map2/int (lambda (n m) (I (f (B n) (B m)))) bvec1 bvec2))
    ((f . bvecs)       ; normal path (ugh)
     (W (apply u8vector-map
               (lambda ns (I (apply f (map bit->boolean ns))))
               (map U bvecs))))))

(define bitvector-map!/int
  (case-lambda
    ((f bvec)
     (u8vector-map! f (U bvec)))            ; one-bitvector fast path
    ((f bvec1 bvec2)
     (%bitvector-map2!/int f bvec1 bvec2))  ; two-bitvector fast path
    ((f . bvecs)
     (apply u8vector-map! f (map U bvecs)))))  ; normal path

;; Tuned two-bitvector version, mainly for binary logical ops.
(define (%bitvector-map2!/int f bvec1 bvec2)
  (let ((len (bitvector-length bvec1))
        (u8vec1 (U bvec1))
        (u8vec2 (U bvec2)))
    (let lp ((i 0))
      (unless (>= i len)
        (u8vector-set! u8vec1 i (f (u8vector-ref u8vec1 i)
                                   (u8vector-ref u8vec2 i)))
        (lp (+ i 1))))
    bvec1))

(define bitvector-map!/bool
  (case-lambda
    ((f bvec)          ; one-bitvector fast path
     (u8vector-map! (lambda (n) (I (f (B n)))) (U bvec)))
    ((f bvec1 bvec2)   ; two-bitvector fast path
     (%bitvector-map2!/int (lambda (n m) (I (f (B n) (B m)))) bvec1 bvec2))
    ((f . bvecs)       ; normal path (ugh)
     (apply u8vector-map!
            (lambda ns (I (apply f (map bit->boolean ns))))
            (map U bvecs)))))

(define bitvector-for-each/int
  (case-lambda
    ((f bvec)
     (u8vector-for-each f (U bvec)))    ; fast path
    ((f . bvecs)
     (apply u8vector-for-each f (map U bvecs)))))

(define bitvector-for-each/bool
  (case-lambda
    ((f bvec)
     (u8vector-for-each (lambda (n) (f (B n))) (U bvec)))    ; fast path
    ((f . bvecs)
     (apply u8vector-for-each
            (lambda ns (apply f (map bit->boolean ns)))
            (map U bvecs)))))

(define (bitvector-set! bvec i bit)
  (u8vector-set! (U bvec) i (I bit)))

(define (bitvector-swap! bvec i j)
  (u8vector-swap! (U bvec) i j))


(define bitvector-reverse!
  (case-lambda
    ((bvec)
     (u8vector-reverse! (U bvec)))
    ((bvec start)
     (u8vector-reverse! (U bvec) start))
    ((bvec start end)
     (u8vector-reverse! (U bvec) start end))))

(define bitvector-copy!
  (case-lambda
    ((to at from)
     (u8vector-copy! (U to) at (U from)))
    ((to at from start)
     (u8vector-copy! (U to) at (U from) start))
    ((to at from start end)
     (u8vector-copy! (U to) at (U from) start end))))

(define bitvector-reverse-copy!
  (case-lambda
    ((to at from)
     (u8vector-reverse-copy! (U to) at (U from)))
    ((to at from start)
     (u8vector-reverse-copy! (U to) at (U from) start))
    ((to at from start end)
     (u8vector-reverse-copy! (U to) at (U from) start end))))

(define bitvector->list/int
  (case-lambda
    ((bvec)
     (u8vector->list (U bvec)))
    ((bvec start)
     (u8vector->list (U bvec) start))
    ((bvec start end)
     (u8vector->list (U bvec) start end))))

(define bitvector->list/bool
  (case-lambda
    ((bvec)
     (map bit->boolean (u8vector->list (U bvec))))
    ((bvec start)
     (map bit->boolean (u8vector->list (U bvec) start)))
    ((bvec start end)
     (map bit->boolean (u8vector->list (U bvec) start end)))))

(define reverse-bitvector->list/int
  (case-lambda
    ((bvec)
     (reverse-u8vector->list (U bvec)))
    ((bvec start)
     (reverse-u8vector->list (U bvec) start))
    ((bvec start end)
     (reverse-u8vector->list (U bvec) start end))))

(define reverse-bitvector->list/bool
  (case-lambda
    ((bvec)
     (map bit->boolean (reverse-u8vector->list (U bvec))))
    ((bvec start)
     (map bit->boolean (reverse-u8vector->list (U bvec) start)))
    ((bvec start end)
     (map bit->boolean (reverse-u8vector->list (U bvec) start end)))))

(define bitvector->vector/int
  (case-lambda
    ((bvec)
     (u8vector->vector (U bvec)))
    ((bvec start)
     (u8vector->vector (U bvec) start))
    ((bvec start end)
     (u8vector->vector (U bvec) start end))))

(define bitvector->vector/bool
  (case-lambda
    ((bvec)
     (vector-map bit->boolean (u8vector->vector (U bvec))))
    ((bvec start)
     (vector-map bit->boolean (u8vector->vector (U bvec) start)))
    ((bvec start end)
     (vector-map bit->boolean (u8vector->vector (U bvec) start end)))))

(define (list->bitvector list)
  (W (list->u8vector (map bit->integer list))))

(define (reverse-list->bitvector list)
  (W (reverse-list->u8vector (map bit->integer list))))

(define (bitvector . bits) (list->bitvector bits))

(define vector->bitvector
  (case-lambda
    ((vec)
     (W (vector->u8vector (vector-map bit->integer vec))))
    ((vec start)
     (W (vector->u8vector (vector-map bit->integer vec) start)))
    ((vec start end)
     (W (vector->u8vector (vector-map bit->integer vec) start end)))))
