
(define check-arg (lambda (pred val caller) (if (not (pred val)) (error val caller))))

(define optional (lambda (a b) (if (null? a) b (car a))))

(define-syntax internal-let-optionals
      (syntax-rules ()
        ((internal-let-optionals arg (((var ...) xparser) opt-clause ...) body ...)
         (call-with-values (lambda () (xparser arg))
                           (lambda (rest var ...)
                             (internal-let-optionals rest (opt-clause ...) body ...))))

        ((internal-let-optionals arg ((var default) opt-clause ...) body ...)
         (call-with-values (lambda () (if (null? arg) (values default '())
                                        (values (car arg) (cdr arg))))
                           (lambda (var rest)
                             (internal-let-optionals rest (opt-clause ...) body ...))))

        ((internal-let-optionals arg ((var default test) opt-clause ...) body ...)
         (call-with-values (lambda ()
                             (if (null? arg) (values default '())
                               (let ((var (car arg)))
                                 (if test (values var (cdr arg))
                                   (error "arg failed LET-OPT test" var)))))
                           (lambda (var rest)
                             (internal-let-optionals rest (opt-clause ...) body ...))))

        ((internal-let-optionals arg ((var default test supplied?) opt-clause ...) body ...)
         (call-with-values (lambda ()
                             (if (null? arg) (values default #f '())
                               (let ((var (car arg)))
                                 (if test (values var #t (cdr arg))
                                   (error "arg failed LET-OPT test" var)))))
                           (lambda (var supplied? rest)
                             (internal-let-optionals rest (opt-clause ...) body ...))))

        ((internal-let-optionals arg (rest) body ...)
         (let ((rest arg)) body ...))

        ((internal-let-optionals arg () body ...)
         (if (null? arg) (begin body ...)
           (error "Too many arguments in let-opt" arg)))))

(define-syntax let-optionals
      (syntax-rules ()
        ((let-optionals arg (opt-clause ...) body ...)
         (let ((rest arg))
           (internal-let-optionals rest (opt-clause ...) body ...)))))
