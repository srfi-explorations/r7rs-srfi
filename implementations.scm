; If compiler then somekind of library command is mandatory, use "ls" if not needed actually

(define implementations

  '(((name . chibi)
     (command . "chibi-scheme -I ."))

    ((name . chibi-head)
     (command . "chibi-scheme -I .")
     (docker-image . "schemers/chibi:head"))

    ((name . chicken-compiler)
     (compiler? . #t)
     (command . "csc -X r7rs -R r7rs -I ./srfi -o test")
     (library-command . "csc -X r7rs -R r7rs -I ./srfi -s -J")
     (docker-image . "schemers/chicken"))

    ((name . chicken-compiler-head)
     (compiler? . #t)
     (command . "csc -X r7rs -R r7rs -I ./srfi -o test")
     (library-command . "csc -X r7rs -R r7rs -I ./srfi -s -J")
     (docker-image . "schemers/chicken:head"))

    ((name . chicken-interpreter)
     (command . "csi -b -R r7rs -I ./ -I ./srfi -script")
     (library-command . "csc -X r7rs -R r7rs -I ./srfi -s -J")
     (docker-image . "schemers/chicken"))

    ((name . chicken-interpreter-head)
     (command . "csi -b -R r7rs -I ./ -I ./srfi -script")
     (library-command . "csc -X r7rs -R r7rs -I ./srfi -s -J")
     (docker-image . "schemers/chicken:head"))

    ((name . cyclone-compiler)
     (compiler? . #t)
     (command . "cyclone -o ./test -I .")
     (library-command . "cyclone -I .")
     (docker-image . "schemers/cyclone"))

    ((name . cyclone-compiler-head)
     (compiler? . #t)
     (command . "cyclone -o ./test -I .")
     (library-command . "cyclone -I .")
     (docker-image . "schemers/cyclone:head"))

    ((name . cyclone-interpreter)
     (command . "icyc -I . -I ./srfi -s")
     (library-command . "cyclone -I .")
     (docker-image . "schemers/cyclone"))

    ((name . cyclone-interpreter-head)
     (command . "icyc -I . -I ./srfi -s")
     (library-command . "cyclone -I .")
     (docker-image . "schemers/cyclone:head"))

    ((name . foment)
     (command . "foment -X .sld -I .")
     (docker-image . "schemers/foment"))

    ((name . foment-head)
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
     (docker-image . "schemers/gambit"))

    ((name . gambit-compiler-head)
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
     (docker-image . "schemers/gambit"))

    ((name . gambit-interpreter-head)
     (command . "gsi -:search=./")
     (docker-image . "schemers/gambit:head"))

    ((name . gauche)
     (command . "gosh -r7 -I ."))

    ((name . gauche-head)
     (command . "gosh -r7 -I .")
     (docker-image . "schemers/gauche:head"))

    ((name . gerbil-compiler)
     (compiler? . #t)
     (command . "GERBIL_LOADPATH=. gxc -o ./test --lang r7rs -exe")
     (library-command . "gxc")
     (docker-image . "schemers/gerbil"))

    ((name . gerbil-compiler-head)
     (compiler? . #t)
     (command . "GERBIL_LOADPATH=. gxc -o ./test --lang r7rs -exe")
     (library-command . "gxc")
     (docker-image . "schemers/gerbil:head"))

    ((name . gerbil-interpreter)
     (command . "GERBIL_LOADPATH=.:./srfi gxi --lang r7rs")
     ;(library-command . "gxc --lang r7rs")
     (docker-image . "schemers/gerbil"))

    ((name . gerbil-interpreter-head)
     (command . "GERBIL_LOADPATH=.:./srfi gxi --lang r7rs")
     ;(library-command . "gxc --lang r7rs")
     (docker-image . "schemers/gerbil:head"))

    ((name . guile)
     (command . "guile --fresh-auto-compile --r7rs -L . -L ./srfi")
     (docker-image . "schemers/guile"))

    ((name . guile-head)
     (command . "guile --fresh-auto-compile --r7rs -L . -L ./srfi")
     (docker-image . "schemers/guile:head"))

    ((name . kawa)
     (command . "kawa --r7rs --full-tailcalls -Dkawa.import.path=../../*.sld:*.sld")
     (docker-image . "schemers/kawa"))

    ((name . kawa-head)
     (command . "kawa --r7rs --full-tailcalls -Dkawa.import.path=../../*.sld:*.sld")
     (docker-image . "schemers/kawa:head"))

    ((name . larceny)
     (command . "larceny -utf8 -r7strict -I . -program"))

    ((name . larceny-head)
     (command . "larceny -utf8 -r7strict -I . -program")
     (docker-image . "schemers/larceny:head"))

    ((name . loko-compiler)
     (compiler? . #t)
     (command . "loko -std=r7rs --compile")
     (library-command . "ls")
     (docker-image . "schemers/loko"))

    ((name . loko-compiler-head)
     (compiler? . #t)
     (command . "loko -std=r7rs --compile")
     (library-command . "ls")
     (docker-image . "schemers/loko:head"))

    ; FIXME Temporarily loading needed stuff to run srfi-64
    ((name . mit-scheme)
     (command . "mit-scheme --batch-mode --load ./srfi/8.sld ./srfi/1.sld ./srfi/38.sld ./srfi/39.mit.sld ./srfi/48.sld ./srfi/64.sld"))

    ((name . mit-scheme-head)
     (command . "mit-scheme --batch-mode --load ./srfi/8.sld ./srfi/1.sld ./srfi/38.sld ./srfi/39.mit.sld ./srfi/48.sld ./srfi/64.sld")
     (docker-image . "schemers/mit-scheme:head"))

    ((name . mosh)
     (command . "mosh --loadpath=."))

    ((name . mosh-head)
     (command . "mosh --loadpath=.")
     (docker-image . "schemers/mosh:head"))

    ((name . racket)
     (command . "racket -I r7rs -S . --script"))

    ((name . racket-head)
     (command . "racket -I r7rs -S . --script")
     (docker-image . "schemers/racket:head"))

    ((name . sagittarius)
     (command . "sash -r7 -L . -L ./srfi"))

    ((name . sagittarius-head)
     (command . "sash -r7 -L . -L ./srfi")
     (docker-image . "schemers/sagittarius:head"))

    ((name . stklos)
     (command . "stklos --debug -I . -I ./srfi -f")
     (docker-image . "schemers/stklos"))

    ((name . stklos-head)
     (command . "stklos --debug -I . -I ./srfi -f")
     (docker-image . "schemers/stklos:head"))

    ((name . skint)
     (command . "skint -I ./ --script"))

    ((name . skint)
     (command . "skint -I ./ --script")
     (docker-image . "schemers/skint:head"))

    ((name . tr7)
     (command . "TR7_LIB_PATH=${TR7_LIB_PATH}:${PWD}/srfi tr7i")
     (docker-image . "schemers/tr7"))

    ((name . tr7)
     (command . "TR7_LIB_PATH=${TR7_LIB_PATH}:${PWD}/srfi tr7i")
     (docker-image . "schemers/tr7:head"))

    ((name . ypsilon)
     (command . "ypsilon --r7rs --verbose --warning --sitelib=. --top-level-program"))

    ((name . ypsilon-head)
     (command . "ypsilon --r7rs --verbose --warning --sitelib=. --top-level-program")
     (docker-image . "schemers/ypsilon:head"))))
