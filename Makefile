test-chibi-srfi-:
	docker run -it -v ${PWD}:/workdir:z schemers/chibi bash -c "cd workdir && chibi-scheme -I srfi srfi-test/.scm"


test-chicken-srfi-:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs srfi-test/.scm"


test-cyclone-srfi-:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi-test/.scm"


test-gambit-srfi-:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsc -:r7rs,search=. -exe srfi-test/.scm"


test-gerbil-srfi-:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxi srfi-test/.scm"


test-gauche-srfi-:
	docker run -it -v ${PWD}:/workdir:z schemers/gauche bash -c "cd workdir && gosh srfi-test/.scm"


test-guile-srfi-:
	docker run -it -v ${PWD}:/workdir:z schemers/guile bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . srfi-test/.scm"


test-kawa-srfi-:
	docker run -it -v ${PWD}:/workdir:z schemers/kawa bash -c "cd workdir && kawa srfi-test/.scm"


test-loko-srfi-:
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && loko -feval -std=r7rs --compile srfi-test/.scm"


test-mit-scheme-srfi-:
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme bash -c "cd workdir && mit-scheme --load srfi-test/.scm"


test-racket-srfi-:
	docker run -it -v ${PWD}:/workdir:z schemers/racket bash -c "cd workdir && racket -I r7rs --make -S . --script srfi-test/.scm"


test-sagittarius-srfi-:
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius bash -c "cd workdir && sash srfi-test/.scm"


test-stklos-srfi-:
	docker run -it -v ${PWD}:/workdir:z schemers/stklos bash -c "cd workdir && stklos -I . srfi-test/.scm"


test-skint-srfi-:
	docker run -it -v ${PWD}:/workdir:z schemers/skint bash -c "cd workdir && skint --program srfi-test/.scm"


test-tr7-srfi-:
	docker run -it -v ${PWD}:/workdir:z schemers/tr7 bash -c "cd workdir && tr7i srfi-test/.scm"


clean:
	rm -rf *.so
	rm -rf "*.c"
	rm -rf "*.o"
	rm -rf "*.so"
	rm -rf "*.dep"
	rm -rf "*.zo"
	rm -rf "*.meta"
	rm -rf "compiled"
	rm -rf "srfi.*.sld"
	rm -rf "srfi.*.scm"
	rm -rf "srfi-*.sld"
	rm -rf "srfi.*.import.scm"
	rm -rf "srfi-*.import.scm"
	rm -rf "*.log"
	rm -rf "test-prefix.txt"

