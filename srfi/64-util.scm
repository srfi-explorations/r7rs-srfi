(define-syntax assoc-ref
  (syntax-rules ()
    ((_ alist key)
     (if (assoc key alist)
       (cdr (assoc key alist))
       #f))))

(define-syntax assoc-set!
  (syntax-rules ()
    ((_ alist key value)
     (let ((result (list))
           (found? #f))
       (for-each
         (lambda (item)
           (if (equal? (car item) key)
             (begin
               (set! found? #t)
               (set! result (cons (cons key value) result)))
             (set! result (cons item result))))
         alist)
       (when (not found?) (set! result (cons (cons key value) result)))
       result))))

(define-syntax assoc-remove!
  (syntax-rules ()
    ((_ alist key)
     (let ((result (list)))
       (for-each
         (lambda (item)
           (when (not (equal? (car item) key))
             (set! result (cons item result))))
         alist)
       result))))

(define-syntax assq-ref
  (syntax-rules ()
    ((_ alist key)
     (if (assq key alist)
       (cdr (assq key alist))
       #f))))

(define-syntax assq-set!
  (syntax-rules ()
    ((_ alist key value)
     (let ((result (list))
           (found? #f))
       (for-each
         (lambda (item)
           (if (eq? (car item) key)
             (begin
               (set! found? #t)
               (set! result (cons (cons key value) result)))
             (set! result (cons item result))))
         alist)
       (when (not found?) (set! result (cons (cons key value) result)))
       result))))

(define string-trim-both
  (lambda (str . args)
    ;; TODO
    str))

(define-syntax with-output-to-string
  (syntax-rules ()
    ((_ thunk)
     (parameterize
       ((current-output-port
          (open-output-string)))
       thunk
       (get-output-string (current-output-port))))))

(define (pretty-print val per-line-prefix)
  (write val))

