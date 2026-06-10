(define-syntax rec
  (syntax-rules ()
    ((rec (name . variables) . body)
     (letrec ( (name (lambda variables. body))) name ))
    ((rec name expression)
     (letrec ((name expression)) name ))))
