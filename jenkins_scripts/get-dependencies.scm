(import (scheme base)
        (scheme read)
        (scheme write)
        (scheme file)
        (scheme process-context))


(define file (list-ref (command-line) 1))

(define library-definition (with-input-from-file file (lambda () (read))))

(display (cdr (assoc 'import library-definition)))
(newline)
