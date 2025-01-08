1-chibi:
	
	chibi-scheme -I . srfi-test/r7rs-programs/1.scm

1-chibi-library:
	

1-chibi-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:latest bash -c "cd workdir && chibi-scheme -I . srfi-test/r7rs-programs/1.scm"

1-chibi-library-docker:
	

1-chibi-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:latest bash -c "cd workdir && chibi-scheme -I . srfi-test/r7rs-programs/1.scm"

1-chibi-library-docker-head:
	

1-chicken-compiler:
	cp srfi/srfi-1.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-1.scm
	csc -X r7rs -R r7rs -I ./srfi -o test srfi-test/r7rs-programs/1.scm && ./test

1-chicken-compiler-library:
	cp srfi/srfi-1.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-1.scm

1-chicken-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-1.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-1.scm"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csc -X r7rs -R r7rs -I ./srfi -o test srfi-test/r7rs-programs/1.scm && ./test"

1-chicken-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-1.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-1.scm" 

1-chicken-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-1.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-1.scm"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csc -X r7rs -R r7rs -I ./srfi -o test srfi-test/r7rs-programs/1.scm && ./test"

1-chicken-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-1.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-1.scm" 

1-chicken-interpreter:
	cp srfi/srfi-1.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-1.scm
	csi -b -R r7rs -I ./ -I ./srfi -script srfi-test/r7rs-programs/1.scm

1-chicken-interpreter-library:
	cp srfi/srfi-1.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-1.scm

1-chicken-interpreter-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-1.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-1.scm"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csi -b -R r7rs -I ./ -I ./srfi -script srfi-test/r7rs-programs/1.scm"

1-chicken-interpreter-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-1.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-1.scm" 

1-chicken-interpreter-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-1.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-1.scm"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csi -b -R r7rs -I ./ -I ./srfi -script srfi-test/r7rs-programs/1.scm"

1-chicken-interpreter-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-1.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-1.scm" 

1-cyclone-compiler:
	cyclone -I . srfi/1.sld
	cyclone -o ./test -I . srfi-test/r7rs-programs/1.scm && mv srfi-test/r7rs-programs/1 ./test && ./test

1-cyclone-compiler-library:
	cyclone -I . srfi/1.sld

1-cyclone-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/1.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -o ./test -I . srfi-test/r7rs-programs/1.scm && mv srfi-test/r7rs-programs/1 ./test && ./test"

1-cyclone-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/1.sld" 

1-cyclone-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/1.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -o ./test -I . srfi-test/r7rs-programs/1.scm && mv srfi-test/r7rs-programs/1 ./test && ./test"

1-cyclone-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/1.sld" 

1-cyclone-interpreter:
	cyclone -I . srfi/1.sld
	icyc -I . -I ./srfi -s srfi-test/r7rs-programs/1.scm

1-cyclone-interpreter-library:
	cyclone -I . srfi/1.sld

1-cyclone-interpreter-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/1.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && icyc -I . -I ./srfi -s srfi-test/r7rs-programs/1.scm"

1-cyclone-interpreter-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/1.sld" 

1-cyclone-interpreter-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/1.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && icyc -I . -I ./srfi -s srfi-test/r7rs-programs/1.scm"

1-cyclone-interpreter-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/1.sld" 

1-foment:
	
	foment -X .sld -I ${PWD} srfi-test/r7rs-programs/1.scm

1-foment-library:
	

1-foment-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment bash -c "cd workdir && foment -X .sld -I ${PWD} srfi-test/r7rs-programs/1.scm"

1-foment-library-docker:
	

1-foment-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment bash -c "cd workdir && foment -X .sld -I ${PWD} srfi-test/r7rs-programs/1.scm"

1-foment-library-docker-head:
	

1-gambit-compiler:
	ls srfi/1.sld
	gsc -o ./test -exe -nopreload ./ srfi-test/r7rs-programs/1.scm && ./test

1-gambit-compiler-library:
	ls srfi/1.sld

1-gambit-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && ls srfi/1.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsc -o ./test -exe -nopreload ./ srfi-test/r7rs-programs/1.scm && ./test"

1-gambit-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && ls srfi/1.sld" 

1-gambit-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && ls srfi/1.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsc -o ./test -exe -nopreload ./ srfi-test/r7rs-programs/1.scm && ./test"

1-gambit-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && ls srfi/1.sld" 

1-gambit-interpreter:
	
	gsi -:search=./ srfi-test/r7rs-programs/1.scm

1-gambit-interpreter-library:
	

1-gambit-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsi -:search=./ srfi-test/r7rs-programs/1.scm"

1-gambit-interpreter-library-docker:
	

1-gambit-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsi -:search=./ srfi-test/r7rs-programs/1.scm"

1-gambit-interpreter-library-docker-head:
	

1-gauche:
	
	gosh -r7 -I . srfi-test/r7rs-programs/1.scm

1-gauche-library:
	

1-gauche-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:latest bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/1.scm"

1-gauche-library-docker:
	

1-gauche-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:latest bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/1.scm"

1-gauche-library-docker-head:
	

1-gerbil-compiler:
	gxc srfi/1.sld
	GERBIL_LOADPATH=. gxc -o ./test --lang r7rs -exe srfi-test/r7rs-programs/1.scm && ./test

1-gerbil-compiler-library:
	gxc srfi/1.sld

1-gerbil-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc srfi/1.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && GERBIL_LOADPATH=. gxc -o ./test --lang r7rs -exe srfi-test/r7rs-programs/1.scm && ./test"

1-gerbil-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc srfi/1.sld" 

1-gerbil-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc srfi/1.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && GERBIL_LOADPATH=. gxc -o ./test --lang r7rs -exe srfi-test/r7rs-programs/1.scm && ./test"

1-gerbil-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc srfi/1.sld" 

1-gerbil-interpreter:
	
	GERBIL_LOADPATH=.:./srfi gxi --lang r7rs srfi-test/r7rs-programs/1.scm

1-gerbil-interpreter-library:
	

1-gerbil-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && GERBIL_LOADPATH=.:./srfi gxi --lang r7rs srfi-test/r7rs-programs/1.scm"

1-gerbil-interpreter-library-docker:
	

1-gerbil-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && GERBIL_LOADPATH=.:./srfi gxi --lang r7rs srfi-test/r7rs-programs/1.scm"

1-gerbil-interpreter-library-docker-head:
	

1-guile:
	
	guile --fresh-auto-compile --r7rs -L . -L ./srfi srfi-test/r7rs-programs/1.scm

1-guile-library:
	

1-guile-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:head bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . -L ./srfi srfi-test/r7rs-programs/1.scm"

1-guile-library-docker:
	

1-guile-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:head bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . -L ./srfi srfi-test/r7rs-programs/1.scm"

1-guile-library-docker-head:
	

1-kawa:
	
	kawa --r7rs --full-tailcalls -Dkawa.import.path=../../*.sld:*.sld srfi-test/r7rs-programs/1.scm

1-kawa-library:
	

1-kawa-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa bash -c "cd workdir && kawa --r7rs --full-tailcalls -Dkawa.import.path=../../*.sld:*.sld srfi-test/r7rs-programs/1.scm"

1-kawa-library-docker:
	

1-kawa-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa bash -c "cd workdir && kawa --r7rs --full-tailcalls -Dkawa.import.path=../../*.sld:*.sld srfi-test/r7rs-programs/1.scm"

1-kawa-library-docker-head:
	

1-larceny:
	
	larceny -utf8 -r7strict -I . -program srfi-test/r7rs-programs/1.scm

1-larceny-library:
	

1-larceny-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/larceny:latest bash -c "cd workdir && larceny -utf8 -r7strict -I . -program srfi-test/r7rs-programs/1.scm"

1-larceny-library-docker:
	

1-larceny-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/larceny:latest bash -c "cd workdir && larceny -utf8 -r7strict -I . -program srfi-test/r7rs-programs/1.scm"

1-larceny-library-docker-head:
	

1-loko-compiler:
	ls srfi/1.sld
	loko -std=r7rs --compile srfi-test/r7rs-programs/1.scm && mv srfi-test/r7rs-programs/1 ./test && ./test

1-loko-compiler-library:
	ls srfi/1.sld

1-loko-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && ls srfi/1.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/1.scm && mv srfi-test/r7rs-programs/1 ./test && ./test"

1-loko-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && ls srfi/1.sld" 

1-loko-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && ls srfi/1.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/1.scm && mv srfi-test/r7rs-programs/1 ./test && ./test"

1-loko-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && ls srfi/1.sld" 

1-mit-scheme:
	
	mit-scheme --batch-mode --load ./srfi/8.sld ./srfi/1.sld ./srfi/38.sld ./srfi/39.mit.sld ./srfi/48.sld ./srfi/64.sld srfi-test/r7rs-programs/1.scm

1-mit-scheme-library:
	

1-mit-scheme-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --batch-mode --load ./srfi/8.sld ./srfi/1.sld ./srfi/38.sld ./srfi/39.mit.sld ./srfi/48.sld ./srfi/64.sld srfi-test/r7rs-programs/1.scm"

1-mit-scheme-library-docker:
	

1-mit-scheme-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --batch-mode --load ./srfi/8.sld ./srfi/1.sld ./srfi/38.sld ./srfi/39.mit.sld ./srfi/48.sld ./srfi/64.sld srfi-test/r7rs-programs/1.scm"

1-mit-scheme-library-docker-head:
	

1-mosh:
	
	mosh --loadpath=. srfi-test/r7rs-programs/1.scm

1-mosh-library:
	

1-mosh-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mosh:latest bash -c "cd workdir && mosh --loadpath=. srfi-test/r7rs-programs/1.scm"

1-mosh-library-docker:
	

1-mosh-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mosh:latest bash -c "cd workdir && mosh --loadpath=. srfi-test/r7rs-programs/1.scm"

1-mosh-library-docker-head:
	

1-racket:
	
	racket -I r7rs -S . --script srfi-test/r7rs-programs/1.scm

1-racket-library:
	

1-racket-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:latest bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/1.scm"

1-racket-library-docker:
	

1-racket-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:latest bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/1.scm"

1-racket-library-docker-head:
	

1-sagittarius:
	
	sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/1.scm

1-sagittarius-library:
	

1-sagittarius-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:latest bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/1.scm"

1-sagittarius-library-docker:
	

1-sagittarius-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:latest bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/1.scm"

1-sagittarius-library-docker-head:
	

1-stklos:
	
	stklos --debug -I . -I ./srfi -f srfi-test/r7rs-programs/1.scm

1-stklos-library:
	

1-stklos-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:head bash -c "cd workdir && stklos --debug -I . -I ./srfi -f srfi-test/r7rs-programs/1.scm"

1-stklos-library-docker:
	

1-stklos-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:head bash -c "cd workdir && stklos --debug -I . -I ./srfi -f srfi-test/r7rs-programs/1.scm"

1-stklos-library-docker-head:
	

1-skint:
	
	skint -I ./ --script srfi-test/r7rs-programs/1.scm

1-skint-library:
	

1-skint-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:latest bash -c "cd workdir && skint -I ./ --script srfi-test/r7rs-programs/1.scm"

1-skint-library-docker:
	

1-skint-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:latest bash -c "cd workdir && skint -I ./ --script srfi-test/r7rs-programs/1.scm"

1-skint-library-docker-head:
	

1-tr7:
	
	TR7_LIB_PATH=${TR7_LIB_PATH}:${PWD}/srfi tr7i srfi-test/r7rs-programs/1.scm

1-tr7-library:
	

1-tr7-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:head bash -c "cd workdir && TR7_LIB_PATH=${TR7_LIB_PATH}:${PWD}/srfi tr7i srfi-test/r7rs-programs/1.scm"

1-tr7-library-docker:
	

1-tr7-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:head bash -c "cd workdir && TR7_LIB_PATH=${TR7_LIB_PATH}:${PWD}/srfi tr7i srfi-test/r7rs-programs/1.scm"

1-tr7-library-docker-head:
	

1-ypsilon:
	
	ypsilon --r7rs --verbose --warning --sitelib=. --top-level-program srfi-test/r7rs-programs/1.scm

1-ypsilon-library:
	

1-ypsilon-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/ypsilon:latest bash -c "cd workdir && ypsilon --r7rs --verbose --warning --sitelib=. --top-level-program srfi-test/r7rs-programs/1.scm"

1-ypsilon-library-docker:
	

1-ypsilon-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/ypsilon:latest bash -c "cd workdir && ypsilon --r7rs --verbose --warning --sitelib=. --top-level-program srfi-test/r7rs-programs/1.scm"

1-ypsilon-library-docker-head:
	

8-chibi:
	
	chibi-scheme -I . srfi-test/r7rs-programs/8.scm

8-chibi-library:
	

8-chibi-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:latest bash -c "cd workdir && chibi-scheme -I . srfi-test/r7rs-programs/8.scm"

8-chibi-library-docker:
	

8-chibi-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:latest bash -c "cd workdir && chibi-scheme -I . srfi-test/r7rs-programs/8.scm"

8-chibi-library-docker-head:
	

8-chicken-compiler:
	cp srfi/srfi-8.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-8.scm
	csc -X r7rs -R r7rs -I ./srfi -o test srfi-test/r7rs-programs/8.scm && ./test

8-chicken-compiler-library:
	cp srfi/srfi-8.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-8.scm

8-chicken-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-8.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-8.scm"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csc -X r7rs -R r7rs -I ./srfi -o test srfi-test/r7rs-programs/8.scm && ./test"

8-chicken-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-8.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-8.scm" 

8-chicken-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-8.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-8.scm"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csc -X r7rs -R r7rs -I ./srfi -o test srfi-test/r7rs-programs/8.scm && ./test"

8-chicken-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-8.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-8.scm" 

8-chicken-interpreter:
	cp srfi/srfi-8.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-8.scm
	csi -b -R r7rs -I ./ -I ./srfi -script srfi-test/r7rs-programs/8.scm

8-chicken-interpreter-library:
	cp srfi/srfi-8.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-8.scm

8-chicken-interpreter-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-8.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-8.scm"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csi -b -R r7rs -I ./ -I ./srfi -script srfi-test/r7rs-programs/8.scm"

8-chicken-interpreter-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-8.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-8.scm" 

8-chicken-interpreter-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-8.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-8.scm"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csi -b -R r7rs -I ./ -I ./srfi -script srfi-test/r7rs-programs/8.scm"

8-chicken-interpreter-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-8.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-8.scm" 

8-cyclone-compiler:
	cyclone -I . srfi/8.sld
	cyclone -o ./test -I . srfi-test/r7rs-programs/8.scm && mv srfi-test/r7rs-programs/8 ./test && ./test

8-cyclone-compiler-library:
	cyclone -I . srfi/8.sld

8-cyclone-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/8.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -o ./test -I . srfi-test/r7rs-programs/8.scm && mv srfi-test/r7rs-programs/8 ./test && ./test"

8-cyclone-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/8.sld" 

8-cyclone-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/8.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -o ./test -I . srfi-test/r7rs-programs/8.scm && mv srfi-test/r7rs-programs/8 ./test && ./test"

8-cyclone-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/8.sld" 

8-cyclone-interpreter:
	cyclone -I . srfi/8.sld
	icyc -I . -I ./srfi -s srfi-test/r7rs-programs/8.scm

8-cyclone-interpreter-library:
	cyclone -I . srfi/8.sld

8-cyclone-interpreter-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/8.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && icyc -I . -I ./srfi -s srfi-test/r7rs-programs/8.scm"

8-cyclone-interpreter-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/8.sld" 

8-cyclone-interpreter-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/8.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && icyc -I . -I ./srfi -s srfi-test/r7rs-programs/8.scm"

8-cyclone-interpreter-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/8.sld" 

8-foment:
	
	foment -X .sld -I ${PWD} srfi-test/r7rs-programs/8.scm

8-foment-library:
	

8-foment-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment bash -c "cd workdir && foment -X .sld -I ${PWD} srfi-test/r7rs-programs/8.scm"

8-foment-library-docker:
	

8-foment-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment bash -c "cd workdir && foment -X .sld -I ${PWD} srfi-test/r7rs-programs/8.scm"

8-foment-library-docker-head:
	

8-gambit-compiler:
	ls srfi/8.sld
	gsc -o ./test -exe -nopreload ./ srfi-test/r7rs-programs/8.scm && ./test

8-gambit-compiler-library:
	ls srfi/8.sld

8-gambit-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && ls srfi/8.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsc -o ./test -exe -nopreload ./ srfi-test/r7rs-programs/8.scm && ./test"

8-gambit-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && ls srfi/8.sld" 

8-gambit-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && ls srfi/8.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsc -o ./test -exe -nopreload ./ srfi-test/r7rs-programs/8.scm && ./test"

8-gambit-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && ls srfi/8.sld" 

8-gambit-interpreter:
	
	gsi -:search=./ srfi-test/r7rs-programs/8.scm

8-gambit-interpreter-library:
	

8-gambit-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsi -:search=./ srfi-test/r7rs-programs/8.scm"

8-gambit-interpreter-library-docker:
	

8-gambit-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsi -:search=./ srfi-test/r7rs-programs/8.scm"

8-gambit-interpreter-library-docker-head:
	

8-gauche:
	
	gosh -r7 -I . srfi-test/r7rs-programs/8.scm

8-gauche-library:
	

8-gauche-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:latest bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/8.scm"

8-gauche-library-docker:
	

8-gauche-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:latest bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/8.scm"

8-gauche-library-docker-head:
	

8-gerbil-compiler:
	gxc srfi/8.sld
	GERBIL_LOADPATH=. gxc -o ./test --lang r7rs -exe srfi-test/r7rs-programs/8.scm && ./test

8-gerbil-compiler-library:
	gxc srfi/8.sld

8-gerbil-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc srfi/8.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && GERBIL_LOADPATH=. gxc -o ./test --lang r7rs -exe srfi-test/r7rs-programs/8.scm && ./test"

8-gerbil-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc srfi/8.sld" 

8-gerbil-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc srfi/8.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && GERBIL_LOADPATH=. gxc -o ./test --lang r7rs -exe srfi-test/r7rs-programs/8.scm && ./test"

8-gerbil-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc srfi/8.sld" 

8-gerbil-interpreter:
	
	GERBIL_LOADPATH=.:./srfi gxi --lang r7rs srfi-test/r7rs-programs/8.scm

8-gerbil-interpreter-library:
	

8-gerbil-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && GERBIL_LOADPATH=.:./srfi gxi --lang r7rs srfi-test/r7rs-programs/8.scm"

8-gerbil-interpreter-library-docker:
	

8-gerbil-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && GERBIL_LOADPATH=.:./srfi gxi --lang r7rs srfi-test/r7rs-programs/8.scm"

8-gerbil-interpreter-library-docker-head:
	

8-guile:
	
	guile --fresh-auto-compile --r7rs -L . -L ./srfi srfi-test/r7rs-programs/8.scm

8-guile-library:
	

8-guile-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:head bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . -L ./srfi srfi-test/r7rs-programs/8.scm"

8-guile-library-docker:
	

8-guile-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:head bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . -L ./srfi srfi-test/r7rs-programs/8.scm"

8-guile-library-docker-head:
	

8-kawa:
	
	kawa --r7rs --full-tailcalls -Dkawa.import.path=../../*.sld:*.sld srfi-test/r7rs-programs/8.scm

8-kawa-library:
	

8-kawa-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa bash -c "cd workdir && kawa --r7rs --full-tailcalls -Dkawa.import.path=../../*.sld:*.sld srfi-test/r7rs-programs/8.scm"

8-kawa-library-docker:
	

8-kawa-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa bash -c "cd workdir && kawa --r7rs --full-tailcalls -Dkawa.import.path=../../*.sld:*.sld srfi-test/r7rs-programs/8.scm"

8-kawa-library-docker-head:
	

8-larceny:
	
	larceny -utf8 -r7strict -I . -program srfi-test/r7rs-programs/8.scm

8-larceny-library:
	

8-larceny-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/larceny:latest bash -c "cd workdir && larceny -utf8 -r7strict -I . -program srfi-test/r7rs-programs/8.scm"

8-larceny-library-docker:
	

8-larceny-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/larceny:latest bash -c "cd workdir && larceny -utf8 -r7strict -I . -program srfi-test/r7rs-programs/8.scm"

8-larceny-library-docker-head:
	

8-loko-compiler:
	ls srfi/8.sld
	loko -std=r7rs --compile srfi-test/r7rs-programs/8.scm && mv srfi-test/r7rs-programs/8 ./test && ./test

8-loko-compiler-library:
	ls srfi/8.sld

8-loko-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && ls srfi/8.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/8.scm && mv srfi-test/r7rs-programs/8 ./test && ./test"

8-loko-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && ls srfi/8.sld" 

8-loko-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && ls srfi/8.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/8.scm && mv srfi-test/r7rs-programs/8 ./test && ./test"

8-loko-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && ls srfi/8.sld" 

8-mit-scheme:
	
	mit-scheme --batch-mode --load ./srfi/8.sld ./srfi/1.sld ./srfi/38.sld ./srfi/39.mit.sld ./srfi/48.sld ./srfi/64.sld srfi-test/r7rs-programs/8.scm

8-mit-scheme-library:
	

8-mit-scheme-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --batch-mode --load ./srfi/8.sld ./srfi/1.sld ./srfi/38.sld ./srfi/39.mit.sld ./srfi/48.sld ./srfi/64.sld srfi-test/r7rs-programs/8.scm"

8-mit-scheme-library-docker:
	

8-mit-scheme-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --batch-mode --load ./srfi/8.sld ./srfi/1.sld ./srfi/38.sld ./srfi/39.mit.sld ./srfi/48.sld ./srfi/64.sld srfi-test/r7rs-programs/8.scm"

8-mit-scheme-library-docker-head:
	

8-mosh:
	
	mosh --loadpath=. srfi-test/r7rs-programs/8.scm

8-mosh-library:
	

8-mosh-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mosh:latest bash -c "cd workdir && mosh --loadpath=. srfi-test/r7rs-programs/8.scm"

8-mosh-library-docker:
	

8-mosh-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mosh:latest bash -c "cd workdir && mosh --loadpath=. srfi-test/r7rs-programs/8.scm"

8-mosh-library-docker-head:
	

8-racket:
	
	racket -I r7rs -S . --script srfi-test/r7rs-programs/8.scm

8-racket-library:
	

8-racket-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:latest bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/8.scm"

8-racket-library-docker:
	

8-racket-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:latest bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/8.scm"

8-racket-library-docker-head:
	

8-sagittarius:
	
	sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/8.scm

8-sagittarius-library:
	

8-sagittarius-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:latest bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/8.scm"

8-sagittarius-library-docker:
	

8-sagittarius-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:latest bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/8.scm"

8-sagittarius-library-docker-head:
	

8-stklos:
	
	stklos --debug -I . -I ./srfi -f srfi-test/r7rs-programs/8.scm

8-stklos-library:
	

8-stklos-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:head bash -c "cd workdir && stklos --debug -I . -I ./srfi -f srfi-test/r7rs-programs/8.scm"

8-stklos-library-docker:
	

8-stklos-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:head bash -c "cd workdir && stklos --debug -I . -I ./srfi -f srfi-test/r7rs-programs/8.scm"

8-stklos-library-docker-head:
	

8-skint:
	
	skint -I ./ --script srfi-test/r7rs-programs/8.scm

8-skint-library:
	

8-skint-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:latest bash -c "cd workdir && skint -I ./ --script srfi-test/r7rs-programs/8.scm"

8-skint-library-docker:
	

8-skint-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:latest bash -c "cd workdir && skint -I ./ --script srfi-test/r7rs-programs/8.scm"

8-skint-library-docker-head:
	

8-tr7:
	
	TR7_LIB_PATH=${TR7_LIB_PATH}:${PWD}/srfi tr7i srfi-test/r7rs-programs/8.scm

8-tr7-library:
	

8-tr7-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:head bash -c "cd workdir && TR7_LIB_PATH=${TR7_LIB_PATH}:${PWD}/srfi tr7i srfi-test/r7rs-programs/8.scm"

8-tr7-library-docker:
	

8-tr7-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:head bash -c "cd workdir && TR7_LIB_PATH=${TR7_LIB_PATH}:${PWD}/srfi tr7i srfi-test/r7rs-programs/8.scm"

8-tr7-library-docker-head:
	

8-ypsilon:
	
	ypsilon --r7rs --verbose --warning --sitelib=. --top-level-program srfi-test/r7rs-programs/8.scm

8-ypsilon-library:
	

8-ypsilon-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/ypsilon:latest bash -c "cd workdir && ypsilon --r7rs --verbose --warning --sitelib=. --top-level-program srfi-test/r7rs-programs/8.scm"

8-ypsilon-library-docker:
	

8-ypsilon-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/ypsilon:latest bash -c "cd workdir && ypsilon --r7rs --verbose --warning --sitelib=. --top-level-program srfi-test/r7rs-programs/8.scm"

8-ypsilon-library-docker-head:
	

38-chibi:
	
	chibi-scheme -I . srfi-test/r7rs-programs/38.scm

38-chibi-library:
	

38-chibi-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:latest bash -c "cd workdir && chibi-scheme -I . srfi-test/r7rs-programs/38.scm"

38-chibi-library-docker:
	

38-chibi-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:latest bash -c "cd workdir && chibi-scheme -I . srfi-test/r7rs-programs/38.scm"

38-chibi-library-docker-head:
	

38-chicken-compiler:
	cp srfi/srfi-38.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-38.scm
	csc -X r7rs -R r7rs -I ./srfi -o test srfi-test/r7rs-programs/38.scm && ./test

38-chicken-compiler-library:
	cp srfi/srfi-38.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-38.scm

38-chicken-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-38.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-38.scm"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csc -X r7rs -R r7rs -I ./srfi -o test srfi-test/r7rs-programs/38.scm && ./test"

38-chicken-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-38.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-38.scm" 

38-chicken-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-38.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-38.scm"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csc -X r7rs -R r7rs -I ./srfi -o test srfi-test/r7rs-programs/38.scm && ./test"

38-chicken-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-38.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-38.scm" 

38-chicken-interpreter:
	cp srfi/srfi-38.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-38.scm
	csi -b -R r7rs -I ./ -I ./srfi -script srfi-test/r7rs-programs/38.scm

38-chicken-interpreter-library:
	cp srfi/srfi-38.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-38.scm

38-chicken-interpreter-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-38.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-38.scm"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csi -b -R r7rs -I ./ -I ./srfi -script srfi-test/r7rs-programs/38.scm"

38-chicken-interpreter-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-38.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-38.scm" 

38-chicken-interpreter-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-38.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-38.scm"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csi -b -R r7rs -I ./ -I ./srfi -script srfi-test/r7rs-programs/38.scm"

38-chicken-interpreter-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-38.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-38.scm" 

38-cyclone-compiler:
	cyclone -I . srfi/38.sld
	cyclone -o ./test -I . srfi-test/r7rs-programs/38.scm && mv srfi-test/r7rs-programs/38 ./test && ./test

38-cyclone-compiler-library:
	cyclone -I . srfi/38.sld

38-cyclone-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/38.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -o ./test -I . srfi-test/r7rs-programs/38.scm && mv srfi-test/r7rs-programs/38 ./test && ./test"

38-cyclone-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/38.sld" 

38-cyclone-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/38.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -o ./test -I . srfi-test/r7rs-programs/38.scm && mv srfi-test/r7rs-programs/38 ./test && ./test"

38-cyclone-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/38.sld" 

38-cyclone-interpreter:
	cyclone -I . srfi/38.sld
	icyc -I . -I ./srfi -s srfi-test/r7rs-programs/38.scm

38-cyclone-interpreter-library:
	cyclone -I . srfi/38.sld

38-cyclone-interpreter-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/38.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && icyc -I . -I ./srfi -s srfi-test/r7rs-programs/38.scm"

38-cyclone-interpreter-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/38.sld" 

38-cyclone-interpreter-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/38.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && icyc -I . -I ./srfi -s srfi-test/r7rs-programs/38.scm"

38-cyclone-interpreter-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/38.sld" 

38-foment:
	
	foment -X .sld -I ${PWD} srfi-test/r7rs-programs/38.scm

38-foment-library:
	

38-foment-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment bash -c "cd workdir && foment -X .sld -I ${PWD} srfi-test/r7rs-programs/38.scm"

38-foment-library-docker:
	

38-foment-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment bash -c "cd workdir && foment -X .sld -I ${PWD} srfi-test/r7rs-programs/38.scm"

38-foment-library-docker-head:
	

38-gambit-compiler:
	ls srfi/38.sld
	gsc -o ./test -exe -nopreload ./ srfi-test/r7rs-programs/38.scm && ./test

38-gambit-compiler-library:
	ls srfi/38.sld

38-gambit-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && ls srfi/38.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsc -o ./test -exe -nopreload ./ srfi-test/r7rs-programs/38.scm && ./test"

38-gambit-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && ls srfi/38.sld" 

38-gambit-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && ls srfi/38.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsc -o ./test -exe -nopreload ./ srfi-test/r7rs-programs/38.scm && ./test"

38-gambit-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && ls srfi/38.sld" 

38-gambit-interpreter:
	
	gsi -:search=./ srfi-test/r7rs-programs/38.scm

38-gambit-interpreter-library:
	

38-gambit-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsi -:search=./ srfi-test/r7rs-programs/38.scm"

38-gambit-interpreter-library-docker:
	

38-gambit-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsi -:search=./ srfi-test/r7rs-programs/38.scm"

38-gambit-interpreter-library-docker-head:
	

38-gauche:
	
	gosh -r7 -I . srfi-test/r7rs-programs/38.scm

38-gauche-library:
	

38-gauche-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:latest bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/38.scm"

38-gauche-library-docker:
	

38-gauche-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:latest bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/38.scm"

38-gauche-library-docker-head:
	

38-gerbil-compiler:
	gxc srfi/38.sld
	GERBIL_LOADPATH=. gxc -o ./test --lang r7rs -exe srfi-test/r7rs-programs/38.scm && ./test

38-gerbil-compiler-library:
	gxc srfi/38.sld

38-gerbil-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc srfi/38.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && GERBIL_LOADPATH=. gxc -o ./test --lang r7rs -exe srfi-test/r7rs-programs/38.scm && ./test"

38-gerbil-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc srfi/38.sld" 

38-gerbil-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc srfi/38.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && GERBIL_LOADPATH=. gxc -o ./test --lang r7rs -exe srfi-test/r7rs-programs/38.scm && ./test"

38-gerbil-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc srfi/38.sld" 

38-gerbil-interpreter:
	
	GERBIL_LOADPATH=.:./srfi gxi --lang r7rs srfi-test/r7rs-programs/38.scm

38-gerbil-interpreter-library:
	

38-gerbil-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && GERBIL_LOADPATH=.:./srfi gxi --lang r7rs srfi-test/r7rs-programs/38.scm"

38-gerbil-interpreter-library-docker:
	

38-gerbil-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && GERBIL_LOADPATH=.:./srfi gxi --lang r7rs srfi-test/r7rs-programs/38.scm"

38-gerbil-interpreter-library-docker-head:
	

38-guile:
	
	guile --fresh-auto-compile --r7rs -L . -L ./srfi srfi-test/r7rs-programs/38.scm

38-guile-library:
	

38-guile-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:head bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . -L ./srfi srfi-test/r7rs-programs/38.scm"

38-guile-library-docker:
	

38-guile-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:head bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . -L ./srfi srfi-test/r7rs-programs/38.scm"

38-guile-library-docker-head:
	

38-kawa:
	
	kawa --r7rs --full-tailcalls -Dkawa.import.path=../../*.sld:*.sld srfi-test/r7rs-programs/38.scm

38-kawa-library:
	

38-kawa-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa bash -c "cd workdir && kawa --r7rs --full-tailcalls -Dkawa.import.path=../../*.sld:*.sld srfi-test/r7rs-programs/38.scm"

38-kawa-library-docker:
	

38-kawa-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa bash -c "cd workdir && kawa --r7rs --full-tailcalls -Dkawa.import.path=../../*.sld:*.sld srfi-test/r7rs-programs/38.scm"

38-kawa-library-docker-head:
	

38-larceny:
	
	larceny -utf8 -r7strict -I . -program srfi-test/r7rs-programs/38.scm

38-larceny-library:
	

38-larceny-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/larceny:latest bash -c "cd workdir && larceny -utf8 -r7strict -I . -program srfi-test/r7rs-programs/38.scm"

38-larceny-library-docker:
	

38-larceny-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/larceny:latest bash -c "cd workdir && larceny -utf8 -r7strict -I . -program srfi-test/r7rs-programs/38.scm"

38-larceny-library-docker-head:
	

38-loko-compiler:
	ls srfi/38.sld
	loko -std=r7rs --compile srfi-test/r7rs-programs/38.scm && mv srfi-test/r7rs-programs/38 ./test && ./test

38-loko-compiler-library:
	ls srfi/38.sld

38-loko-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && ls srfi/38.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/38.scm && mv srfi-test/r7rs-programs/38 ./test && ./test"

38-loko-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && ls srfi/38.sld" 

38-loko-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && ls srfi/38.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/38.scm && mv srfi-test/r7rs-programs/38 ./test && ./test"

38-loko-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && ls srfi/38.sld" 

38-mit-scheme:
	
	mit-scheme --batch-mode --load ./srfi/8.sld ./srfi/1.sld ./srfi/38.sld ./srfi/39.mit.sld ./srfi/48.sld ./srfi/64.sld srfi-test/r7rs-programs/38.scm

38-mit-scheme-library:
	

38-mit-scheme-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --batch-mode --load ./srfi/8.sld ./srfi/1.sld ./srfi/38.sld ./srfi/39.mit.sld ./srfi/48.sld ./srfi/64.sld srfi-test/r7rs-programs/38.scm"

38-mit-scheme-library-docker:
	

38-mit-scheme-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --batch-mode --load ./srfi/8.sld ./srfi/1.sld ./srfi/38.sld ./srfi/39.mit.sld ./srfi/48.sld ./srfi/64.sld srfi-test/r7rs-programs/38.scm"

38-mit-scheme-library-docker-head:
	

38-mosh:
	
	mosh --loadpath=. srfi-test/r7rs-programs/38.scm

38-mosh-library:
	

38-mosh-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mosh:latest bash -c "cd workdir && mosh --loadpath=. srfi-test/r7rs-programs/38.scm"

38-mosh-library-docker:
	

38-mosh-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mosh:latest bash -c "cd workdir && mosh --loadpath=. srfi-test/r7rs-programs/38.scm"

38-mosh-library-docker-head:
	

38-racket:
	
	racket -I r7rs -S . --script srfi-test/r7rs-programs/38.scm

38-racket-library:
	

38-racket-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:latest bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/38.scm"

38-racket-library-docker:
	

38-racket-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:latest bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/38.scm"

38-racket-library-docker-head:
	

38-sagittarius:
	
	sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/38.scm

38-sagittarius-library:
	

38-sagittarius-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:latest bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/38.scm"

38-sagittarius-library-docker:
	

38-sagittarius-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:latest bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/38.scm"

38-sagittarius-library-docker-head:
	

38-stklos:
	
	stklos --debug -I . -I ./srfi -f srfi-test/r7rs-programs/38.scm

38-stklos-library:
	

38-stklos-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:head bash -c "cd workdir && stklos --debug -I . -I ./srfi -f srfi-test/r7rs-programs/38.scm"

38-stklos-library-docker:
	

38-stklos-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:head bash -c "cd workdir && stklos --debug -I . -I ./srfi -f srfi-test/r7rs-programs/38.scm"

38-stklos-library-docker-head:
	

38-skint:
	
	skint -I ./ --script srfi-test/r7rs-programs/38.scm

38-skint-library:
	

38-skint-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:latest bash -c "cd workdir && skint -I ./ --script srfi-test/r7rs-programs/38.scm"

38-skint-library-docker:
	

38-skint-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:latest bash -c "cd workdir && skint -I ./ --script srfi-test/r7rs-programs/38.scm"

38-skint-library-docker-head:
	

38-tr7:
	
	TR7_LIB_PATH=${TR7_LIB_PATH}:${PWD}/srfi tr7i srfi-test/r7rs-programs/38.scm

38-tr7-library:
	

38-tr7-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:head bash -c "cd workdir && TR7_LIB_PATH=${TR7_LIB_PATH}:${PWD}/srfi tr7i srfi-test/r7rs-programs/38.scm"

38-tr7-library-docker:
	

38-tr7-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:head bash -c "cd workdir && TR7_LIB_PATH=${TR7_LIB_PATH}:${PWD}/srfi tr7i srfi-test/r7rs-programs/38.scm"

38-tr7-library-docker-head:
	

38-ypsilon:
	
	ypsilon --r7rs --verbose --warning --sitelib=. --top-level-program srfi-test/r7rs-programs/38.scm

38-ypsilon-library:
	

38-ypsilon-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/ypsilon:latest bash -c "cd workdir && ypsilon --r7rs --verbose --warning --sitelib=. --top-level-program srfi-test/r7rs-programs/38.scm"

38-ypsilon-library-docker:
	

38-ypsilon-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/ypsilon:latest bash -c "cd workdir && ypsilon --r7rs --verbose --warning --sitelib=. --top-level-program srfi-test/r7rs-programs/38.scm"

38-ypsilon-library-docker-head:
	

39-chibi:
	
	chibi-scheme -I . srfi-test/r7rs-programs/39.scm

39-chibi-library:
	

39-chibi-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:latest bash -c "cd workdir && chibi-scheme -I . srfi-test/r7rs-programs/39.scm"

39-chibi-library-docker:
	

39-chibi-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:latest bash -c "cd workdir && chibi-scheme -I . srfi-test/r7rs-programs/39.scm"

39-chibi-library-docker-head:
	

39-chicken-compiler:
	cp srfi/srfi-39.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-39.scm
	csc -X r7rs -R r7rs -I ./srfi -o test srfi-test/r7rs-programs/39.scm && ./test

39-chicken-compiler-library:
	cp srfi/srfi-39.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-39.scm

39-chicken-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-39.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-39.scm"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csc -X r7rs -R r7rs -I ./srfi -o test srfi-test/r7rs-programs/39.scm && ./test"

39-chicken-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-39.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-39.scm" 

39-chicken-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-39.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-39.scm"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csc -X r7rs -R r7rs -I ./srfi -o test srfi-test/r7rs-programs/39.scm && ./test"

39-chicken-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-39.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-39.scm" 

39-chicken-interpreter:
	cp srfi/srfi-39.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-39.scm
	csi -b -R r7rs -I ./ -I ./srfi -script srfi-test/r7rs-programs/39.scm

39-chicken-interpreter-library:
	cp srfi/srfi-39.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-39.scm

39-chicken-interpreter-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-39.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-39.scm"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csi -b -R r7rs -I ./ -I ./srfi -script srfi-test/r7rs-programs/39.scm"

39-chicken-interpreter-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-39.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-39.scm" 

39-chicken-interpreter-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-39.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-39.scm"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csi -b -R r7rs -I ./ -I ./srfi -script srfi-test/r7rs-programs/39.scm"

39-chicken-interpreter-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-39.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-39.scm" 

39-cyclone-compiler:
	cyclone -I . srfi/39.sld
	cyclone -o ./test -I . srfi-test/r7rs-programs/39.scm && mv srfi-test/r7rs-programs/39 ./test && ./test

39-cyclone-compiler-library:
	cyclone -I . srfi/39.sld

39-cyclone-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/39.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -o ./test -I . srfi-test/r7rs-programs/39.scm && mv srfi-test/r7rs-programs/39 ./test && ./test"

39-cyclone-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/39.sld" 

39-cyclone-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/39.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -o ./test -I . srfi-test/r7rs-programs/39.scm && mv srfi-test/r7rs-programs/39 ./test && ./test"

39-cyclone-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/39.sld" 

39-cyclone-interpreter:
	cyclone -I . srfi/39.sld
	icyc -I . -I ./srfi -s srfi-test/r7rs-programs/39.scm

39-cyclone-interpreter-library:
	cyclone -I . srfi/39.sld

39-cyclone-interpreter-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/39.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && icyc -I . -I ./srfi -s srfi-test/r7rs-programs/39.scm"

39-cyclone-interpreter-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/39.sld" 

39-cyclone-interpreter-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/39.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && icyc -I . -I ./srfi -s srfi-test/r7rs-programs/39.scm"

39-cyclone-interpreter-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/39.sld" 

39-foment:
	
	foment -X .sld -I ${PWD} srfi-test/r7rs-programs/39.scm

39-foment-library:
	

39-foment-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment bash -c "cd workdir && foment -X .sld -I ${PWD} srfi-test/r7rs-programs/39.scm"

39-foment-library-docker:
	

39-foment-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment bash -c "cd workdir && foment -X .sld -I ${PWD} srfi-test/r7rs-programs/39.scm"

39-foment-library-docker-head:
	

39-gambit-compiler:
	ls srfi/39.sld
	gsc -o ./test -exe -nopreload ./ srfi-test/r7rs-programs/39.scm && ./test

39-gambit-compiler-library:
	ls srfi/39.sld

39-gambit-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && ls srfi/39.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsc -o ./test -exe -nopreload ./ srfi-test/r7rs-programs/39.scm && ./test"

39-gambit-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && ls srfi/39.sld" 

39-gambit-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && ls srfi/39.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsc -o ./test -exe -nopreload ./ srfi-test/r7rs-programs/39.scm && ./test"

39-gambit-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && ls srfi/39.sld" 

39-gambit-interpreter:
	
	gsi -:search=./ srfi-test/r7rs-programs/39.scm

39-gambit-interpreter-library:
	

39-gambit-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsi -:search=./ srfi-test/r7rs-programs/39.scm"

39-gambit-interpreter-library-docker:
	

39-gambit-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsi -:search=./ srfi-test/r7rs-programs/39.scm"

39-gambit-interpreter-library-docker-head:
	

39-gauche:
	
	gosh -r7 -I . srfi-test/r7rs-programs/39.scm

39-gauche-library:
	

39-gauche-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:latest bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/39.scm"

39-gauche-library-docker:
	

39-gauche-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:latest bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/39.scm"

39-gauche-library-docker-head:
	

39-gerbil-compiler:
	gxc srfi/39.sld
	GERBIL_LOADPATH=. gxc -o ./test --lang r7rs -exe srfi-test/r7rs-programs/39.scm && ./test

39-gerbil-compiler-library:
	gxc srfi/39.sld

39-gerbil-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc srfi/39.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && GERBIL_LOADPATH=. gxc -o ./test --lang r7rs -exe srfi-test/r7rs-programs/39.scm && ./test"

39-gerbil-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc srfi/39.sld" 

39-gerbil-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc srfi/39.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && GERBIL_LOADPATH=. gxc -o ./test --lang r7rs -exe srfi-test/r7rs-programs/39.scm && ./test"

39-gerbil-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc srfi/39.sld" 

39-gerbil-interpreter:
	
	GERBIL_LOADPATH=.:./srfi gxi --lang r7rs srfi-test/r7rs-programs/39.scm

39-gerbil-interpreter-library:
	

39-gerbil-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && GERBIL_LOADPATH=.:./srfi gxi --lang r7rs srfi-test/r7rs-programs/39.scm"

39-gerbil-interpreter-library-docker:
	

39-gerbil-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && GERBIL_LOADPATH=.:./srfi gxi --lang r7rs srfi-test/r7rs-programs/39.scm"

39-gerbil-interpreter-library-docker-head:
	

39-guile:
	
	guile --fresh-auto-compile --r7rs -L . -L ./srfi srfi-test/r7rs-programs/39.scm

39-guile-library:
	

39-guile-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:head bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . -L ./srfi srfi-test/r7rs-programs/39.scm"

39-guile-library-docker:
	

39-guile-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:head bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . -L ./srfi srfi-test/r7rs-programs/39.scm"

39-guile-library-docker-head:
	

39-kawa:
	
	kawa --r7rs --full-tailcalls -Dkawa.import.path=../../*.sld:*.sld srfi-test/r7rs-programs/39.scm

39-kawa-library:
	

39-kawa-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa bash -c "cd workdir && kawa --r7rs --full-tailcalls -Dkawa.import.path=../../*.sld:*.sld srfi-test/r7rs-programs/39.scm"

39-kawa-library-docker:
	

39-kawa-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa bash -c "cd workdir && kawa --r7rs --full-tailcalls -Dkawa.import.path=../../*.sld:*.sld srfi-test/r7rs-programs/39.scm"

39-kawa-library-docker-head:
	

39-larceny:
	
	larceny -utf8 -r7strict -I . -program srfi-test/r7rs-programs/39.scm

39-larceny-library:
	

39-larceny-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/larceny:latest bash -c "cd workdir && larceny -utf8 -r7strict -I . -program srfi-test/r7rs-programs/39.scm"

39-larceny-library-docker:
	

39-larceny-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/larceny:latest bash -c "cd workdir && larceny -utf8 -r7strict -I . -program srfi-test/r7rs-programs/39.scm"

39-larceny-library-docker-head:
	

39-loko-compiler:
	ls srfi/39.sld
	loko -std=r7rs --compile srfi-test/r7rs-programs/39.scm && mv srfi-test/r7rs-programs/39 ./test && ./test

39-loko-compiler-library:
	ls srfi/39.sld

39-loko-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && ls srfi/39.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/39.scm && mv srfi-test/r7rs-programs/39 ./test && ./test"

39-loko-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && ls srfi/39.sld" 

39-loko-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && ls srfi/39.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/39.scm && mv srfi-test/r7rs-programs/39 ./test && ./test"

39-loko-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && ls srfi/39.sld" 

39-mit-scheme:
	
	mit-scheme --batch-mode --load ./srfi/8.sld ./srfi/1.sld ./srfi/38.sld ./srfi/39.mit.sld ./srfi/48.sld ./srfi/64.sld srfi-test/r7rs-programs/39.scm

39-mit-scheme-library:
	

39-mit-scheme-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --batch-mode --load ./srfi/8.sld ./srfi/1.sld ./srfi/38.sld ./srfi/39.mit.sld ./srfi/48.sld ./srfi/64.sld srfi-test/r7rs-programs/39.scm"

39-mit-scheme-library-docker:
	

39-mit-scheme-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --batch-mode --load ./srfi/8.sld ./srfi/1.sld ./srfi/38.sld ./srfi/39.mit.sld ./srfi/48.sld ./srfi/64.sld srfi-test/r7rs-programs/39.scm"

39-mit-scheme-library-docker-head:
	

39-mosh:
	
	mosh --loadpath=. srfi-test/r7rs-programs/39.scm

39-mosh-library:
	

39-mosh-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mosh:latest bash -c "cd workdir && mosh --loadpath=. srfi-test/r7rs-programs/39.scm"

39-mosh-library-docker:
	

39-mosh-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mosh:latest bash -c "cd workdir && mosh --loadpath=. srfi-test/r7rs-programs/39.scm"

39-mosh-library-docker-head:
	

39-racket:
	
	racket -I r7rs -S . --script srfi-test/r7rs-programs/39.scm

39-racket-library:
	

39-racket-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:latest bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/39.scm"

39-racket-library-docker:
	

39-racket-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:latest bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/39.scm"

39-racket-library-docker-head:
	

39-sagittarius:
	
	sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/39.scm

39-sagittarius-library:
	

39-sagittarius-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:latest bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/39.scm"

39-sagittarius-library-docker:
	

39-sagittarius-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:latest bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/39.scm"

39-sagittarius-library-docker-head:
	

39-stklos:
	
	stklos --debug -I . -I ./srfi -f srfi-test/r7rs-programs/39.scm

39-stklos-library:
	

39-stklos-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:head bash -c "cd workdir && stklos --debug -I . -I ./srfi -f srfi-test/r7rs-programs/39.scm"

39-stklos-library-docker:
	

39-stklos-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:head bash -c "cd workdir && stklos --debug -I . -I ./srfi -f srfi-test/r7rs-programs/39.scm"

39-stklos-library-docker-head:
	

39-skint:
	
	skint -I ./ --script srfi-test/r7rs-programs/39.scm

39-skint-library:
	

39-skint-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:latest bash -c "cd workdir && skint -I ./ --script srfi-test/r7rs-programs/39.scm"

39-skint-library-docker:
	

39-skint-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:latest bash -c "cd workdir && skint -I ./ --script srfi-test/r7rs-programs/39.scm"

39-skint-library-docker-head:
	

39-tr7:
	
	TR7_LIB_PATH=${TR7_LIB_PATH}:${PWD}/srfi tr7i srfi-test/r7rs-programs/39.scm

39-tr7-library:
	

39-tr7-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:head bash -c "cd workdir && TR7_LIB_PATH=${TR7_LIB_PATH}:${PWD}/srfi tr7i srfi-test/r7rs-programs/39.scm"

39-tr7-library-docker:
	

39-tr7-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:head bash -c "cd workdir && TR7_LIB_PATH=${TR7_LIB_PATH}:${PWD}/srfi tr7i srfi-test/r7rs-programs/39.scm"

39-tr7-library-docker-head:
	

39-ypsilon:
	
	ypsilon --r7rs --verbose --warning --sitelib=. --top-level-program srfi-test/r7rs-programs/39.scm

39-ypsilon-library:
	

39-ypsilon-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/ypsilon:latest bash -c "cd workdir && ypsilon --r7rs --verbose --warning --sitelib=. --top-level-program srfi-test/r7rs-programs/39.scm"

39-ypsilon-library-docker:
	

39-ypsilon-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/ypsilon:latest bash -c "cd workdir && ypsilon --r7rs --verbose --warning --sitelib=. --top-level-program srfi-test/r7rs-programs/39.scm"

39-ypsilon-library-docker-head:
	

48-chibi:
	
	chibi-scheme -I . srfi-test/r7rs-programs/48.scm

48-chibi-library:
	

48-chibi-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:latest bash -c "cd workdir && chibi-scheme -I . srfi-test/r7rs-programs/48.scm"

48-chibi-library-docker:
	

48-chibi-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:latest bash -c "cd workdir && chibi-scheme -I . srfi-test/r7rs-programs/48.scm"

48-chibi-library-docker-head:
	

48-chicken-compiler:
	cp srfi/srfi-48.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-48.scm
	csc -X r7rs -R r7rs -I ./srfi -o test srfi-test/r7rs-programs/48.scm && ./test

48-chicken-compiler-library:
	cp srfi/srfi-48.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-48.scm

48-chicken-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-48.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-48.scm"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csc -X r7rs -R r7rs -I ./srfi -o test srfi-test/r7rs-programs/48.scm && ./test"

48-chicken-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-48.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-48.scm" 

48-chicken-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-48.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-48.scm"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csc -X r7rs -R r7rs -I ./srfi -o test srfi-test/r7rs-programs/48.scm && ./test"

48-chicken-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-48.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-48.scm" 

48-chicken-interpreter:
	cp srfi/srfi-48.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-48.scm
	csi -b -R r7rs -I ./ -I ./srfi -script srfi-test/r7rs-programs/48.scm

48-chicken-interpreter-library:
	cp srfi/srfi-48.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-48.scm

48-chicken-interpreter-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-48.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-48.scm"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csi -b -R r7rs -I ./ -I ./srfi -script srfi-test/r7rs-programs/48.scm"

48-chicken-interpreter-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-48.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-48.scm" 

48-chicken-interpreter-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-48.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-48.scm"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csi -b -R r7rs -I ./ -I ./srfi -script srfi-test/r7rs-programs/48.scm"

48-chicken-interpreter-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-48.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-48.scm" 

48-cyclone-compiler:
	cyclone -I . srfi/48.sld
	cyclone -o ./test -I . srfi-test/r7rs-programs/48.scm && mv srfi-test/r7rs-programs/48 ./test && ./test

48-cyclone-compiler-library:
	cyclone -I . srfi/48.sld

48-cyclone-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/48.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -o ./test -I . srfi-test/r7rs-programs/48.scm && mv srfi-test/r7rs-programs/48 ./test && ./test"

48-cyclone-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/48.sld" 

48-cyclone-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/48.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -o ./test -I . srfi-test/r7rs-programs/48.scm && mv srfi-test/r7rs-programs/48 ./test && ./test"

48-cyclone-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/48.sld" 

48-cyclone-interpreter:
	cyclone -I . srfi/48.sld
	icyc -I . -I ./srfi -s srfi-test/r7rs-programs/48.scm

48-cyclone-interpreter-library:
	cyclone -I . srfi/48.sld

48-cyclone-interpreter-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/48.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && icyc -I . -I ./srfi -s srfi-test/r7rs-programs/48.scm"

48-cyclone-interpreter-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/48.sld" 

48-cyclone-interpreter-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/48.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && icyc -I . -I ./srfi -s srfi-test/r7rs-programs/48.scm"

48-cyclone-interpreter-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/48.sld" 

48-foment:
	
	foment -X .sld -I ${PWD} srfi-test/r7rs-programs/48.scm

48-foment-library:
	

48-foment-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment bash -c "cd workdir && foment -X .sld -I ${PWD} srfi-test/r7rs-programs/48.scm"

48-foment-library-docker:
	

48-foment-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment bash -c "cd workdir && foment -X .sld -I ${PWD} srfi-test/r7rs-programs/48.scm"

48-foment-library-docker-head:
	

48-gambit-compiler:
	ls srfi/48.sld
	gsc -o ./test -exe -nopreload ./ srfi-test/r7rs-programs/48.scm && ./test

48-gambit-compiler-library:
	ls srfi/48.sld

48-gambit-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && ls srfi/48.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsc -o ./test -exe -nopreload ./ srfi-test/r7rs-programs/48.scm && ./test"

48-gambit-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && ls srfi/48.sld" 

48-gambit-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && ls srfi/48.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsc -o ./test -exe -nopreload ./ srfi-test/r7rs-programs/48.scm && ./test"

48-gambit-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && ls srfi/48.sld" 

48-gambit-interpreter:
	
	gsi -:search=./ srfi-test/r7rs-programs/48.scm

48-gambit-interpreter-library:
	

48-gambit-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsi -:search=./ srfi-test/r7rs-programs/48.scm"

48-gambit-interpreter-library-docker:
	

48-gambit-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsi -:search=./ srfi-test/r7rs-programs/48.scm"

48-gambit-interpreter-library-docker-head:
	

48-gauche:
	
	gosh -r7 -I . srfi-test/r7rs-programs/48.scm

48-gauche-library:
	

48-gauche-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:latest bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/48.scm"

48-gauche-library-docker:
	

48-gauche-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:latest bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/48.scm"

48-gauche-library-docker-head:
	

48-gerbil-compiler:
	gxc srfi/48.sld
	GERBIL_LOADPATH=. gxc -o ./test --lang r7rs -exe srfi-test/r7rs-programs/48.scm && ./test

48-gerbil-compiler-library:
	gxc srfi/48.sld

48-gerbil-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc srfi/48.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && GERBIL_LOADPATH=. gxc -o ./test --lang r7rs -exe srfi-test/r7rs-programs/48.scm && ./test"

48-gerbil-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc srfi/48.sld" 

48-gerbil-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc srfi/48.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && GERBIL_LOADPATH=. gxc -o ./test --lang r7rs -exe srfi-test/r7rs-programs/48.scm && ./test"

48-gerbil-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc srfi/48.sld" 

48-gerbil-interpreter:
	
	GERBIL_LOADPATH=.:./srfi gxi --lang r7rs srfi-test/r7rs-programs/48.scm

48-gerbil-interpreter-library:
	

48-gerbil-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && GERBIL_LOADPATH=.:./srfi gxi --lang r7rs srfi-test/r7rs-programs/48.scm"

48-gerbil-interpreter-library-docker:
	

48-gerbil-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && GERBIL_LOADPATH=.:./srfi gxi --lang r7rs srfi-test/r7rs-programs/48.scm"

48-gerbil-interpreter-library-docker-head:
	

48-guile:
	
	guile --fresh-auto-compile --r7rs -L . -L ./srfi srfi-test/r7rs-programs/48.scm

48-guile-library:
	

48-guile-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:head bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . -L ./srfi srfi-test/r7rs-programs/48.scm"

48-guile-library-docker:
	

48-guile-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:head bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . -L ./srfi srfi-test/r7rs-programs/48.scm"

48-guile-library-docker-head:
	

48-kawa:
	
	kawa --r7rs --full-tailcalls -Dkawa.import.path=../../*.sld:*.sld srfi-test/r7rs-programs/48.scm

48-kawa-library:
	

48-kawa-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa bash -c "cd workdir && kawa --r7rs --full-tailcalls -Dkawa.import.path=../../*.sld:*.sld srfi-test/r7rs-programs/48.scm"

48-kawa-library-docker:
	

48-kawa-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa bash -c "cd workdir && kawa --r7rs --full-tailcalls -Dkawa.import.path=../../*.sld:*.sld srfi-test/r7rs-programs/48.scm"

48-kawa-library-docker-head:
	

48-larceny:
	
	larceny -utf8 -r7strict -I . -program srfi-test/r7rs-programs/48.scm

48-larceny-library:
	

48-larceny-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/larceny:latest bash -c "cd workdir && larceny -utf8 -r7strict -I . -program srfi-test/r7rs-programs/48.scm"

48-larceny-library-docker:
	

48-larceny-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/larceny:latest bash -c "cd workdir && larceny -utf8 -r7strict -I . -program srfi-test/r7rs-programs/48.scm"

48-larceny-library-docker-head:
	

48-loko-compiler:
	ls srfi/48.sld
	loko -std=r7rs --compile srfi-test/r7rs-programs/48.scm && mv srfi-test/r7rs-programs/48 ./test && ./test

48-loko-compiler-library:
	ls srfi/48.sld

48-loko-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && ls srfi/48.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/48.scm && mv srfi-test/r7rs-programs/48 ./test && ./test"

48-loko-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && ls srfi/48.sld" 

48-loko-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && ls srfi/48.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/48.scm && mv srfi-test/r7rs-programs/48 ./test && ./test"

48-loko-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && ls srfi/48.sld" 

48-mit-scheme:
	
	mit-scheme --batch-mode --load ./srfi/8.sld ./srfi/1.sld ./srfi/38.sld ./srfi/39.mit.sld ./srfi/48.sld ./srfi/64.sld srfi-test/r7rs-programs/48.scm

48-mit-scheme-library:
	

48-mit-scheme-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --batch-mode --load ./srfi/8.sld ./srfi/1.sld ./srfi/38.sld ./srfi/39.mit.sld ./srfi/48.sld ./srfi/64.sld srfi-test/r7rs-programs/48.scm"

48-mit-scheme-library-docker:
	

48-mit-scheme-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --batch-mode --load ./srfi/8.sld ./srfi/1.sld ./srfi/38.sld ./srfi/39.mit.sld ./srfi/48.sld ./srfi/64.sld srfi-test/r7rs-programs/48.scm"

48-mit-scheme-library-docker-head:
	

48-mosh:
	
	mosh --loadpath=. srfi-test/r7rs-programs/48.scm

48-mosh-library:
	

48-mosh-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mosh:latest bash -c "cd workdir && mosh --loadpath=. srfi-test/r7rs-programs/48.scm"

48-mosh-library-docker:
	

48-mosh-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mosh:latest bash -c "cd workdir && mosh --loadpath=. srfi-test/r7rs-programs/48.scm"

48-mosh-library-docker-head:
	

48-racket:
	
	racket -I r7rs -S . --script srfi-test/r7rs-programs/48.scm

48-racket-library:
	

48-racket-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:latest bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/48.scm"

48-racket-library-docker:
	

48-racket-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:latest bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/48.scm"

48-racket-library-docker-head:
	

48-sagittarius:
	
	sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/48.scm

48-sagittarius-library:
	

48-sagittarius-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:latest bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/48.scm"

48-sagittarius-library-docker:
	

48-sagittarius-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:latest bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/48.scm"

48-sagittarius-library-docker-head:
	

48-stklos:
	
	stklos --debug -I . -I ./srfi -f srfi-test/r7rs-programs/48.scm

48-stklos-library:
	

48-stklos-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:head bash -c "cd workdir && stklos --debug -I . -I ./srfi -f srfi-test/r7rs-programs/48.scm"

48-stklos-library-docker:
	

48-stklos-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:head bash -c "cd workdir && stklos --debug -I . -I ./srfi -f srfi-test/r7rs-programs/48.scm"

48-stklos-library-docker-head:
	

48-skint:
	
	skint -I ./ --script srfi-test/r7rs-programs/48.scm

48-skint-library:
	

48-skint-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:latest bash -c "cd workdir && skint -I ./ --script srfi-test/r7rs-programs/48.scm"

48-skint-library-docker:
	

48-skint-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:latest bash -c "cd workdir && skint -I ./ --script srfi-test/r7rs-programs/48.scm"

48-skint-library-docker-head:
	

48-tr7:
	
	TR7_LIB_PATH=${TR7_LIB_PATH}:${PWD}/srfi tr7i srfi-test/r7rs-programs/48.scm

48-tr7-library:
	

48-tr7-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:head bash -c "cd workdir && TR7_LIB_PATH=${TR7_LIB_PATH}:${PWD}/srfi tr7i srfi-test/r7rs-programs/48.scm"

48-tr7-library-docker:
	

48-tr7-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:head bash -c "cd workdir && TR7_LIB_PATH=${TR7_LIB_PATH}:${PWD}/srfi tr7i srfi-test/r7rs-programs/48.scm"

48-tr7-library-docker-head:
	

48-ypsilon:
	
	ypsilon --r7rs --verbose --warning --sitelib=. --top-level-program srfi-test/r7rs-programs/48.scm

48-ypsilon-library:
	

48-ypsilon-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/ypsilon:latest bash -c "cd workdir && ypsilon --r7rs --verbose --warning --sitelib=. --top-level-program srfi-test/r7rs-programs/48.scm"

48-ypsilon-library-docker:
	

48-ypsilon-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/ypsilon:latest bash -c "cd workdir && ypsilon --r7rs --verbose --warning --sitelib=. --top-level-program srfi-test/r7rs-programs/48.scm"

48-ypsilon-library-docker-head:
	

64-chibi:
	
	chibi-scheme -I . srfi-test/r7rs-programs/64.scm

64-chibi-library:
	

64-chibi-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:latest bash -c "cd workdir && chibi-scheme -I . srfi-test/r7rs-programs/64.scm"

64-chibi-library-docker:
	

64-chibi-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:latest bash -c "cd workdir && chibi-scheme -I . srfi-test/r7rs-programs/64.scm"

64-chibi-library-docker-head:
	

64-chicken-compiler:
	cp srfi/srfi-64.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-64.scm
	csc -X r7rs -R r7rs -I ./srfi -o test srfi-test/r7rs-programs/64.scm && ./test

64-chicken-compiler-library:
	cp srfi/srfi-64.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-64.scm

64-chicken-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-64.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-64.scm"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csc -X r7rs -R r7rs -I ./srfi -o test srfi-test/r7rs-programs/64.scm && ./test"

64-chicken-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-64.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-64.scm" 

64-chicken-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-64.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-64.scm"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csc -X r7rs -R r7rs -I ./srfi -o test srfi-test/r7rs-programs/64.scm && ./test"

64-chicken-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-64.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-64.scm" 

64-chicken-interpreter:
	cp srfi/srfi-64.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-64.scm
	csi -b -R r7rs -I ./ -I ./srfi -script srfi-test/r7rs-programs/64.scm

64-chicken-interpreter-library:
	cp srfi/srfi-64.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-64.scm

64-chicken-interpreter-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-64.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-64.scm"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csi -b -R r7rs -I ./ -I ./srfi -script srfi-test/r7rs-programs/64.scm"

64-chicken-interpreter-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-64.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-64.scm" 

64-chicken-interpreter-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-64.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-64.scm"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csi -b -R r7rs -I ./ -I ./srfi -script srfi-test/r7rs-programs/64.scm"

64-chicken-interpreter-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-64.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-64.scm" 

64-cyclone-compiler:
	cyclone -I . srfi/64.sld
	cyclone -o ./test -I . srfi-test/r7rs-programs/64.scm && mv srfi-test/r7rs-programs/64 ./test && ./test

64-cyclone-compiler-library:
	cyclone -I . srfi/64.sld

64-cyclone-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/64.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -o ./test -I . srfi-test/r7rs-programs/64.scm && mv srfi-test/r7rs-programs/64 ./test && ./test"

64-cyclone-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/64.sld" 

64-cyclone-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/64.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -o ./test -I . srfi-test/r7rs-programs/64.scm && mv srfi-test/r7rs-programs/64 ./test && ./test"

64-cyclone-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/64.sld" 

64-cyclone-interpreter:
	cyclone -I . srfi/64.sld
	icyc -I . -I ./srfi -s srfi-test/r7rs-programs/64.scm

64-cyclone-interpreter-library:
	cyclone -I . srfi/64.sld

64-cyclone-interpreter-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/64.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && icyc -I . -I ./srfi -s srfi-test/r7rs-programs/64.scm"

64-cyclone-interpreter-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/64.sld" 

64-cyclone-interpreter-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/64.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && icyc -I . -I ./srfi -s srfi-test/r7rs-programs/64.scm"

64-cyclone-interpreter-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/64.sld" 

64-foment:
	
	foment -X .sld -I ${PWD} srfi-test/r7rs-programs/64.scm

64-foment-library:
	

64-foment-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment bash -c "cd workdir && foment -X .sld -I ${PWD} srfi-test/r7rs-programs/64.scm"

64-foment-library-docker:
	

64-foment-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment bash -c "cd workdir && foment -X .sld -I ${PWD} srfi-test/r7rs-programs/64.scm"

64-foment-library-docker-head:
	

64-gambit-compiler:
	ls srfi/64.sld
	gsc -o ./test -exe -nopreload ./ srfi-test/r7rs-programs/64.scm && ./test

64-gambit-compiler-library:
	ls srfi/64.sld

64-gambit-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && ls srfi/64.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsc -o ./test -exe -nopreload ./ srfi-test/r7rs-programs/64.scm && ./test"

64-gambit-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && ls srfi/64.sld" 

64-gambit-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && ls srfi/64.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsc -o ./test -exe -nopreload ./ srfi-test/r7rs-programs/64.scm && ./test"

64-gambit-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && ls srfi/64.sld" 

64-gambit-interpreter:
	
	gsi -:search=./ srfi-test/r7rs-programs/64.scm

64-gambit-interpreter-library:
	

64-gambit-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsi -:search=./ srfi-test/r7rs-programs/64.scm"

64-gambit-interpreter-library-docker:
	

64-gambit-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsi -:search=./ srfi-test/r7rs-programs/64.scm"

64-gambit-interpreter-library-docker-head:
	

64-gauche:
	
	gosh -r7 -I . srfi-test/r7rs-programs/64.scm

64-gauche-library:
	

64-gauche-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:latest bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/64.scm"

64-gauche-library-docker:
	

64-gauche-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:latest bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/64.scm"

64-gauche-library-docker-head:
	

64-gerbil-compiler:
	gxc srfi/64.sld
	GERBIL_LOADPATH=. gxc -o ./test --lang r7rs -exe srfi-test/r7rs-programs/64.scm && ./test

64-gerbil-compiler-library:
	gxc srfi/64.sld

64-gerbil-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc srfi/64.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && GERBIL_LOADPATH=. gxc -o ./test --lang r7rs -exe srfi-test/r7rs-programs/64.scm && ./test"

64-gerbil-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc srfi/64.sld" 

64-gerbil-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc srfi/64.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && GERBIL_LOADPATH=. gxc -o ./test --lang r7rs -exe srfi-test/r7rs-programs/64.scm && ./test"

64-gerbil-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc srfi/64.sld" 

64-gerbil-interpreter:
	
	GERBIL_LOADPATH=.:./srfi gxi --lang r7rs srfi-test/r7rs-programs/64.scm

64-gerbil-interpreter-library:
	

64-gerbil-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && GERBIL_LOADPATH=.:./srfi gxi --lang r7rs srfi-test/r7rs-programs/64.scm"

64-gerbil-interpreter-library-docker:
	

64-gerbil-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && GERBIL_LOADPATH=.:./srfi gxi --lang r7rs srfi-test/r7rs-programs/64.scm"

64-gerbil-interpreter-library-docker-head:
	

64-guile:
	
	guile --fresh-auto-compile --r7rs -L . -L ./srfi srfi-test/r7rs-programs/64.scm

64-guile-library:
	

64-guile-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:head bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . -L ./srfi srfi-test/r7rs-programs/64.scm"

64-guile-library-docker:
	

64-guile-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:head bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . -L ./srfi srfi-test/r7rs-programs/64.scm"

64-guile-library-docker-head:
	

64-kawa:
	
	kawa --r7rs --full-tailcalls -Dkawa.import.path=../../*.sld:*.sld srfi-test/r7rs-programs/64.scm

64-kawa-library:
	

64-kawa-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa bash -c "cd workdir && kawa --r7rs --full-tailcalls -Dkawa.import.path=../../*.sld:*.sld srfi-test/r7rs-programs/64.scm"

64-kawa-library-docker:
	

64-kawa-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa bash -c "cd workdir && kawa --r7rs --full-tailcalls -Dkawa.import.path=../../*.sld:*.sld srfi-test/r7rs-programs/64.scm"

64-kawa-library-docker-head:
	

64-larceny:
	
	larceny -utf8 -r7strict -I . -program srfi-test/r7rs-programs/64.scm

64-larceny-library:
	

64-larceny-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/larceny:latest bash -c "cd workdir && larceny -utf8 -r7strict -I . -program srfi-test/r7rs-programs/64.scm"

64-larceny-library-docker:
	

64-larceny-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/larceny:latest bash -c "cd workdir && larceny -utf8 -r7strict -I . -program srfi-test/r7rs-programs/64.scm"

64-larceny-library-docker-head:
	

64-loko-compiler:
	ls srfi/64.sld
	loko -std=r7rs --compile srfi-test/r7rs-programs/64.scm && mv srfi-test/r7rs-programs/64 ./test && ./test

64-loko-compiler-library:
	ls srfi/64.sld

64-loko-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && ls srfi/64.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/64.scm && mv srfi-test/r7rs-programs/64 ./test && ./test"

64-loko-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && ls srfi/64.sld" 

64-loko-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && ls srfi/64.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/64.scm && mv srfi-test/r7rs-programs/64 ./test && ./test"

64-loko-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && ls srfi/64.sld" 

64-mit-scheme:
	
	mit-scheme --batch-mode --load ./srfi/8.sld ./srfi/1.sld ./srfi/38.sld ./srfi/39.mit.sld ./srfi/48.sld ./srfi/64.sld srfi-test/r7rs-programs/64.scm

64-mit-scheme-library:
	

64-mit-scheme-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --batch-mode --load ./srfi/8.sld ./srfi/1.sld ./srfi/38.sld ./srfi/39.mit.sld ./srfi/48.sld ./srfi/64.sld srfi-test/r7rs-programs/64.scm"

64-mit-scheme-library-docker:
	

64-mit-scheme-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --batch-mode --load ./srfi/8.sld ./srfi/1.sld ./srfi/38.sld ./srfi/39.mit.sld ./srfi/48.sld ./srfi/64.sld srfi-test/r7rs-programs/64.scm"

64-mit-scheme-library-docker-head:
	

64-mosh:
	
	mosh --loadpath=. srfi-test/r7rs-programs/64.scm

64-mosh-library:
	

64-mosh-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mosh:latest bash -c "cd workdir && mosh --loadpath=. srfi-test/r7rs-programs/64.scm"

64-mosh-library-docker:
	

64-mosh-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mosh:latest bash -c "cd workdir && mosh --loadpath=. srfi-test/r7rs-programs/64.scm"

64-mosh-library-docker-head:
	

64-racket:
	
	racket -I r7rs -S . --script srfi-test/r7rs-programs/64.scm

64-racket-library:
	

64-racket-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:latest bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/64.scm"

64-racket-library-docker:
	

64-racket-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:latest bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/64.scm"

64-racket-library-docker-head:
	

64-sagittarius:
	
	sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/64.scm

64-sagittarius-library:
	

64-sagittarius-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:latest bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/64.scm"

64-sagittarius-library-docker:
	

64-sagittarius-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:latest bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/64.scm"

64-sagittarius-library-docker-head:
	

64-stklos:
	
	stklos --debug -I . -I ./srfi -f srfi-test/r7rs-programs/64.scm

64-stklos-library:
	

64-stklos-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:head bash -c "cd workdir && stklos --debug -I . -I ./srfi -f srfi-test/r7rs-programs/64.scm"

64-stklos-library-docker:
	

64-stklos-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:head bash -c "cd workdir && stklos --debug -I . -I ./srfi -f srfi-test/r7rs-programs/64.scm"

64-stklos-library-docker-head:
	

64-skint:
	
	skint -I ./ --script srfi-test/r7rs-programs/64.scm

64-skint-library:
	

64-skint-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:latest bash -c "cd workdir && skint -I ./ --script srfi-test/r7rs-programs/64.scm"

64-skint-library-docker:
	

64-skint-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:latest bash -c "cd workdir && skint -I ./ --script srfi-test/r7rs-programs/64.scm"

64-skint-library-docker-head:
	

64-tr7:
	
	TR7_LIB_PATH=${TR7_LIB_PATH}:${PWD}/srfi tr7i srfi-test/r7rs-programs/64.scm

64-tr7-library:
	

64-tr7-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:head bash -c "cd workdir && TR7_LIB_PATH=${TR7_LIB_PATH}:${PWD}/srfi tr7i srfi-test/r7rs-programs/64.scm"

64-tr7-library-docker:
	

64-tr7-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:head bash -c "cd workdir && TR7_LIB_PATH=${TR7_LIB_PATH}:${PWD}/srfi tr7i srfi-test/r7rs-programs/64.scm"

64-tr7-library-docker-head:
	

64-ypsilon:
	
	ypsilon --r7rs --verbose --warning --sitelib=. --top-level-program srfi-test/r7rs-programs/64.scm

64-ypsilon-library:
	

64-ypsilon-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/ypsilon:latest bash -c "cd workdir && ypsilon --r7rs --verbose --warning --sitelib=. --top-level-program srfi-test/r7rs-programs/64.scm"

64-ypsilon-library-docker:
	

64-ypsilon-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/ypsilon:latest bash -c "cd workdir && ypsilon --r7rs --verbose --warning --sitelib=. --top-level-program srfi-test/r7rs-programs/64.scm"

64-ypsilon-library-docker-head:
	


