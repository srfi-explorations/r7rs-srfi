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
     (command . "cyclone -o ./test -I .")
     (library-command . "cyclone -I .")
     ; Library command so the executable gets run
     ;(library-command . "ls")
     (docker-image . "schemers/cyclone:head"))

    ((name . cyclone-interpreter)
     (command . "icyc -I . -I ./srfi -s")
     (docker-image . "schemers/cyclone:head"))

    ((name . foment)
     (command . "foment -X .sld -I .")
     (docker-image . "schemers/foment:head"))

    ;; FIXME
    ;; Gambit propably needs proper syntax-rules support
    ;; https://github.com/gambit/gambit/issues/855
    ((name . gambit-compiler)
     (compiler? . #t)
     (command . "gsc -o ./test -exe -nopreload ./")
     ;(library-command . "gsc ./")
     (library-command . "ls")
     (docker-image . "schemers/gambit:head"))

    ;; FIXME
    ;; Gambit propably needs proper syntax-rules support
    ;; https://github.com/gambit/gambit/issues/855
    ((name . gambit-interpreter)
     (command . "gsi -:search=./")
     (docker-image . "schemers/gambit:head"))

    ((name . gauche)
     (command . "gosh -r7 -I ."))

    ((name . gerbil-compiler)
     (compiler? . #t)
     (command . "GERBIL_LOADPATH=. gxc -o ./test --lang r7rs -exe")
     (library-command . "gxc")
     (docker-image . "schemers/gerbil"))

    ((name . gerbil-interpreter)
     (command . "GERBIL_LOADPATH=.:./srfi gxi --lang r7rs")
     ;(library-command . "gxc --lang r7rs")
     (docker-image . "schemers/gerbil"))

    ((name . guile)
     (command . "guile --fresh-auto-compile --r7rs -L . -L ./srfi"))

    ((name . kawa)
     (command . "kawa --r7rs --full-tailcalls -Dkawa.import.path=../../*.sld:*.sld"))

    ((name . larceny)
     (command . "larceny -utf8 -r7strict -I . -program"))

    ((name . loko-compiler)
     (compiler? . #t)
     (command . "loko -std=r7rs --compile")
     (library-command . "ls")
     (docker-image . "schemers/loko"))

    ; FIXME Temporarily loading needed stuff to run srfi-64
    ((name . mit-scheme)
     (command . "mit-scheme --batch-mode --load ./srfi/8.sld ./srfi/1.sld ./srfi/38.sld ./srfi/39.mit.sld ./srfi/48.sld ./srfi/64.sld"))

    ((name . mosh)
     (command . "mosh --loadpath=."))

    ((name . racket)
     (command . "racket -I r7rs -S . --script"))

    ((name . sagittarius)
     (command . "sash -r7 -L . -L ./srfi"))

    ((name . stklos)
     (command . "stklos --debug -I . -I ./srfi -f")
     (docker-image . "schemers/stklos:head"))

    ((name . skint)
     (command . "skint -I ./ --script"))

    ((name . tr7)
     (command . "TR7_LIB_PATH=${TR7_LIB_PATH}:${PWD}/srfi tr7i")
     (docker-image . "schemers/tr7:head"))

    ((name . ypsilon)
     (command . "ypsilon --r7rs --verbose --warning --sitelib=. --top-level-program"))))
