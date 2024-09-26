test-chibi-srfi-64:
	echo "chibi-srfi-64" > test-prefix.txt
	docker run -v ${PWD}:/workdir schemers/chibi sh -c "cd workdir && chibi-scheme -I srfi srfi-test/64.scm "

test-chicken-srfi-64:
	docker run -it -v ${PWD}:/workdir schemers/chicken sh -c "cd workdir && cp srfi/64.sld srfi-64.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-64.sld"
	echo "chicken-srfi-64" > test-prefix.txt
	docker run -v ${PWD}:/workdir schemers/chicken sh -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs srfi-test/64.scm  && ./srfi-test/64"

test-cyclone-srfi-64:
	docker run -it -v ${PWD}:/workdir schemers/cyclone sh -c "cd workdir  && cyclone -I . srfi/64.sld"
	echo "cyclone-srfi-64" > test-prefix.txt
	docker run -v ${PWD}:/workdir schemers/cyclone sh -c "cd workdir && cyclone -I . srfi-test/64.scm  && ./srfi-test/64"

test-gambit-srfi-64:
	echo "gambit-srfi-64" > test-prefix.txt
	docker run -v ${PWD}:/workdir schemers/gambit sh -c "cd workdir && gsc -:r7rs,search=. -exe srfi-test/64.scm "

test-gerbil-srfi-64:
	echo "gerbil-srfi-64" > test-prefix.txt
	docker run -v ${PWD}:/workdir schemers/gerbil sh -c "cd workdir && gxi srfi-test/64.scm "

test-gauche-srfi-64:
	echo "gauche-srfi-64" > test-prefix.txt
	docker run -v ${PWD}:/workdir schemers/gauche sh -c "cd workdir && gosh srfi-test/64.scm "

test-guile-srfi-64:
	echo "guile-srfi-64" > test-prefix.txt
	docker run -v ${PWD}:/workdir schemers/guile sh -c "cd workdir && guile --fresh-auto-compile --r7rs -L . srfi-test/64.scm "

test-kawa-srfi-64:
	echo "kawa-srfi-64" > test-prefix.txt
	docker run -v ${PWD}:/workdir schemers/kawa sh -c "cd workdir && kawa srfi-test/64.scm "

test-loko-srfi-64:
	echo "loko-srfi-64" > test-prefix.txt
	docker run -v ${PWD}:/workdir schemers/loko sh -c "cd workdir && loko -feval -std=r7rs --compile srfi-test/64.scm  && ./srfi-test/64"

test-mit-scheme-srfi-64:
	echo "mit-scheme-srfi-64" > test-prefix.txt
	docker run -v ${PWD}:/workdir schemers/mit-scheme sh -c "cd workdir && mit-scheme --load srfi-test/64.scm "

test-racket-srfi-64:
	echo "racket-srfi-64" > test-prefix.txt
	docker run -v ${PWD}:/workdir schemers/racket sh -c "cd workdir && racket -I r7rs --make -S . --script srfi-test/64.scm "

test-sagittarius-srfi-64:
	echo "sagittarius-srfi-64" > test-prefix.txt
	docker run -v ${PWD}:/workdir schemers/sagittarius sh -c "cd workdir && sash srfi-test/64.scm "

test-stklos-srfi-64:
	echo "stklos-srfi-64" > test-prefix.txt
	docker run -v ${PWD}:/workdir schemers/stklos sh -c "cd workdir && stklos -I . srfi-test/64.scm "

test-skint-srfi-64:
	echo "skint-srfi-64" > test-prefix.txt
	docker run -v ${PWD}:/workdir schemers/skint sh -c "cd workdir && skint --program srfi-test/64.scm "

test-tr7-srfi-64:
	echo "tr7-srfi-64" > test-prefix.txt
	docker run -v ${PWD}:/workdir schemers/tr7 sh -c "cd workdir && tr7i srfi-test/64.scm "

clean:
	find . -name "*.c" -delete
	find . -name "*.o" -delete
	find . -name "*.so" -delete
	find . -name "*.dep" -delete
	find . -name "*.zo" -delete
	find . -name "*.meta" -delete
	find . -name "compiled" -delete
	find . -name "srfi.*.sld" -delete
	find . -name "srfi.*.scm" -delete
	find . -name "srfi-*.sld" -delete
	find . -name "srfi.*.import.scm" -delete
	find . -name "srfi-*.import.scm" -delete
	find . -name "*.log" -delete
	find . -name "test-prefix.txt" -delete
