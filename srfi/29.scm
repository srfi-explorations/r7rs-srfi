;; © 2002 Scott G. Miller.
;;
;; Permission is hereby granted, free of charge, to any person obtaining a copy
;; of this software and associated documentation files (the "Software"), to deal
;; in the Software without restriction, including without limitation the rights
;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;; copies of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:
;;
;; The above copyright notice and this permission notice (including the next
;; paragraph) shall be included in all copies or substantial portions of the
;; Software.
;;
;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
;; FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
;; IN THE SOFTWARE.


;; The association list in which bundles will be stored
(define *localization-bundles* '())

;; The current-language and current-country functions provided
;; here must be rewritten for each Scheme system to default to the
;; actual locale of the session
(define current-language
  (let ((current-language-value 'en))
    (lambda args
      (if (null? args)
          current-language-value
          (set! current-language-value (car args))))))

(define current-country
  (let ((current-country-value 'us))
    (lambda args
      (if (null? args)
          current-country-value
          (set! current-country-value (car args))))))

;; The load-bundle! and store-bundle! both return #f in this
;; reference implementation.  A compliant implementation need
;; not rewrite these procedures.
(define load-bundle!
  (lambda (bundle-specifier)
    #f))

(define store-bundle!
  (lambda (bundle-specifier)
    #f))

;; Declare a bundle of templates with a given bundle specifier
(define declare-bundle!
  (letrec ((remove-old-bundle
            (lambda (specifier bundle)
              (cond ((null? bundle) '())
                    ((equal? (caar bundle) specifier)
                     (cdr bundle))
                    (else (cons (car bundle)
                                (remove-old-bundle specifier
                                                   (cdr bundle))))))))
    (lambda (bundle-specifier bundle-assoc-list)
      (set! *localization-bundles*
            (cons (cons bundle-specifier bundle-assoc-list)
                  (remove-old-bundle bundle-specifier
                                     *localization-bundles*))))))

;;Retrieve a localized template given its package name and a template name
(define localized-template
  (letrec ((rdc
            (lambda (ls)
              (if (null? (cdr ls))
                  '()
                  (cons (car ls) (rdc (cdr ls))))))
           (find-bundle
            (lambda (specifier template-name)
              (cond ((assoc specifier *localization-bundles*) =>
                     (lambda (bundle) bundle))
                    ((null? specifier) #f)
                    (else (find-bundle (rdc specifier)
                                       template-name))))))
    (lambda (package-name template-name)
      (let loop ((specifier (cons package-name
                                  (list (current-language)
                                        (current-country)))))
        (and (not (null? specifier))
             (let ((bundle (find-bundle specifier template-name)))
               (and bundle
                    (cond ((assq template-name bundle) => cdr)
                          ((null? (cdr specifier)) #f)
                          (else (loop (rdc specifier)))))))))))

(define (current-locale-details) '())