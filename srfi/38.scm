;Copyright 2003 Ray Dillinger.

; Permission is hereby granted, free of charge, to any person obtaining a copy of this software
; and associated documentation files (the "Software"), to deal in the Software without restriction,
; including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicens
; , and/or sell copies of the Software, and to permit persons to whom the Software is furnished
; to do so, subject to the following conditions:

; The above copyright notice and this permission notice shall be included in all copies or substantial
; portions of the Software.

; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
; BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
; IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR
; IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

;;; A printer that shows all sharing of substructures.  Uses the Common
;;; Lisp print-circle notation: #n# refers to a previous substructure
;;; labeled with #n=.   Takes O(n^2) time.

(define (acons key val alist)
  (cons (cons key val) alist))

;; We only track duplicates of pairs, vectors, and strings.  We
;; ignore zero-length vectors and strings because r5rs doesn't
;; guarantee that eq? treats them sanely (and they aren't very
;; interesting anyway).

(define (interesting? obj)
  (or (pair? obj)
      (and (vector? obj) (not (zero? (vector-length obj))))
      (and (string? obj) (not (zero? (string-length obj))))))

;; (write-obj OBJ ALIST):
;; ALIST has an entry for each interesting part of OBJ.  The
;; associated value will be:
;;  -- a number if the part has been given one,
;;  -- #t if the part will need to be assigned a number but has not been yet,
;;  -- #f if the part will not need a number.
;; The cdr of ALIST's first element should be the most recently
;; assigned number.
;; Returns an alist with new shadowing entries for any parts that
;; had numbers assigned.

;; Scan computes the initial value of the alist, which maps each
;; interesting part of the object to #t if it occurs multiple times,
;; #f if only once.
(define (write-obj obj alist outport)
  (define (write-interesting alist)
    (cond ((pair? obj)
           (display "(" outport)
           (let write-cdr ((obj (cdr obj)) (alist (write-obj (car obj) alist outport)))
             (cond ((and (pair? obj) (not (cdr (assq obj alist))))
                    (display " " outport)
                    (write-cdr (cdr obj) (write-obj (car obj) alist outport)))
                   ((null? obj)
                    (display ")" outport)
                    alist)
                   (else
                     (display " . " outport)
                     (let ((alist (write-obj obj alist outport)))
                       (display ")" outport)
                       alist)))))
          ((vector? obj)
           (display "#(" outport)
           (let ((len (vector-length obj)))
             (let write-vec ((i 1) (alist (write-obj (vector-ref obj 0) alist outport)))
               (cond ((= i len) (display ")" outport) alist)
                     (else (display " " outport)
                           (write-vec (+ i 1)
                                      (write-obj (vector-ref obj i) alist outport)))))))
          ;; else it's a string
          (else (write obj outport) alist)))
  (cond ((interesting? obj)
         (let ((val (cdr (assq obj alist))))
           (cond ((not val) (write-interesting alist))
                 ((number? val)
                  (begin (display "#" outport)
                         (write val outport)
                         (display "#" outport) alist))
                 (else
                   (let ((n (+ 1 (cdar alist))))
                     (begin (display "#" outport)
                            (write n outport)
                            (display "=" outport))
                     (write-interesting (acons obj n alist)))))))
        (else (write obj outport) alist)))

(define (scan obj alist)
  (cond ((not (interesting? obj)) alist)
        ((assq obj alist)
         => (lambda (p) (if (cdr p) alist (acons obj #t alist))))
        (else
          (let ((alist (acons obj #f alist)))
            (cond ((pair? obj) (scan (car obj) (scan (cdr obj) alist)))
                  ((vector? obj)
                   (let ((len (vector-length obj)))
                     (do ((i 0 (+ 1 i))
                          (alist alist (scan (vector-ref obj i) alist)))
                       ((= i len) alist))))
                  (else alist))))))

(define (write-with-shared-structure obj . optional-port)
  (let ((outport (if (eq? '() optional-port)
                   (current-output-port)
                   (car optional-port))))
    (write-obj obj (acons 'dummy 0 (scan obj '())) outport)
    ;; We don't want to return the big alist that write-obj just returned.
    (if #f #f)))

(define (looking-at? c port)
  (eqv? c (peek-char port)))

(define (delimiter? c)
  (case c
    ((#\( #\) #\" #\;) #t)
    (else (or (eof-object? c)
              (char-whitespace? c)))))

(define (not-delimiter? c) (not (delimiter? c)))

(define (eat-intertoken-space port)
  (let ((c (peek-char port)))
    (cond ((eof-object? c))
          ((char-whitespace? c) (read-char port) (eat-intertoken-space port))
          ((char=? c #\;)
           (do ((c (read-char port) (read-char port)))
             ((or (eof-object? c) (char=? c #\newline))))
           (eat-intertoken-space port)))))

(define (internal-read-string port)
  (read-char port)
  (let read-it ((chars '()))
    (let ((c (read-char port)))
      (if (eof-object? c)
        (error "EOF inside a string")
        (case c
          ((#\") (list->string (reverse chars)))
          ((#\\) (read-it (cons (read-char port) chars)))
          (else (read-it (cons c chars))))))))

;; reads chars that match PRED and returns them as a string.
(define (read-some-chars pred port)
  (let iter ((chars '()))
    (let ((c (peek-char port)))
      (if (or (eof-object? c) (not (pred c)))
        (list->string (reverse chars))
        (iter (cons (read-char port) chars))))))

;; reads a character after the #\ has been read.
(define (read-character port)
  (let ((c (peek-char port)))
    (cond ((eof-object? c) (error "EOF inside a character"))
          ((char-alphabetic? c)
           (let ((name (read-some-chars char-alphabetic? port)))
             (cond ((= 1 (string-length name)) (string-ref name 0))
                   ((string-ci=? name "space") #\space)
                   ((string-ci=? name "newline") #\newline)
                   (else (error "Unknown named character: " name)))))
          (else (read-char port)))))

(define (read-number first-char port)
  (let ((str (string-append (string first-char)
                            (read-some-chars not-delimiter? port))))
    (or (string->number str)
        (error "Malformed number: " str))))

(define char-standard-case
  (if (char=? #\a (string-ref (symbol->string 'a) 0))
    char-downcase
    char-upcase))

(define (string-standard-case str)
  (let* ((len (string-length str))
         (new (make-string len)))
    (do ((i 0 (+ i 1)))
      ((= i len) new)
      (string-set! new i (char-standard-case (string-ref str i))))))

(define (read-identifier port)
  (string->symbol (string-standard-case (read-some-chars not-delimiter? port))))

(define (read-part-spec port)
  (let ((n (string->number (read-some-chars char-numeric? port))))
    (let ((c (read-char port)))
      (case c
        ((#\=) (cons 'decl n))
        ((#\#) (cons 'use n))
        (else (error "Malformed shared part specifier"))))))

;; Tokens: strings, characters, numbers, booleans, and
;; identifiers/symbols are represented as themselves.
;; Single-character tokens are represented as (CHAR), the
;; two-character tokens #( and ,@ become (#\#) and (#\@).
;; #NN= and #NN# become (decl . NN) and (use . NN).
(define (read-optional-token port)
  (eat-intertoken-space port)
  (let ((c (peek-char port)))
    (case c
      ((#\( #\) #\' #\`) (read-char port) (list c))
      ((#\,)
       (read-char port)
       (if (looking-at? #\@ port)
         (begin (read-char port) '(#\@))
         '(#\,)))
      ((#\") (internal-read-string port))
      ((#\.)
       (read-char port)
       (cond ((delimiter? (peek-char port)) '(#\.))
             ((not (looking-at? #\. port)) (read-number #\. port))
             ((begin (read-char port) (looking-at? #\. port)) (read-char port) '...)
             (else (error "Malformed token starting with \"..\""))))
      ((#\+) (read-char port) (if (delimiter? (peek-char port)) '+ (read-number c port)))
      ((#\-) (read-char port) (if (delimiter? (peek-char port)) '- (read-number c port)))
      ((#\#)
       (read-char port)
       (let ((c (peek-char port)))
         (case c
           ((#\() (read-char port) '(#\#))
           ((#\\) (read-char port) (read-character port))
           ((#\t #\T) (read-char port) #t)
           ((#\f #\F) (read-char port) #f)
           (else (cond ((eof-object? c) (error "EOF inside a # token"))
                       ((char-numeric? c) (read-part-spec port))
                       (else (read-number #\# port)))))))
      (else (cond ((eof-object? c) c)
                  ((char-numeric? c) (read-char port) (read-number c port))
                  (else (read-identifier port)))))))

(define (read-token port)
  (let ((tok (read-optional-token port)))
    (if (eof-object? tok)
      (error "EOF where token was required")
      tok)))

;; Parts-alist maps the number of each part to a thunk that returns the part.
(define parts-alist '())

(define (add-part-to-alist! n thunk)
  (set! parts-alist (cons (cons n thunk) parts-alist)))

;; Read-object returns a datum that may contain some thunks, which
;; need to be replaced with their return values.
(define (read-object port)
  (finish-reading-object (read-token port) port))

;; Like read-object, but may return EOF.
(define (read-optional-object port)
  (finish-reading-object (read-optional-token port) port))

(define (finish-reading-object first-token port)
  (if (not (pair? first-token))
    first-token
    (if (char? (car first-token))
      (case (car first-token)
        ((#\() (read-list-tail port))
        ((#\#) (list->vector (read-list-tail port)))
        ((#\. #\)) (error (string-append "Unexpected \"" (string (car first-token)) "\"")))
        (else
          (list (caadr (assv (car first-token)
                             '((#\' 'x) (#\, ,x) (#\` `x) (#\@ ,@x))))
                (read-object port))))
      ;; We need to specially handle chains of declarations in
      ;; order to allow #1=#2=x and #1=(#2=#1#) and not to allow
      ;; #1=#2=#1# nor #1=#2=#1=x.
      (let ((starting-alist parts-alist))
        (let read-decls ((token first-token))
          (if (and (pair? token) (symbol? (car token)))
            (let ((n (cdr token)))
              (case (car token)
                ((use)
                 ;; To use a part, it must have been
                 ;; declared before this chain started.
                 (cond ((assv n starting-alist) => cdr)
                       (else (error "Use of undeclared part " n))))
                ((decl)
                 (if (assv n parts-alist)
                   (error "Double declaration of part " n))
                 ;; Letrec enables us to make deferred
                 ;; references to an object before it exists.
                 (letrec ((obj (begin
                                 (add-part-to-alist! n (lambda () obj))
                                 (read-decls (read-token port)))))
                   obj))))
            (finish-reading-object token port)))))))

(define (read-list-tail port)
  (let ((token (read-token port)))
    (if (not (pair? token))
      (cons token (read-list-tail port))
      (case (car token)
        ((#\)) '())
        ((#\.) (let* ((obj (read-object port))
                      (tok (read-token port)))
                 (if (and (pair? tok) (char=? #\) (car tok)))
                   obj
                   (error "Extra junk after a dot"))))
        (else (let ((obj (finish-reading-object token port)))
                (cons obj (read-list-tail port))))))))

;; Unthunk.
;; To deference a part that was declared using another part,
;; e.g. #2=#1#, may require multiple dethunkings.  We were careful
;; in finish-reading-object to ensure that this won't loop forever:
(define (unthunk thunk)
  (let ((x (thunk)))
    (if (procedure? x) (unthunk x) x)))

(define (read-with-shared-structure . optional-port)
  (let* ((port (if (null? optional-port) (current-input-port) (car optional-port)))
        (obj (read-optional-object port)))
    (let fill-in-parts ((obj obj))
      (cond ((pair? obj)
             (if (procedure? (car obj))
               (set-car! obj (unthunk (car obj)))
               (fill-in-parts (car obj)))
             (if (procedure? (cdr obj))
               (set-cdr! obj (unthunk (cdr obj)))
               (fill-in-parts (cdr obj))))
            ((vector? obj)
             (let ((len (vector-length obj)))
               (do ((i 0 (+ i 1)))
                 ((= i len))
                 (let ((elt (vector-ref obj i)))
                   (if (procedure? elt)
                     (vector-set! obj i (unthunk elt))
                     (fill-in-parts elt))))))))
    obj))
