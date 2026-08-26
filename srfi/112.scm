(define (string-split str split-by)
  (read
    (open-input-string
      (list->string
        (apply
          append
          (append
            (list (list #\( #\"))
            (map (lambda (c)
                   (if (char=? split-by c)
                     (list #\" #\space #\")
                     (list c)))
                 (string->list str))
            (list (list #\" #\)))))))))

(cond-expand
  (not (kawa)
(define (string-starts-with? str starts-with)
  (let ((sw-len (string-length starts-with)))
    (and (>= (string-length str) sw-len)
         (string=? (string-copy str 0 sw-len) starts-with))))

       (define (get-features-starting-with starts-with)
         (apply append
                (map
                  (lambda (feature)
                    (if (string-starts-with? (symbol->string feature) starts-with)
                      (list feature)
                      (list)))
                  (features)))))
  (else))

(define (implementation-name)
  (cond-expand (capyscheme "capyscheme")
               (chibi "chibi")
               (chicken "chicken")
               (cyclone "cyclone")
               (foment "foment")
               (gauche "gauche")
               (gambit "gambit")
               (guile "guile")
               (kawa "kawa")
               (larceny "larceny")
               (loko "loko")
               (meevax "meevax")
               (mit-scheme "mit-scheme")
               (mosh "mosh")
               (racket "racket")
               (sagittarius "sagittarius")
               (skint "skint")
               (stklos "stklos")
               (tr7 "tr7")
               (ypsilon "ypsilon")
               (else #f)))

(define (implementation-version)
  (cond-expand
    (chibi
      (guard (ex (else #f))
      (list-ref
        (string-split
          (symbol->string (car (get-features-starting-with "chibi-"))) #\-) 1)))
    (chicken (cond-expand (chicken-5 "5") (chicken-6 "6") (else #f)))
    (cyclone
      (guard (ex (else #f))
      (list-ref
        (string-split
          (symbol->string (car (get-features-starting-with "version-")) #\-) 1))))
    (foment
      (guard (ex (else #f))
      (list-ref
        (string-split
          (symbol->string (car (get-features-starting-with "foment-")) #\-) 1))))
    (gauche (gauche-version))
    (gambit (system-version-string))
    (guile (guard (ex (else #f)) (version)))
    (kawa
      (guard (ex (else #f))
        (let* ((long (list-ref (string-split (symbol->string (list-ref (features)
                                                                       1))
                                             #\-)
                               1))
               (split (string-split long #\space))
               (git (list-ref split 3))
               (short (list-ref split 0)))
          (if (string=? git short)
            short
            (string-append short "-" git)))))
    (loko (guard (ex (else #f)) (loko-version)))
    (mit
      (guard (ex (else #f))
        (list-ref
          (string-split
            (symbol->string (car (get-features-starting-with "mit/gnu-"))) #\-) 1)))
    (racket (guard (ex (else #f)) (version)))
    (sagittarius
      (guard (ex (else #f))
        (list-ref
          (string-split
            (symbol->string (car (get-features-starting-with "sagittarius-"))) #\-) 1)))
    (skint
      (guard (ex (else #f))
        (list-ref
          (string-split
            (symbol->string (car (get-features-starting-with "skint-"))) #\-) 1)))
    (stklos
      (guard (ex (else #f))
        (list-ref
          (string-split
            (symbol->string (car (get-features-starting-with "STklos-"))) #\-) 1)))
    (tr7
      (guard (ex (else #f))
        (list-ref
          (string-split
            (symbol->string (car (get-features-starting-with "tr7-"))) #\-) 1)))
    (else #f)))

(define (cpu-architecture)
  (cond-expand
    (gambit
      (guard (ex (else #f))
        (let ((type (car (system-type))))
          (cond ((equal? type 'x86_64) "x86_64")
                (else #f)))))
    (i686 "i686")
    (x86_64 "x86_64")
    (x86-64 "x86_64")
    (arm "arm")
    (else #f)))

(define (machine-name)
  (cond-expand
    (linux
      (let ((hostfile "/etc/hostname"))
        (if (file-exists? hostfile)
          (guard (ex (else #f))
            (with-input-from-file hostfile (lambda () (read-line))))
          #f)))
    (windows (get-environment-variable "COMPUTERNAME"))
    (else #f)))

(define (os-name)
  (cond-expand
    (linux "Linux")
    (gnu-linux "Linux")
    (windows "Windows")
    (netbsd "NetBSD")
    (net-bsd "NetBSD")
    (freebsd "FreeBSD")
    (free-bsd "FreeBSD")
    (haiku "Haiku")
    (unix "Unix")
    (else #f)))

(define (os-version)
  (cond-expand
    (else #f)))
