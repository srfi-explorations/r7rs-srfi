; If compiler then somekind of library command is mandatory, use "ls" if not needed actually

(define implementations

  '(((name . chibi)
     (command . "chibi-scheme -I ."))

    ((name . chicken-compiler)
     (compiler? . #t)
     (command . "csc -X r7rs -R r7rs -I ./srfi -o test")
     (library-command . "csc -X r7rs -R r7rs -I ./srfi -s -J")
     (docker-image . "schemers/chicken"))

    ((name . chicken-interpreter)
     (command . "csi -b -R r7rs -I ./ -I ./srfi -script")
     (library-command . "csc -X r7rs -R r7rs -I ./srfi -s -J")
     (docker-image . "schemers/chicken"))

    ((name . cyclone-compiler)
     (compiler? . #t)
     (command . "cyclone -o srfi-test/r7rs-programs/test -I .")
     (library-command . "cyclone -I .")
     ; Library command so the executable gets run
     ;(library-command . "ls")
     (docker-image . "schemers/cyclone"))

    ((name . cyclone-interpreter)
     (command . "icyc -I . -I ./srfi -s")
     (docker-image . "schemers/cyclone"))

    ((name . foment)
     (command . "foment -I . -I ./srfi"))

    ((name . gambit-compiler)
     (compiler? . #t)
     (command . "gsc -o srfi-test/r7rs-programs/test -exe -nopreload ./ ./srfi/")
     (docker-image . "schemers/gambit"))

    ;; FIXME
    ;; Gambit propably needs proper syntax-rules support
    ;; https://github.com/gambit/gambit/issues/855
    ((name . gambit-interpreter)
     (command . "gsi -:s ./")
     (docker-image . "schemers/gambit"))

    ((name . gauche)
     (command . "gosh -r7 -I ."))

    ((name . gerbil-compiler)
     (compiler? . #t)
     (command . "GERBIL_LOADPATH=. gxc -o srfi-test/r7rs-programs/test --lang r7rs -exe")
     (library-command . "gxc")
     (docker-image . "schemers/gerbil"))

    ((name . gerbil-interpreter)
     (command . "GERBIL_LOADPATH=.:./srfi gxi --lang r7rs")
     ;(library-command . "gxc --lang r7rs")
     (docker-image . "schemers/gerbil"))

    ((name . guile)
     (command . "guile --fresh-auto-compile --r7rs -L . -L ./srfi"))

    ((name . kawa)
     (command . "kawa --r7rs --full-tailcalls -Dkawa.import.path=../../*.sld"))

    #;((name . larceny)
     (command . "larceny -utf8 -r7rs -program"))

    ((name . loko-compiler)
     (compiler? . #t)
     (command . "loko -std=r7rs --compile")
     (library-command . "ls"))

    ; FIXME Temporarily loading needed stuff to run srfi-64
    ((name . mit-scheme)
     (command . "mit-scheme --batch-mode --load ./srfi/8.sld ./srfi/1.sld ./srfi/26.sld ./srfi/28.sld ./srfi/39.sld ./srfi/64.sld"))

    ((name . mosh)
     (command . "mosh --loadpath=."))

    ((name . racket)
     (command . "racket -I r7rs -S . --script"))

    ((name . sagittarius)
     (command . "sash -r7 -L . -L ./srfi"))

    ((name . stklos)
     (command . "stklos -I . -I ./srfi -f"))

    ((name . skint)
     (command . "skint -I ./ --program"))

    ((name . tr7)
     (command . "tr7i"))

    ((name . ypsilon)
     (command . "ypsilon --r7rs --verbose --warning --sitelib=. --top-level-program"))))
