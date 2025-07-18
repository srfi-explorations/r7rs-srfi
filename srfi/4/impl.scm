;;;; Implementation of SRFI 4 on top of (rnrs bytevectors)

;;; Main constructor

(define make-u8vector make-bytevector)

(define (make-s8vector size . maybe-value)
  (make+fill! 's8 1 s8vector-length s8vector-set! size maybe-value))

(define (make-u16vector size . maybe-value)
  (make+fill! 'u16 2 u16vector-length u16vector-set! size maybe-value))

(define (make-s16vector size . maybe-value)
  (make+fill! 's16 2 s16vector-length s16vector-set! size maybe-value))

(define (make-u32vector size . maybe-value)
  (make+fill! 'u32 4 u32vector-length u32vector-set! size maybe-value))

(define (make-s32vector size . maybe-value)
  (make+fill! 's32 4 s32vector-length s32vector-set! size maybe-value))

(define (make-u64vector size . maybe-value)
  (make+fill! 'u64 8 u64vector-length u64vector-set! size maybe-value))

(define (make-s64vector size . maybe-value)
  (make+fill! 's64 8 s64vector-length s64vector-set! size maybe-value))

(define (make-f32vector size . maybe-value)
  (make+fill! 'f32 4 f32vector-length f32vector-set! size maybe-value))

(define (make-f64vector size . maybe-value)
  (make+fill! 'f64 8 f64vector-length f64vector-set! size maybe-value))

;;; Variable-argument constructor

(define u8vector bytevector)

(define (s8vector . args)
  (list-> make-s8vector s8vector-set! args))

(define (u16vector . args)
  (list-> make-u16vector u16vector-set! args))

(define (s16vector . args)
  (list-> make-s16vector s16vector-set! args))

(define (u32vector . args)
  (list-> make-u32vector u32vector-set! args))

(define (s32vector . args)
  (list-> make-s32vector s32vector-set! args))

(define (u64vector . args)
  (list-> make-u64vector u64vector-set! args))

(define (s64vector . args)
  (list-> make-s64vector s64vector-set! args))

(define (f32vector . args)
  (list-> make-f32vector f32vector-set! args))

(define (f64vector . args)
  (list-> make-f64vector f64vector-set! args))

;; Predicate

(define u8vector? bytevector?)

(define (s8vector? obj)
  (and (multivector? obj) (eq? (tag obj) 's8)))

(define (u16vector? obj)
  (and (multivector? obj) (eq? (tag obj) 'u16)))

(define (s16vector? obj)
  (and (multivector? obj) (eq? (tag obj) 's16)))

(define (u32vector? obj)
  (and (multivector? obj) (eq? (tag obj) 'u32)))

(define (s32vector? obj)
  (and (multivector? obj) (eq? (tag obj) 's32)))

(define (u64vector? obj)
  (and (multivector? obj) (eq? (tag obj) 'u64)))

(define (s64vector? obj)
  (and (multivector? obj) (eq? (tag obj) 's64)))

(define (f32vector? obj)
  (and (multivector? obj) (eq? (tag obj) 'f32)))

(define (f64vector? obj)
  (and (multivector? obj) (eq? (tag obj) 'f64)))

;; Length

(define u8vector-length bytevector-length)

(define (s8vector-length vec)
  (bytevector-length (bv vec)))

(define (u16vector-length vec)
  (/ (bytevector-length (bv vec)) 2))

(define (s16vector-length vec)
  (/ (bytevector-length (bv vec)) 2))

(define (u32vector-length vec)
  (/ (bytevector-length (bv vec)) 4))

(define (s32vector-length vec)
  (/ (bytevector-length (bv vec)) 4))

(define (u64vector-length vec)
  (/ (bytevector-length (bv vec)) 8))

(define (s64vector-length vec)
  (/ (bytevector-length (bv vec)) 8))

(define (f32vector-length vec)
  (/ (bytevector-length (bv vec)) 4))

(define (f64vector-length vec)
  (/ (bytevector-length (bv vec)) 8))

;; Get element

(define u8vector-ref bytevector-u8-ref)

(define (s8vector-ref vec index)
  (bytevector-s8-ref (bv vec) index))

(define (u16vector-ref vec index)
  (bytevector-u16-native-ref (bv vec) (* index 2)))

(define (s16vector-ref vec index)
  (bytevector-s16-native-ref (bv vec) (* index 2)))

(define (u32vector-ref vec index)
  (bytevector-u32-native-ref (bv vec) (* index 4)))

(define (s32vector-ref vec index)
  (bytevector-s32-native-ref (bv vec) (* index 4)))

(define (u64vector-ref vec index)
  (bytevector-u64-native-ref (bv vec) (* index 8)))

(define (s64vector-ref vec index)
  (bytevector-s64-native-ref (bv vec) (* index 8)))

(define (f32vector-ref vec index)
  (bytevector-ieee-single-native-ref (bv vec) (* index 4)))

(define (f64vector-ref vec index)
  (bytevector-ieee-double-native-ref (bv vec) (* index 8)))

;; Set element

(define u8vector-set! bytevector-u8-set!)

(define (s8vector-set! vec index value)
  (bytevector-s8-set! (bv vec) index value))

(define (u16vector-set! vec index value)
  (bytevector-u16-native-set! (bv vec) (* index 2) value))

(define (s16vector-set! vec index value)
  (bytevector-s16-native-set! (bv vec) (* index 2) value))

(define (u32vector-set! vec index value)
  (bytevector-u32-native-set! (bv vec) (* index 4) value))

(define (s32vector-set! vec index value)
  (bytevector-s32-native-set! (bv vec) (* index 4) value))

(define (u64vector-set! vec index value)
  (bytevector-u64-native-set! (bv vec) (* index 8) value))

(define (s64vector-set! vec index value)
  (bytevector-s64-native-set! (bv vec) (* index 8) value))

(define (f32vector-set! vec index value)
  (bytevector-ieee-single-native-set! (bv vec) (* index 4) value))

(define (f64vector-set! vec index value)
  (bytevector-ieee-double-native-set! (bv vec) (* index 8) value))

;; Vec to list

(define (u8vector->list vec)
  (->list u8vector-ref u8vector-length vec))

(define (s8vector->list vec)
  (->list s8vector-ref s8vector-length vec))

(define (u16vector->list vec)
  (->list u16vector-ref u16vector-length vec))

(define (s16vector->list vec)
  (->list s16vector-ref s16vector-length vec))

(define (u32vector->list vec)
  (->list u32vector-ref u32vector-length vec))

(define (s32vector->list vec)
  (->list s32vector-ref s32vector-length vec))

(define (u64vector->list vec)
  (->list u64vector-ref u64vector-length vec))

(define (s64vector->list vec)
  (->list s64vector-ref s64vector-length vec))

(define (f32vector->list vec)
  (->list f32vector-ref f32vector-length vec))

(define (f64vector->list vec)
  (->list f64vector-ref f64vector-length vec))

;; List to vec

(define (list->u8vector list)
  (list-> make-u8vector u8vector-set! list))

(define (list->s8vector list)
  (list-> make-s8vector s8vector-set! list))

(define (list->u16vector list)
  (list-> make-u16vector u16vector-set! list))

(define (list->s16vector list)
  (list-> make-s16vector s16vector-set! list))

(define (list->u32vector list)
  (list-> make-u32vector u32vector-set! list))

(define (list->s32vector list)
  (list-> make-s32vector s32vector-set! list))

(define (list->u64vector list)
  (list-> make-u64vector u64vector-set! list))

(define (list->s64vector list)
  (list-> make-s64vector s64vector-set! list))

(define (list->f32vector list)
  (list-> make-f32vector f32vector-set! list))

(define (list->f64vector list)
  (list-> make-f64vector f64vector-set! list))


