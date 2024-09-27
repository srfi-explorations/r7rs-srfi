test-chibi-srfi-64:
	docker run -it -v ${PWD}:/workdir:z schemers/chibi bash -c "cd workdir && chibi-scheme -I srfi srfi-test/64.scm"

test-chicken-srfi-64:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs srfi-test/64.scm"

test-cyclone-srfi-64:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi-test/64.scm"

test-gambit-srfi-64:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsc -:r7rs,search=. -exe srfi-test/64.scm"

test-gerbil-srfi-64:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxi srfi-test/64.scm"

test-gauche-srfi-64:
	docker run -it -v ${PWD}:/workdir:z schemers/gauche bash -c "cd workdir && gosh srfi-test/64.scm"

test-guile-srfi-64:
	docker run -it -v ${PWD}:/workdir:z schemers/guile bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . srfi-test/64.scm"

test-kawa-srfi-64:
	docker run -it -v ${PWD}:/workdir:z schemers/kawa bash -c "cd workdir && kawa srfi-test/64.scm"

test-loko-srfi-64:
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && loko -feval -std=r7rs --compile srfi-test/64.scm"

test-mit-scheme-srfi-64:
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme bash -c "cd workdir && mit-scheme --load srfi-test/64.scm"

test-racket-srfi-64:
	docker run -it -v ${PWD}:/workdir:z schemers/racket bash -c "cd workdir && racket -I r7rs --make -S . --script srfi-test/64.scm"

test-sagittarius-srfi-64:
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius bash -c "cd workdir && sash srfi-test/64.scm"

test-stklos-srfi-64:
	docker run -it -v ${PWD}:/workdir:z schemers/stklos bash -c "cd workdir && stklos -I . srfi-test/64.scm"

test-skint-srfi-64:
	docker run -it -v ${PWD}:/workdir:z schemers/skint bash -c "cd workdir && skint --program srfi-test/64.scm"

test-tr7-srfi-64:
	docker run -it -v ${PWD}:/workdir:z schemers/tr7 bash -c "cd workdir && tr7i srfi-test/64.scm"

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
