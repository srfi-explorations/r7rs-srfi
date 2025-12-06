
(define (implementation-name)
  (cond-expand
    (capyscheme "capyscheme")
    (chezscheme "chezscheme")
    (chibi "chibi")
    (chicken "chicken")
    (cyclone "cyclone")
    (foment "foment")
    (gambit "gambit")
    (gauche "gauche")
    (guile "guile")
    (ikarus "ikarus")
    (ironscheme "ironscheme")
    (kawa "kawa")
    (larceny "larceny")
    (loko "loko")
    (meevax "meevax")
    (mit "mit-scheme")
    (mosh "mosh")
    (racket "racket")
    (sagittarius "sagittarius")
    (stklos "stklos")
    (tr7 "tr7")
    (ypsilon "ypsilon")
    (else #f)))

(define (implementation-version) #f)

(define (cpu-architecture)
  (cond-expand
    (windows #f)
    (else (with-input-from-file
            "/proc/sys/kernel/arch"
            (lambda () (read))))))

(define (machine-name)
  (cond-expand
    (windows #f)
    (else (with-input-from-file
            "/etc/hostname"
            (lambda () (read))))))

(define (os-name)
  (cond-expand
    (windows #f)
    (else (with-input-from-file
            "/proc/sys/kernel/ostype"
            (lambda () (read))))))

(define (parse-kernel-version version-string)
  (letrec* ((port (open-input-string version-string))
            (version "")
            (read-over-space? #f)
            (read-version
              (lambda (port)
                (let ((c (read-char port)))
                  (cond
                    ((or read-over-space? (eof-object? c)) #t)
                    ((char=? c #\space) (set! read-over-space? #t))
                    (else
                      (set! version (string-append version (string c)))
                      (read-version port)))))))
    (read-char port)
    (read port)
    (read port)
    (read port)
    (read port)
    (read-char port)
    (read-version port)
    version))

(define (os-version)
  (cond-expand
    (windows #f)
    (else
      (with-input-from-file
            "/proc/sys/kernel/version"
            (lambda ()
              (parse-kernel-version (read-line)))))))
