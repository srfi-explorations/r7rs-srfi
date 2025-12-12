(cond-expand
  (cyclone (export assume fatal-error))
  (else (export assume)))

(cond-expand
  (debug
    (begin
      (define fatal-error error)))
  (else
    (begin
      (define (fatal-error message . objs)
        (if (null? objs)
          (error message)
          (apply error (cons message objs)))))))

(define-syntax assume
  (syntax-rules ()
    ((assume expression message ...)
     (or expression
         (fatal-error "invalid assumption" (quote expression) (list message ...))))
    ((assume . _)
     (syntax-error "invalid assume syntax"))))
