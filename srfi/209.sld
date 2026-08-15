;;; SPDX-FileCopyrightText: 2020 Wolfgang Corcoran-Mathe <wcm@sigwinch.xyz>
;;;
;;; SPDX-License-Identifier: MIT

(define-library (srfi 209)
  (import (scheme base)
          (scheme case-lambda)
          (srfi 1)
          (srfi 125)
          (srfi 128)
          (srfi 178))

  (cond-expand
    ((library (srfi 162))
     (import (srfi 162)))
    (else
     (begin
      (define real-comparator
        (make-comparator real? = < number-hash)))))

  (export enum-type? enum? enum-type-contains? enum=? enum<? enum>?
          enum<=? enum>=?

          make-enum-type

          enum-type enum-name enum-ordinal enum-value

          enum-name->enum enum-ordinal->enum enum-name->ordinal
          enum-name->value enum-ordinal->name enum-ordinal->value

          enum-type-size enum-min enum-max enum-type-enums
          enum-type-names enum-type-values

          enum-next enum-prev

          enum-type->enum-set enum-set list->enum-set enum-set-projection
          enum-set-copy enum-empty-set make-enumeration enum-set-universe
          enum-set-constructor enum-set-type enum-set-indexer

          enum-set? enum-set-contains? enum-set=? enum-set-member?
          enum-set-empty? enum-set-disjoint? enum-set<? enum-set>?
          enum-set<=? enum-set>=? enum-set-any? enum-set-every?
          enum-set-subset?

          enum-set-adjoin! enum-set-delete! enum-set-delete-all!
          enum-set-adjoin enum-set-delete enum-set-delete-all

          enum-set-size enum-set->list enum-set-map->list enum-set-for-each
          enum-set-filter enum-set-remove enum-set-count enum-set-fold
          enum-set->enum-list
          enum-set-filter! enum-set-remove!

          enum-set-union enum-set-intersection enum-set-difference
          enum-set-xor enum-set-complement enum-set-union!
          enum-set-intersection! enum-set-difference! enum-set-xor!
          enum-set-complement!

          make-enum-comparator

          define-enum define-enumeration
          )

  (begin
   ;;;; Utility

   (define-syntax assert
     (syntax-rules ()
       ((assert expr)
        (unless expr
          (error "assertion failed" 'expr)))
       ((assert expr msg)
        (unless expr
          (error msg 'expr)))))

   (define (exact-natural? obj)
     (and (exact-integer? obj) (not (negative? obj))))

   (define (bitvector-subset? vec1 vec2)
     (let loop ((i (- (bitvector-length vec1) 1)))
       (cond ((< i 0) #t)
             ((and (bitvector-ref/bool vec1 i)
                   (zero? (bitvector-ref/int vec2 i)))
              #f)
             (else (loop (- i 1))))))

   ;;;; Types

   (define-record-type <enum-type>
     (make-raw-enum-type enum-vector name-table comparator)
     enum-type?
     (enum-vector enum-type-enum-vector set-enum-type-enum-vector!)
     (name-table enum-type-name-table set-enum-type-name-table!)
     (comparator enum-type-comparator set-enum-type-comparator!))

   (define-record-type <enum>
     (make-enum type name ordinal value)
     enum?
     (type enum-type)
     (name enum-name)
     (ordinal enum-ordinal)
     (value enum-value))

   (define (make-enum-type names+vals)
     (assert (or (pair? names+vals) (null? names+vals))
             "argument must be a proper list")
     (let* ((type (make-raw-enum-type #f #f #f))
            (enums (generate-enums type names+vals)))
       (set-enum-type-enum-vector! type (list->vector enums))
       (set-enum-type-name-table! type (make-name-table enums))
       (set-enum-type-comparator! type (make-enum-comparator type))
       type))

   (define (generate-enums type names+vals)
     (map (lambda (elt ord)
            (cond ((and (pair? elt) (= 2 (length elt)) (symbol? (car elt)))
                   (make-enum type (car elt) ord (cadr elt)))
                  ((symbol? elt) (make-enum type elt ord ord))
                  (else (error "make-enum-type: invalid argument" elt))))
          names+vals
          (iota (length names+vals))))

   (define symbol-comparator
     (make-comparator symbol?
                      eqv?
                      (lambda (sym1 sym2)
                        (string<? (symbol->string sym1)
                                  (symbol->string sym2)))
                      symbol-hash))

   (define (make-name-table enums)
     (hash-table-unfold null?
                        (lambda (enums)
                          (values (enum-name (car enums)) (car enums)))
                        cdr
                        enums
                        symbol-comparator))

   (define (%enum-type=? etype1 etype2)
     (eqv? etype1 etype2))

   (define (make-enum-comparator type)
     (make-comparator
      (lambda (obj)
        (and (enum? obj) (eq? (enum-type obj) type)))
      eq?
      (lambda (enum1 enum2)
        (< (enum-ordinal enum1) (enum-ordinal enum2)))
      (lambda (enum)
        (symbol-hash (enum-name enum)))))

   ;;;; Predicates

   (define (enum-type-contains? type enum)
     (assert (enum-type? type))
     (assert (enum? enum))
     ((comparator-type-test-predicate (enum-type-comparator type)) enum))

   (define (%enum-type-contains?/no-assert type enum)
     ((comparator-type-test-predicate (enum-type-comparator type)) enum))

   (define (%well-typed-enum? type obj)
     (and (enum? obj) (%enum-type-contains?/no-assert type obj)))

   (define (%compare-enums compare enums)
     (assert (and (pair? enums) (pair? (cdr enums)))
             "invalid number of arguments")
     (assert (enum? (car enums)))
     (let ((type (enum-type (car enums))))
       (assert (every (lambda (e) (%well-typed-enum? type e)) (cdr enums))
               "enums must all belong to the same type")
       (apply compare (enum-type-comparator type) enums)))

   (define (enum=? enum1 enum2 . enums)
     (assert (enum? enum1))
     (let* ((type (enum-type enum1))
            (comp (enum-type-comparator type)))
       (cond ((null? enums)                            ; fast path
              (assert (%well-typed-enum? type enum2)
                      "enums must all belong to the same type")
              ((comparator-equality-predicate comp) enum1 enum2))
             (else                                     ; variadic path
              (assert (every (lambda (e) (%well-typed-enum? type e)) enums)
                      "enums must all belong to the same type")
              (apply =? comp enum1 enum2 enums)))))

   (define (enum<? . enums) (%compare-enums <? enums))

   (define (enum>? . enums) (%compare-enums >? enums))

   (define (enum<=? . enums) (%compare-enums <=? enums))

   (define (enum>=? . enums) (%compare-enums >=? enums))

   ;;;; Enum finders

   ;;; Core procedures

   (define (enum-name->enum type name)
     (assert (enum-type? type))
     (assert (symbol? name))
     (hash-table-ref/default (enum-type-name-table type) name #f))

   (define (enum-ordinal->enum enum-type ordinal)
     (assert (enum-type? enum-type))
     (assert (exact-natural? ordinal))
     (and (< ordinal (enum-type-size enum-type))
          (vector-ref (enum-type-enum-vector enum-type) ordinal)))

   ;; Fast version for internal use.
   (define (%enum-ordinal->enum-no-assert enum-type ordinal)
     (vector-ref (enum-type-enum-vector enum-type) ordinal))

   ;;; Derived procedures

   (define (%enum-project type finder key proc)
     (assert (enum-type? type))
     (cond ((finder type key) => proc)
           (else (error "no enum found" type key))))

   (define (enum-name->ordinal type name)
     (assert (symbol? name))
     (%enum-project type enum-name->enum name enum-ordinal))

   (define (enum-name->value type name)
     (assert (symbol? name))
     (%enum-project type enum-name->enum name enum-value))

   (define (enum-ordinal->name type ordinal)
     (assert (exact-natural? ordinal))
     (%enum-project type %enum-ordinal->enum-no-assert ordinal enum-name))

   (define (enum-ordinal->value type ordinal)
     (assert (exact-natural? ordinal))
     (%enum-project type %enum-ordinal->enum-no-assert ordinal enum-value))

   ;;;; Enum type accessors

   (define (enum-type-size type)
     (assert (enum-type? type))
     (vector-length (enum-type-enum-vector type)))

   (define (enum-min type)
     (assert (enum-type? type))
     (vector-ref (enum-type-enum-vector type) 0))

   (define (enum-max type)
     (assert (enum-type? type))
     (let ((vec (enum-type-enum-vector type)))
       (vector-ref vec (- (vector-length vec) 1))))

   (define (enum-type-enums type)
     (assert (enum-type? type))
     (vector->list (enum-type-enum-vector type)))

   (define (enum-type-names type)
     (assert (enum-type? type))
     (let ((vec (enum-type-enum-vector type)))
       (list-tabulate (vector-length vec)
                      (lambda (n) (enum-name (vector-ref vec n))))))

   (define (enum-type-values type)
     (assert (enum-type? type))
     (let ((vec (enum-type-enum-vector type)))
       (list-tabulate (vector-length vec)
                      (lambda (n) (enum-value (vector-ref vec n))))))

   ;;;; Enum object procedures

   (define (enum-next enum)
     (assert (enum? enum))
     (enum-ordinal->enum (enum-type enum) (+ (enum-ordinal enum) 1)))

   (define (enum-prev enum)
     (assert (enum? enum))
     (let ((ord (enum-ordinal enum)))
       (and (> ord 0)
            (enum-ordinal->enum (enum-type enum) (- ord 1)))))

   ;;;; Enum set constructors

   (define-record-type <enum-set>
     (make-enum-set type bitvector)
     enum-set?
     (type enum-set-type)
     (bitvector enum-set-bitvector set-enum-set-bitvector!))

   (define (enum-empty-set type)
     (assert (enum-type? type))
     (make-enum-set type (make-bitvector (enum-type-size type) #f)))

   (define (enum-type->enum-set type)
     (assert (enum-type? type))
     (make-enum-set type (make-bitvector (enum-type-size type) #t)))

   (define (enum-set type . enums) (list->enum-set type enums))

   (define (list->enum-set type enums)
     (assert (or (pair? enums) (null? enums))
             "argument must be a proper list")
     (let ((vec (make-bitvector (enum-type-size type) #f)))
       (for-each (lambda (e)
                   (assert (%well-typed-enum? type e) "ill-typed enum")
                   (bitvector-set! vec (enum-ordinal e) #t))
                 enums)
       (make-enum-set type vec)))

   ;; Returns a set of enums drawn from the enum-type/-set src with
   ;; the same names as the enums of eset.
   (define (enum-set-projection src eset)
     (assert (or (enum-type? src) (enum-set? src))
             "argument must be an enum type or enum set")
     (assert (enum-set? eset))
     (let ((type (if (enum-type? src) src (enum-set-type src))))
       (list->enum-set
        type
        (enum-set-map->list
         (lambda (enum)
           (let ((name (enum-name enum)))
             (or (enum-name->enum type name)
                 (error "enum name not found in type" name type))))
         eset))))

   (define (enum-set-copy eset)
     (make-enum-set (enum-set-type eset)
                    (bitvector-copy (enum-set-bitvector eset))))

   ;; [Deprecated]
   (define (make-enumeration names)
     (enum-type->enum-set (make-enum-type (zip names names))))

   ;; [Deprecated]
   (define (enum-set-universe eset)
     (assert (enum-set? eset))
     (enum-type->enum-set (enum-set-type eset)))

   ;; [Deprecated]  Returns a procedure which takes a list of symbols
   ;; and returns an enum set containing the corresponding enums.  This
   ;; extracts the type of eset, but otherwise ignores this argument.
   (define (enum-set-constructor eset)
     (assert (enum-set? eset))
     (let ((type (enum-set-type eset)))
       (lambda (names)
         (list->enum-set type
                         (map (lambda (sym)
                                (or (enum-name->enum type sym)
                                    (error "invalid enum name" sym)))
                              names)))))

   ;; [Deprecated] Returns a procedure which takes a symbol and returns
   ;; the corresponding enum ordinal or #f.  This doesn't make any use
   ;; of eset, beyond pulling out its enum type.
   (define (enum-set-indexer eset)
     (assert (enum-set? eset))
     (let ((type (enum-set-type eset)))
       (lambda (name)
         (cond ((enum-name->enum type name) => enum-ordinal)
               (else #f)))))

   ;;;; Enum set predicates

   (define (enum-set-contains? eset enum)
     (assert (enum-set? eset))
     (assert (%well-typed-enum? (enum-set-type eset) enum)
             "enum types of arguments must match")
     (bitvector-ref/bool (enum-set-bitvector eset) (enum-ordinal enum)))

   ;; FIXME: Avoid double (type, then set) lookup.
   (define (enum-set-member? name eset)
     (assert (symbol? name))
     (assert (enum-set? eset))
     (bitvector-ref/bool (enum-set-bitvector eset)
                         (enum-name->ordinal (enum-set-type eset) name)))

   (define (%enum-set-type=? eset1 eset2)
     (%enum-type=? (enum-set-type eset1) (enum-set-type eset2)))

   (define (enum-set-empty? eset)
     (assert (enum-set? eset))
     (zero? (bitvector-count #t (enum-set-bitvector eset))))

   (define (bit-nand a b)
     (not (and (= 1 a) (= 1 b))))

   (define (enum-set-disjoint? eset1 eset2)
     (assert (enum-set? eset1))
     (assert (enum-set? eset2))
     (assert (%enum-type=? (enum-set-type eset1) (enum-set-type eset2))
             "arguments must have the same enum type")
     (let ((vec1 (enum-set-bitvector eset1))
           (vec2 (enum-set-bitvector eset2)))
       (let ((len (bitvector-length vec1)))
         (let loop ((i 0))
           (or (= i len)
               (and (bit-nand (bitvector-ref/int vec1 i)
                              (bitvector-ref/int vec2 i))
                    (loop (+ i 1))))))))

   (define (enum-set=? eset1 eset2)
     (assert (%enum-type=? (enum-set-type eset1) (enum-set-type eset2))
             "arguments must have the same enum type")
     (bitvector=? (enum-set-bitvector eset1) (enum-set-bitvector eset2)))

   (define (enum-set<? eset1 eset2)
     (assert (enum-set? eset1))
     (assert (enum-set? eset2))
     (assert (%enum-type=? (enum-set-type eset1) (enum-set-type eset2))
             "arguments must have the same enum type")
     (let ((vec1 (enum-set-bitvector eset1))
           (vec2 (enum-set-bitvector eset2)))
       (and (bitvector-subset? vec1 vec2)
            (not (bitvector=? vec1 vec2)))))

   (define (enum-set>? eset1 eset2)
     (assert (enum-set? eset1))
     (assert (enum-set? eset2))
     (assert (%enum-type=? (enum-set-type eset1) (enum-set-type eset2))
             "arguments must have the same enum type")
     (let ((vec1 (enum-set-bitvector eset1))
           (vec2 (enum-set-bitvector eset2)))
       (and (bitvector-subset? vec2 vec1)
            (not (bitvector=? vec1 vec2)))))

   (define (enum-set<=? eset1 eset2)
     (assert (enum-set? eset1))
     (assert (enum-set? eset2))
     (assert (%enum-type=? (enum-set-type eset1) (enum-set-type eset2))
             "arguments must have the same enum type")
     (bitvector-subset? (enum-set-bitvector eset1)
                        (enum-set-bitvector eset2)))

   (define (enum-set>=? eset1 eset2)
     (assert (enum-set? eset1))
     (assert (enum-set? eset2))
     (assert (%enum-type=? (enum-set-type eset1) (enum-set-type eset2))
             "arguments must have the same enum type")
     (bitvector-subset? (enum-set-bitvector eset2)
                        (enum-set-bitvector eset1)))

   ;; This uses lists as sets and is thus not very efficient.
   ;; An implementation with SRFI 113 or some other set library
   ;; might want to optimize this.
   (define (enum-set-subset? eset1 eset2)
     (assert (enum-set? eset1))
     (assert (enum-set? eset2))
     (lset<= eqv?
             (enum-set-map->list enum-name eset1)
             (enum-set-map->list enum-name eset2)))

   (define (enum-set-any? pred eset)
     (assert (procedure? pred))
     (call-with-current-continuation
      (lambda (return)
        (enum-set-fold (lambda (e _) (and (pred e) (return #t)))
                       #f
                       eset))))

   (define (enum-set-every? pred eset)
     (assert (procedure? pred))
     (call-with-current-continuation
      (lambda (return)
        (enum-set-fold (lambda (e _) (or (pred e) (return #f)))
                       #t
                       eset))))

   ;;;; Enum set mutators

   (define (enum-set-adjoin eset . enums)
     (apply enum-set-adjoin! (enum-set-copy eset) enums))

   (define enum-set-adjoin!
     (case-lambda
       ((eset enum)                 ; fast path
        (assert (enum-set? eset))
        (assert (%well-typed-enum? (enum-set-type eset) enum)
                "arguments must have the same enum type")
        (bitvector-set! (enum-set-bitvector eset) (enum-ordinal enum) #t)
        eset)
       ((eset . enums)              ; variadic path
        (assert (enum-set? eset))
        (let ((type (enum-set-type eset))
              (vec (enum-set-bitvector eset)))
          (for-each (lambda (e)
                      (assert (%well-typed-enum? type e)
                              "arguments must have the same enum type")
                      (bitvector-set! vec (enum-ordinal e) #t))
                    enums)
          eset))))

   (define (enum-set-delete eset . enums)
     (apply enum-set-delete! (enum-set-copy eset) enums))

   (define enum-set-delete!
     (case-lambda
       ((eset enum)                ; fast path
        (assert (enum-set? eset))
        (assert (%well-typed-enum? (enum-set-type eset) enum)
                "arguments must have the same enum type")
        (bitvector-set! (enum-set-bitvector eset) (enum-ordinal enum) #f)
        eset)
       ((eset . enums)             ; variadic path
        (enum-set-delete-all! eset enums))))

   (define (enum-set-delete-all eset enums)
     (enum-set-delete-all! (enum-set-copy eset) enums))

   (define (enum-set-delete-all! eset enums)
     (assert (enum-set? eset))
     (assert (or (pair? enums) (null? enums))
             "argument must be a proper list")
     (unless (null? enums)
       (let ((type (enum-set-type eset))
             (vec (enum-set-bitvector eset)))
          (for-each (lambda (e)
                      (assert (%well-typed-enum? type e)
                              "arguments must have the same enum type")
                      (bitvector-set! vec (enum-ordinal e) #f))
                    enums)))
     eset)

   ;;;; Enum set operations

   (define (enum-set-size eset)
     (assert (enum-set? eset))
     (bitvector-count #t (enum-set-bitvector eset)))

   (define (enum-set->enum-list eset)
     (assert (enum-set? eset))
     (enum-set-map->list values eset))

   (define (enum-set->list eset)
     (enum-set-map->list enum-name eset))

   ;; Slightly complicated by the order in which proc is applied.
   (define (enum-set-map->list proc eset)
     (assert (procedure? proc))
     (assert (enum-set? eset))
     (let* ((vec (enum-set-bitvector eset))
            (len (bitvector-length vec))
            (type (enum-set-type eset)))
       (letrec
        ((build
          (lambda (i)
            (cond ((= i len) '())
                  ((bitvector-ref/bool vec i)
                   (cons (proc (%enum-ordinal->enum-no-assert type i))
                         (build (+ i 1))))
                  (else (build (+ i 1)))))))
         (build 0))))

   (define (enum-set-count pred eset)
     (assert (procedure? pred))
     (enum-set-fold (lambda (e n) (if (pred e) (+ n 1) n)) 0 eset))

   (define (enum-set-filter pred eset)
     (enum-set-filter! pred (enum-set-copy eset)))

   (define (enum-set-filter! pred eset)
     (assert (procedure? pred))
     (assert (enum-set? eset))
     (let* ((type (enum-set-type eset))
            (vec (enum-set-bitvector eset)))
       (let loop ((i (- (bitvector-length vec) 1)))
         (cond ((< i 0) eset)
               ((and (bitvector-ref/bool vec i)
                     (not (pred (%enum-ordinal->enum-no-assert type i))))
                (bitvector-set! vec i #f)
                (loop (- i 1)))
               (else (loop (- i 1)))))))

   (define (enum-set-remove pred eset)
     (enum-set-remove! pred (enum-set-copy eset)))

   (define (enum-set-remove! pred eset)
     (assert (procedure? pred))
     (assert (enum-set? eset))
     (let* ((type (enum-set-type eset))
            (vec (enum-set-bitvector eset)))
       (let loop ((i (- (bitvector-length vec) 1)))
         (cond ((< i 0) eset)
               ((and (bitvector-ref/bool vec i)
                     (pred (%enum-ordinal->enum-no-assert type i)))
                (bitvector-set! vec i #f)
                (loop (- i 1)))
               (else (loop (- i 1)))))))

   (define (enum-set-for-each proc eset)
     (assert (procedure? proc))
     (enum-set-fold (lambda (e _) (proc e)) '() eset))

   (define (enum-set-fold proc nil eset)
     (assert (procedure? proc))
     (assert (enum-set? eset))
     (let ((type (enum-set-type eset)))
       (let* ((vec (enum-set-bitvector eset))
              (len (bitvector-length vec)))
         (let loop ((i 0) (state nil))
           (cond ((= i len) state)
                 ((bitvector-ref/bool vec i)
                  (loop (+ i 1)
                        (proc (%enum-ordinal->enum-no-assert type i) state)))
                 (else (loop (+ i 1) state)))))))

   ;;;; Enum set logical operations

   (define (%enum-set-logical-op! bv-proc eset1 eset2)
     (assert (enum-set? eset1))
     (assert (enum-set? eset2))
     (assert (%enum-set-type=? eset1 eset2)
             "arguments must have the same enum type")
     (bv-proc (enum-set-bitvector eset1) (enum-set-bitvector eset2))
     eset1)

   (define (enum-set-union eset1 eset2)
     (%enum-set-logical-op! bitvector-ior! (enum-set-copy eset1) eset2))

   (define (enum-set-intersection eset1 eset2)
     (%enum-set-logical-op! bitvector-and! (enum-set-copy eset1) eset2))

   (define (enum-set-difference eset1 eset2)
     (%enum-set-logical-op! bitvector-andc2! (enum-set-copy eset1) eset2))

   (define (enum-set-xor eset1 eset2)
     (%enum-set-logical-op! bitvector-xor! (enum-set-copy eset1) eset2))

   (define (enum-set-union! eset1 eset2)
     (%enum-set-logical-op! bitvector-ior! eset1 eset2))

   (define (enum-set-intersection! eset1 eset2)
     (%enum-set-logical-op! bitvector-and! eset1 eset2))

   (define (enum-set-difference! eset1 eset2)
     (%enum-set-logical-op! bitvector-andc2! eset1 eset2))

   (define (enum-set-xor! eset1 eset2)
     (%enum-set-logical-op! bitvector-xor! eset1 eset2))

   (define (enum-set-complement eset)
     (enum-set-complement! (enum-set-copy eset)))

   (define (enum-set-complement! eset)
     (assert (enum-set? eset))
     (bitvector-not! (enum-set-bitvector eset))
     eset)

   ;;;; Syntax

   ;; Defines a new enum-type T, binds type-name to a macro which
   ;; takes a symbol to an enum in T, and binds constructor to a
   ;; macro taking symbols to an enum set of type T.
   (define-syntax define-enum
     (syntax-rules ()
       ((_ type-name (name-val ...) constructor)
        (begin
         (define etype (make-enum-type '(name-val ...)))
         (define-syntax type-name
           (syntax-rules ()
             ((_ name)
              (enum-name->enum etype 'name))))
         (define-syntax constructor
           (syntax-rules ()
             ((_ . names)
              (list->enum-set etype
                              (map (lambda (s)
                                     (enum-name->enum etype s))
                                   'names)))))))))

   ;; [Deprecated] As define-enum, except that type-name is bound to
   ;; a macro that returns its symbol argument if the corresponding
   ;; enum is in the new type.
   (define-syntax define-enumeration
     (syntax-rules ()
       ((_ type-name (name-val ...) constructor)
        (begin
         (define etype (make-enum-type '(name-val ...)))
         (define-syntax type-name
           (syntax-rules ()
             ((_ name)
              (and (enum-name->enum etype 'name) 'name))))
         (define-syntax constructor
           (syntax-rules ()
             ((_ . names)
              (list->enum-set etype
                              (map (lambda (s)
                                     (enum-name->enum etype s))
                                   'names)))))))))
   ))
