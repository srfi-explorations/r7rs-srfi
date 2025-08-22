;Copyright (C) Marc Feeley 2002. All Rights Reserved.

;Permission is hereby granted, free of charge, to any person obtaining a copy of this software
;and associated documentation files (the "Software"), to deal in the Software without restriction,
;including without limitation the rights to use, copy, modify, merge, publish, distribute,
;sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is
;furnished to do so, subject to the following conditions:

;The above copyright notice and this permission notice shall be included in all copies or
;substantial portions of the Software.

;THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT
;NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
;NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
;DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

(define srfi-39:make-parameter
  (lambda (init . conv)
    (let ((converter (if (null? conv) (lambda (x) x) (car conv))))
      (let ((global-cell (cons #f (converter init))))
        (letrec ((parameter
                   (lambda new-val
                     (let ((cell (srfi-39:dynamic-lookup parameter global-cell)))
                       (cond ((null? new-val)
                              (cdr cell))
                             ((null? (cdr new-val))
                              (set-cdr! cell (converter (car new-val))))
                             (else ; this case is needed for parameterize
                               (converter (car new-val))))))))
          (set-car! global-cell parameter)
          parameter)))))

(define-syntax srfi-39:parameterize
  (syntax-rules ()
    ((parameterize ((expr1 expr2) ...) body ...)
     (srfi-39:dynamic-bind (list expr1 ...)
                   (list expr2 ...)
                   (lambda () body ...)))))

(define srfi-39:dynamic-bind
  (lambda (parameters values body)
    (let* ((old-local
             (srfi-39:dynamic-env-local-get))
           (new-cells
             (map (lambda (parameter value)
                    (cons parameter (parameter value #f)))
                  parameters
                  values))
           (new-local
             (append new-cells old-local)))
      (dynamic-wind
        (lambda () (srfi-39:dynamic-env-local-set! new-local))
        body
        (lambda () (srfi-39:dynamic-env-local-set! old-local))))))

(define srfi-39:dynamic-lookup
  (lambda (parameter global-cell)
    (or (assq parameter (srfi-39:dynamic-env-local-get))
        global-cell)))

(define srfi-39:dynamic-env-local '())

(define srfi-39:dynamic-env-local-get
  (lambda () srfi-39:dynamic-env-local))

(define srfi-39:dynamic-env-local-set!
  (lambda (new-env) (set! srfi-39:dynamic-env-local new-env)))

