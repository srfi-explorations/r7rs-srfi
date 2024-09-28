
(define slurp-loop
  (lambda (line result)
    (if (eof-object? line)
      result
      (slurp-loop (read-line) (string-append result line (string #\newline))))))

(define slurp
  (lambda (path)
    (with-input-from-file
      path
      (lambda ()
        (slurp-loop (read-line) "")))))

(define string-starts-with?
  (lambda (str prefix)
    (and (>= (string-length str) (string-length prefix))
         (string=? (string-copy str 0 (string-length prefix)) prefix))))

(define number-of-line->number
  (lambda (str)
    (letrec
      ((looper
         (lambda (chars result)
           (if (and (char-whitespace? (car chars)))
             (begin
               (string->number result))
             (looper (cdr chars) (string-append (string (car chars)) result ))))))
      (looper (reverse (string->list str)) ""))))
