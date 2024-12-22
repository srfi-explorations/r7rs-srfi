(define implementations

  '(((name . chibi)
     (command . "chibi-scheme -I ."))

    ((name . chicken-compiler)
     (command . "csc -include-path ./srfi -X r7rs -R r7rs")
     (library-command . "csc -include-path ./srfi -X r7rs -R r7rs -s -J")
     (docker-image . "schemers/chicken"))

    ((name . chicken-interpreter)
     (command . "csi")
     (docker-image . "schemers/chicken"))

    ((name . cyclone)
     (command . "cyclone -I .")
     (library-command . "cyclone -I ."))

    ((name . foment)
     (command . "foment -I . -I ./srfi"))

    ;; FIXME
    ;; Gambit compiler needs proper syntax-rules support https://github.com/gambit/gambit/issues/855
    ((name . gambit-compiler)
     (command . "gsc -:search=.,s -debug -warnings -exe ./  -nopreload")
     (library-command . "gsc -:search=.,s -debug -warnings -obj")
     (docker-image . "schemers/gambit"))

    ((name . gambit-interpreter)
     (command . "gsi")
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
     (command . "guile --fresh-auto-compile --r7rs -L ."))

    ((name . kawa)
     (command . "kawa --r7rs -Dkawa.import.path=../../*.sld"))

    ((name . larceny)
     (command . "larceny -r7 -I ."))

    ((name . loko)
     (command . "loko -std=r7rs --compile")
     ; Library command so the executable gets run
     (library-command . "ls"))

    ; FIXME Temporarily loading needed stuff to run srfi-64
    ((name . mit-scheme)
     (command . "mit-scheme --batch-mode --load ./srfi/26.sld ./srfi/28.sld ./srfi/64.sld"))

    ((name . mosh)
     (command . "mosh --loadpath=."))

    ((name . racket)
     (command . "racket -I r7rs -S . --script"))

    ((name . sagittarius)
     (command . "sash -r7 -L . -L ./srfi"))

    ((name . stklos)
     (command . "stklos -I . -I ./srfi -f"))

    ((name . skint)
     (command . "skint -I ./"))

    ((name . tr7)
     (command . "tr7i"))

    ((name . ypsilon)
     (command . "ypsilon --r7rs --loadpath=. --loadpath=./srfi"))))
