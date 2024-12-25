(define implementations

  '(((name . chibi)
     (command . "chibi-scheme -I ."))

    ((name . chicken-compiler)
     (command . "csc -include-path ./srfi -X r7rs -R r7rs")
     (library-command . "csc -include-path ./srfi -X r7rs -R r7rs -s -J")
     (docker-image . "schemers/chicken"))

    ((name . chicken-interpreter)
     (command . "csi -b -R r7rs -I ./ -I ./srfi -script")
     (docker-image . "schemers/chicken"))

    ((name . cyclone-compiler)
     (command . "cyclone -I .")
     (library-command . "cyclone -I .")
     ; Library command so the executable gets run
     ;(library-command . "ls")
     (docker-image . "schemers/cyclone"))

    ((name . cyclone-interpreter)
     (command . "icyc -I . -I ./srfi -s")
     (docker-image . "schemers/cyclone"))

    ((name . foment)
     (command . "foment -I . -I ./srfi"))

    ;; FIXME
    ;; Gambit propably needs proper syntax-rules support
    ;; https://github.com/gambit/gambit/issues/855
    ((name . gambit-compiler)
     (command . "gsc -:search=.,s -debug -warnings -exe ./  -nopreload")
     (library-command . "gsc -:search=.,s -debug -warnings -obj")
     (docker-image . "schemers/gambit"))

    ;; FIXME
    ;; Gambit propably needs proper syntax-rules support
    ;; https://github.com/gambit/gambit/issues/855
    ((name . gambit-interpreter)
     (command . "gsi -:s ./ ./srfi/")
     (docker-image . "schemers/gambit"))

    ((name . gauche)
     (command . "gosh -r7 -I ."))

    ((name . gerbil-compiler)
     (command . "gxc --lang r7rs")
     (library-command . "gxc -O")
     (docker-image . "schemers/gerbil"))

    ((name . gerbil-interpreter)
     (command . "gxi --lang r7rs")
     (docker-image . "schemers/gerbil"))

    ((name . guile)
     (command . "guile --fresh-auto-compile --r7rs -L . -L ./srfi"))

    ((name . kawa)
     (command . "kawa --r7rs -Dkawa.import.path=../../*.sld"))

    #;((name . larceny)
     (command . "larceny -utf8 -r7rs -program"))

    ((name . loko)
     (command . "loko -std=r7rs --compile")
     ; Library command so the executable gets run
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
