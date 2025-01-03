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
	
	icyc -I . -I ./srfi -s srfi-test/r7rs-programs/1.scm

1-cyclone-interpreter-library:
	

1-cyclone-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && icyc -I . -I ./srfi -s srfi-test/r7rs-programs/1.scm"

1-cyclone-interpreter-library-docker:
	

1-cyclone-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && icyc -I . -I ./srfi -s srfi-test/r7rs-programs/1.scm"

1-cyclone-interpreter-library-docker-head:
	

1-foment:
	
	foment -X .sld -I . -b srfi-test/r7rs-programs/1.scm

1-foment-library:
	

1-foment-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment:latest bash -c "cd workdir && foment -X .sld -I . -b srfi-test/r7rs-programs/1.scm"

1-foment-library-docker:
	

1-foment-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment:latest bash -c "cd workdir && foment -X .sld -I . -b srfi-test/r7rs-programs/1.scm"

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
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:latest bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . -L ./srfi srfi-test/r7rs-programs/1.scm"

1-guile-library-docker:
	

1-guile-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:latest bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . -L ./srfi srfi-test/r7rs-programs/1.scm"

1-guile-library-docker-head:
	

1-kawa:
	
	kawa --r7rs --full-tailcalls -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/1.scm

1-kawa-library:
	

1-kawa-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:latest bash -c "cd workdir && kawa --r7rs --full-tailcalls -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/1.scm"

1-kawa-library-docker:
	

1-kawa-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:latest bash -c "cd workdir && kawa --r7rs --full-tailcalls -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/1.scm"

1-kawa-library-docker-head:
	

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
	
	mit-scheme --batch-mode --load ./srfi/8.sld ./srfi/1.sld ./srfi/26.sld ./srfi/28.sld ./srfi/39.sld ./srfi/60.sld ./srfi/14.sld ./srfi/13.sld ./srfi/64.sld srfi-test/r7rs-programs/1.scm

1-mit-scheme-library:
	

1-mit-scheme-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --batch-mode --load ./srfi/8.sld ./srfi/1.sld ./srfi/26.sld ./srfi/28.sld ./srfi/39.sld ./srfi/60.sld ./srfi/14.sld ./srfi/13.sld ./srfi/64.sld srfi-test/r7rs-programs/1.scm"

1-mit-scheme-library-docker:
	

1-mit-scheme-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --batch-mode --load ./srfi/8.sld ./srfi/1.sld ./srfi/26.sld ./srfi/28.sld ./srfi/39.sld ./srfi/60.sld ./srfi/14.sld ./srfi/13.sld ./srfi/64.sld srfi-test/r7rs-programs/1.scm"

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
	
	stklos -I . -I ./srfi -f srfi-test/r7rs-programs/1.scm

1-stklos-library:
	

1-stklos-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:latest bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/1.scm"

1-stklos-library-docker:
	

1-stklos-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:latest bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/1.scm"

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
	
	tr7i srfi-test/r7rs-programs/1.scm

1-tr7-library:
	

1-tr7-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:latest bash -c "cd workdir && tr7i srfi-test/r7rs-programs/1.scm"

1-tr7-library-docker:
	

1-tr7-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:latest bash -c "cd workdir && tr7i srfi-test/r7rs-programs/1.scm"

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
	
	icyc -I . -I ./srfi -s srfi-test/r7rs-programs/8.scm

8-cyclone-interpreter-library:
	

8-cyclone-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && icyc -I . -I ./srfi -s srfi-test/r7rs-programs/8.scm"

8-cyclone-interpreter-library-docker:
	

8-cyclone-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && icyc -I . -I ./srfi -s srfi-test/r7rs-programs/8.scm"

8-cyclone-interpreter-library-docker-head:
	

8-foment:
	
	foment -X .sld -I . -b srfi-test/r7rs-programs/8.scm

8-foment-library:
	

8-foment-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment:latest bash -c "cd workdir && foment -X .sld -I . -b srfi-test/r7rs-programs/8.scm"

8-foment-library-docker:
	

8-foment-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment:latest bash -c "cd workdir && foment -X .sld -I . -b srfi-test/r7rs-programs/8.scm"

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
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:latest bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . -L ./srfi srfi-test/r7rs-programs/8.scm"

8-guile-library-docker:
	

8-guile-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:latest bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . -L ./srfi srfi-test/r7rs-programs/8.scm"

8-guile-library-docker-head:
	

8-kawa:
	
	kawa --r7rs --full-tailcalls -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/8.scm

8-kawa-library:
	

8-kawa-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:latest bash -c "cd workdir && kawa --r7rs --full-tailcalls -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/8.scm"

8-kawa-library-docker:
	

8-kawa-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:latest bash -c "cd workdir && kawa --r7rs --full-tailcalls -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/8.scm"

8-kawa-library-docker-head:
	

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
	
	mit-scheme --batch-mode --load ./srfi/8.sld ./srfi/1.sld ./srfi/26.sld ./srfi/28.sld ./srfi/39.sld ./srfi/60.sld ./srfi/14.sld ./srfi/13.sld ./srfi/64.sld srfi-test/r7rs-programs/8.scm

8-mit-scheme-library:
	

8-mit-scheme-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --batch-mode --load ./srfi/8.sld ./srfi/1.sld ./srfi/26.sld ./srfi/28.sld ./srfi/39.sld ./srfi/60.sld ./srfi/14.sld ./srfi/13.sld ./srfi/64.sld srfi-test/r7rs-programs/8.scm"

8-mit-scheme-library-docker:
	

8-mit-scheme-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --batch-mode --load ./srfi/8.sld ./srfi/1.sld ./srfi/26.sld ./srfi/28.sld ./srfi/39.sld ./srfi/60.sld ./srfi/14.sld ./srfi/13.sld ./srfi/64.sld srfi-test/r7rs-programs/8.scm"

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
	
	stklos -I . -I ./srfi -f srfi-test/r7rs-programs/8.scm

8-stklos-library:
	

8-stklos-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:latest bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/8.scm"

8-stklos-library-docker:
	

8-stklos-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:latest bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/8.scm"

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
	
	tr7i srfi-test/r7rs-programs/8.scm

8-tr7-library:
	

8-tr7-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:latest bash -c "cd workdir && tr7i srfi-test/r7rs-programs/8.scm"

8-tr7-library-docker:
	

8-tr7-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:latest bash -c "cd workdir && tr7i srfi-test/r7rs-programs/8.scm"

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
	

13-chibi:
	
	chibi-scheme -I . srfi-test/r7rs-programs/13.scm

13-chibi-library:
	

13-chibi-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:latest bash -c "cd workdir && chibi-scheme -I . srfi-test/r7rs-programs/13.scm"

13-chibi-library-docker:
	

13-chibi-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:latest bash -c "cd workdir && chibi-scheme -I . srfi-test/r7rs-programs/13.scm"

13-chibi-library-docker-head:
	

13-chicken-compiler:
	 cp srfi/srfi-13.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-13.scm 
	csc -X r7rs -R r7rs -I ./srfi -o test srfi-test/r7rs-programs/13.scm && ./test

13-chicken-compiler-library:
	 cp srfi/srfi-13.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-13.scm 

13-chicken-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-13.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-13.scm"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csc -X r7rs -R r7rs -I ./srfi -o test srfi-test/r7rs-programs/13.scm && ./test"

13-chicken-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-13.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-13.scm" 

13-chicken-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-13.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-13.scm"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csc -X r7rs -R r7rs -I ./srfi -o test srfi-test/r7rs-programs/13.scm && ./test"

13-chicken-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-13.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-13.scm" 

13-chicken-interpreter:
	 cp srfi/srfi-13.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-13.scm 
	csi -b -R r7rs -I ./ -I ./srfi -script srfi-test/r7rs-programs/13.scm

13-chicken-interpreter-library:
	 cp srfi/srfi-13.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-13.scm 

13-chicken-interpreter-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-13.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-13.scm"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csi -b -R r7rs -I ./ -I ./srfi -script srfi-test/r7rs-programs/13.scm"

13-chicken-interpreter-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-13.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-13.scm" 

13-chicken-interpreter-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-13.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-13.scm"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csi -b -R r7rs -I ./ -I ./srfi -script srfi-test/r7rs-programs/13.scm"

13-chicken-interpreter-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-13.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-13.scm" 

13-cyclone-compiler:
	 cyclone -I . srfi/13.sld 
	cyclone -o ./test -I . srfi-test/r7rs-programs/13.scm && mv srfi-test/r7rs-programs/13 ./test && ./test

13-cyclone-compiler-library:
	 cyclone -I . srfi/13.sld 

13-cyclone-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/13.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -o ./test -I . srfi-test/r7rs-programs/13.scm && mv srfi-test/r7rs-programs/13 ./test && ./test"

13-cyclone-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/13.sld" 

13-cyclone-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/13.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -o ./test -I . srfi-test/r7rs-programs/13.scm && mv srfi-test/r7rs-programs/13 ./test && ./test"

13-cyclone-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/13.sld" 

13-cyclone-interpreter:
	
	icyc -I . -I ./srfi -s srfi-test/r7rs-programs/13.scm

13-cyclone-interpreter-library:
	

13-cyclone-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && icyc -I . -I ./srfi -s srfi-test/r7rs-programs/13.scm"

13-cyclone-interpreter-library-docker:
	

13-cyclone-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && icyc -I . -I ./srfi -s srfi-test/r7rs-programs/13.scm"

13-cyclone-interpreter-library-docker-head:
	

13-foment:
	
	foment -X .sld -I . -b srfi-test/r7rs-programs/13.scm

13-foment-library:
	

13-foment-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment:latest bash -c "cd workdir && foment -X .sld -I . -b srfi-test/r7rs-programs/13.scm"

13-foment-library-docker:
	

13-foment-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment:latest bash -c "cd workdir && foment -X .sld -I . -b srfi-test/r7rs-programs/13.scm"

13-foment-library-docker-head:
	

13-gambit-compiler:
	 ls srfi/13.sld 
	gsc -o ./test -exe -nopreload ./ srfi-test/r7rs-programs/13.scm && ./test

13-gambit-compiler-library:
	 ls srfi/13.sld 

13-gambit-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && ls srfi/13.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsc -o ./test -exe -nopreload ./ srfi-test/r7rs-programs/13.scm && ./test"

13-gambit-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && ls srfi/13.sld" 

13-gambit-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && ls srfi/13.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsc -o ./test -exe -nopreload ./ srfi-test/r7rs-programs/13.scm && ./test"

13-gambit-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && ls srfi/13.sld" 

13-gambit-interpreter:
	
	gsi -:search=./ srfi-test/r7rs-programs/13.scm

13-gambit-interpreter-library:
	

13-gambit-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsi -:search=./ srfi-test/r7rs-programs/13.scm"

13-gambit-interpreter-library-docker:
	

13-gambit-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsi -:search=./ srfi-test/r7rs-programs/13.scm"

13-gambit-interpreter-library-docker-head:
	

13-gauche:
	
	gosh -r7 -I . srfi-test/r7rs-programs/13.scm

13-gauche-library:
	

13-gauche-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:latest bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/13.scm"

13-gauche-library-docker:
	

13-gauche-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:latest bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/13.scm"

13-gauche-library-docker-head:
	

13-gerbil-compiler:
	 gxc srfi/13.sld 
	GERBIL_LOADPATH=. gxc -o ./test --lang r7rs -exe srfi-test/r7rs-programs/13.scm && ./test

13-gerbil-compiler-library:
	 gxc srfi/13.sld 

13-gerbil-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc srfi/13.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && GERBIL_LOADPATH=. gxc -o ./test --lang r7rs -exe srfi-test/r7rs-programs/13.scm && ./test"

13-gerbil-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc srfi/13.sld" 

13-gerbil-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc srfi/13.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && GERBIL_LOADPATH=. gxc -o ./test --lang r7rs -exe srfi-test/r7rs-programs/13.scm && ./test"

13-gerbil-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc srfi/13.sld" 

13-gerbil-interpreter:
	
	GERBIL_LOADPATH=.:./srfi gxi --lang r7rs srfi-test/r7rs-programs/13.scm

13-gerbil-interpreter-library:
	

13-gerbil-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && GERBIL_LOADPATH=.:./srfi gxi --lang r7rs srfi-test/r7rs-programs/13.scm"

13-gerbil-interpreter-library-docker:
	

13-gerbil-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && GERBIL_LOADPATH=.:./srfi gxi --lang r7rs srfi-test/r7rs-programs/13.scm"

13-gerbil-interpreter-library-docker-head:
	

13-guile:
	
	guile --fresh-auto-compile --r7rs -L . -L ./srfi srfi-test/r7rs-programs/13.scm

13-guile-library:
	

13-guile-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:latest bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . -L ./srfi srfi-test/r7rs-programs/13.scm"

13-guile-library-docker:
	

13-guile-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:latest bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . -L ./srfi srfi-test/r7rs-programs/13.scm"

13-guile-library-docker-head:
	

13-kawa:
	
	kawa --r7rs --full-tailcalls -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/13.scm

13-kawa-library:
	

13-kawa-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:latest bash -c "cd workdir && kawa --r7rs --full-tailcalls -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/13.scm"

13-kawa-library-docker:
	

13-kawa-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:latest bash -c "cd workdir && kawa --r7rs --full-tailcalls -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/13.scm"

13-kawa-library-docker-head:
	

13-loko-compiler:
	 ls srfi/13.sld 
	loko -std=r7rs --compile srfi-test/r7rs-programs/13.scm && mv srfi-test/r7rs-programs/13 ./test && ./test

13-loko-compiler-library:
	 ls srfi/13.sld 

13-loko-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && ls srfi/13.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/13.scm && mv srfi-test/r7rs-programs/13 ./test && ./test"

13-loko-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && ls srfi/13.sld" 

13-loko-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && ls srfi/13.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/13.scm && mv srfi-test/r7rs-programs/13 ./test && ./test"

13-loko-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && ls srfi/13.sld" 

13-mit-scheme:
	
	mit-scheme --batch-mode --load ./srfi/8.sld ./srfi/1.sld ./srfi/26.sld ./srfi/28.sld ./srfi/39.sld ./srfi/60.sld ./srfi/14.sld ./srfi/13.sld ./srfi/64.sld srfi-test/r7rs-programs/13.scm

13-mit-scheme-library:
	

13-mit-scheme-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --batch-mode --load ./srfi/8.sld ./srfi/1.sld ./srfi/26.sld ./srfi/28.sld ./srfi/39.sld ./srfi/60.sld ./srfi/14.sld ./srfi/13.sld ./srfi/64.sld srfi-test/r7rs-programs/13.scm"

13-mit-scheme-library-docker:
	

13-mit-scheme-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --batch-mode --load ./srfi/8.sld ./srfi/1.sld ./srfi/26.sld ./srfi/28.sld ./srfi/39.sld ./srfi/60.sld ./srfi/14.sld ./srfi/13.sld ./srfi/64.sld srfi-test/r7rs-programs/13.scm"

13-mit-scheme-library-docker-head:
	

13-mosh:
	
	mosh --loadpath=. srfi-test/r7rs-programs/13.scm

13-mosh-library:
	

13-mosh-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mosh:latest bash -c "cd workdir && mosh --loadpath=. srfi-test/r7rs-programs/13.scm"

13-mosh-library-docker:
	

13-mosh-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mosh:latest bash -c "cd workdir && mosh --loadpath=. srfi-test/r7rs-programs/13.scm"

13-mosh-library-docker-head:
	

13-racket:
	
	racket -I r7rs -S . --script srfi-test/r7rs-programs/13.scm

13-racket-library:
	

13-racket-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:latest bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/13.scm"

13-racket-library-docker:
	

13-racket-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:latest bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/13.scm"

13-racket-library-docker-head:
	

13-sagittarius:
	
	sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/13.scm

13-sagittarius-library:
	

13-sagittarius-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:latest bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/13.scm"

13-sagittarius-library-docker:
	

13-sagittarius-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:latest bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/13.scm"

13-sagittarius-library-docker-head:
	

13-stklos:
	
	stklos -I . -I ./srfi -f srfi-test/r7rs-programs/13.scm

13-stklos-library:
	

13-stklos-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:latest bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/13.scm"

13-stklos-library-docker:
	

13-stklos-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:latest bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/13.scm"

13-stklos-library-docker-head:
	

13-skint:
	
	skint -I ./ --script srfi-test/r7rs-programs/13.scm

13-skint-library:
	

13-skint-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:latest bash -c "cd workdir && skint -I ./ --script srfi-test/r7rs-programs/13.scm"

13-skint-library-docker:
	

13-skint-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:latest bash -c "cd workdir && skint -I ./ --script srfi-test/r7rs-programs/13.scm"

13-skint-library-docker-head:
	

13-tr7:
	
	tr7i srfi-test/r7rs-programs/13.scm

13-tr7-library:
	

13-tr7-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:latest bash -c "cd workdir && tr7i srfi-test/r7rs-programs/13.scm"

13-tr7-library-docker:
	

13-tr7-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:latest bash -c "cd workdir && tr7i srfi-test/r7rs-programs/13.scm"

13-tr7-library-docker-head:
	

13-ypsilon:
	
	ypsilon --r7rs --verbose --warning --sitelib=. --top-level-program srfi-test/r7rs-programs/13.scm

13-ypsilon-library:
	

13-ypsilon-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/ypsilon:latest bash -c "cd workdir && ypsilon --r7rs --verbose --warning --sitelib=. --top-level-program srfi-test/r7rs-programs/13.scm"

13-ypsilon-library-docker:
	

13-ypsilon-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/ypsilon:latest bash -c "cd workdir && ypsilon --r7rs --verbose --warning --sitelib=. --top-level-program srfi-test/r7rs-programs/13.scm"

13-ypsilon-library-docker-head:
	

14-chibi:
	
	chibi-scheme -I . srfi-test/r7rs-programs/14.scm

14-chibi-library:
	

14-chibi-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:latest bash -c "cd workdir && chibi-scheme -I . srfi-test/r7rs-programs/14.scm"

14-chibi-library-docker:
	

14-chibi-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:latest bash -c "cd workdir && chibi-scheme -I . srfi-test/r7rs-programs/14.scm"

14-chibi-library-docker-head:
	

14-chicken-compiler:
	 cp srfi/srfi-14.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-14.scm 
	csc -X r7rs -R r7rs -I ./srfi -o test srfi-test/r7rs-programs/14.scm && ./test

14-chicken-compiler-library:
	 cp srfi/srfi-14.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-14.scm 

14-chicken-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-14.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-14.scm"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csc -X r7rs -R r7rs -I ./srfi -o test srfi-test/r7rs-programs/14.scm && ./test"

14-chicken-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-14.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-14.scm" 

14-chicken-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-14.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-14.scm"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csc -X r7rs -R r7rs -I ./srfi -o test srfi-test/r7rs-programs/14.scm && ./test"

14-chicken-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-14.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-14.scm" 

14-chicken-interpreter:
	 cp srfi/srfi-14.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-14.scm 
	csi -b -R r7rs -I ./ -I ./srfi -script srfi-test/r7rs-programs/14.scm

14-chicken-interpreter-library:
	 cp srfi/srfi-14.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-14.scm 

14-chicken-interpreter-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-14.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-14.scm"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csi -b -R r7rs -I ./ -I ./srfi -script srfi-test/r7rs-programs/14.scm"

14-chicken-interpreter-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-14.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-14.scm" 

14-chicken-interpreter-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-14.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-14.scm"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csi -b -R r7rs -I ./ -I ./srfi -script srfi-test/r7rs-programs/14.scm"

14-chicken-interpreter-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-14.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-14.scm" 

14-cyclone-compiler:
	 cyclone -I . srfi/14.sld 
	cyclone -o ./test -I . srfi-test/r7rs-programs/14.scm && mv srfi-test/r7rs-programs/14 ./test && ./test

14-cyclone-compiler-library:
	 cyclone -I . srfi/14.sld 

14-cyclone-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/14.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -o ./test -I . srfi-test/r7rs-programs/14.scm && mv srfi-test/r7rs-programs/14 ./test && ./test"

14-cyclone-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/14.sld" 

14-cyclone-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/14.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -o ./test -I . srfi-test/r7rs-programs/14.scm && mv srfi-test/r7rs-programs/14 ./test && ./test"

14-cyclone-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/14.sld" 

14-cyclone-interpreter:
	
	icyc -I . -I ./srfi -s srfi-test/r7rs-programs/14.scm

14-cyclone-interpreter-library:
	

14-cyclone-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && icyc -I . -I ./srfi -s srfi-test/r7rs-programs/14.scm"

14-cyclone-interpreter-library-docker:
	

14-cyclone-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && icyc -I . -I ./srfi -s srfi-test/r7rs-programs/14.scm"

14-cyclone-interpreter-library-docker-head:
	

14-foment:
	
	foment -X .sld -I . -b srfi-test/r7rs-programs/14.scm

14-foment-library:
	

14-foment-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment:latest bash -c "cd workdir && foment -X .sld -I . -b srfi-test/r7rs-programs/14.scm"

14-foment-library-docker:
	

14-foment-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment:latest bash -c "cd workdir && foment -X .sld -I . -b srfi-test/r7rs-programs/14.scm"

14-foment-library-docker-head:
	

14-gambit-compiler:
	 ls srfi/14.sld 
	gsc -o ./test -exe -nopreload ./ srfi-test/r7rs-programs/14.scm && ./test

14-gambit-compiler-library:
	 ls srfi/14.sld 

14-gambit-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && ls srfi/14.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsc -o ./test -exe -nopreload ./ srfi-test/r7rs-programs/14.scm && ./test"

14-gambit-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && ls srfi/14.sld" 

14-gambit-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && ls srfi/14.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsc -o ./test -exe -nopreload ./ srfi-test/r7rs-programs/14.scm && ./test"

14-gambit-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && ls srfi/14.sld" 

14-gambit-interpreter:
	
	gsi -:search=./ srfi-test/r7rs-programs/14.scm

14-gambit-interpreter-library:
	

14-gambit-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsi -:search=./ srfi-test/r7rs-programs/14.scm"

14-gambit-interpreter-library-docker:
	

14-gambit-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsi -:search=./ srfi-test/r7rs-programs/14.scm"

14-gambit-interpreter-library-docker-head:
	

14-gauche:
	
	gosh -r7 -I . srfi-test/r7rs-programs/14.scm

14-gauche-library:
	

14-gauche-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:latest bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/14.scm"

14-gauche-library-docker:
	

14-gauche-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:latest bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/14.scm"

14-gauche-library-docker-head:
	

14-gerbil-compiler:
	 gxc srfi/14.sld 
	GERBIL_LOADPATH=. gxc -o ./test --lang r7rs -exe srfi-test/r7rs-programs/14.scm && ./test

14-gerbil-compiler-library:
	 gxc srfi/14.sld 

14-gerbil-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc srfi/14.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && GERBIL_LOADPATH=. gxc -o ./test --lang r7rs -exe srfi-test/r7rs-programs/14.scm && ./test"

14-gerbil-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc srfi/14.sld" 

14-gerbil-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc srfi/14.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && GERBIL_LOADPATH=. gxc -o ./test --lang r7rs -exe srfi-test/r7rs-programs/14.scm && ./test"

14-gerbil-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc srfi/14.sld" 

14-gerbil-interpreter:
	
	GERBIL_LOADPATH=.:./srfi gxi --lang r7rs srfi-test/r7rs-programs/14.scm

14-gerbil-interpreter-library:
	

14-gerbil-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && GERBIL_LOADPATH=.:./srfi gxi --lang r7rs srfi-test/r7rs-programs/14.scm"

14-gerbil-interpreter-library-docker:
	

14-gerbil-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && GERBIL_LOADPATH=.:./srfi gxi --lang r7rs srfi-test/r7rs-programs/14.scm"

14-gerbil-interpreter-library-docker-head:
	

14-guile:
	
	guile --fresh-auto-compile --r7rs -L . -L ./srfi srfi-test/r7rs-programs/14.scm

14-guile-library:
	

14-guile-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:latest bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . -L ./srfi srfi-test/r7rs-programs/14.scm"

14-guile-library-docker:
	

14-guile-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:latest bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . -L ./srfi srfi-test/r7rs-programs/14.scm"

14-guile-library-docker-head:
	

14-kawa:
	
	kawa --r7rs --full-tailcalls -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/14.scm

14-kawa-library:
	

14-kawa-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:latest bash -c "cd workdir && kawa --r7rs --full-tailcalls -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/14.scm"

14-kawa-library-docker:
	

14-kawa-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:latest bash -c "cd workdir && kawa --r7rs --full-tailcalls -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/14.scm"

14-kawa-library-docker-head:
	

14-loko-compiler:
	 ls srfi/14.sld 
	loko -std=r7rs --compile srfi-test/r7rs-programs/14.scm && mv srfi-test/r7rs-programs/14 ./test && ./test

14-loko-compiler-library:
	 ls srfi/14.sld 

14-loko-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && ls srfi/14.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/14.scm && mv srfi-test/r7rs-programs/14 ./test && ./test"

14-loko-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && ls srfi/14.sld" 

14-loko-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && ls srfi/14.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/14.scm && mv srfi-test/r7rs-programs/14 ./test && ./test"

14-loko-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && ls srfi/14.sld" 

14-mit-scheme:
	
	mit-scheme --batch-mode --load ./srfi/8.sld ./srfi/1.sld ./srfi/26.sld ./srfi/28.sld ./srfi/39.sld ./srfi/60.sld ./srfi/14.sld ./srfi/13.sld ./srfi/64.sld srfi-test/r7rs-programs/14.scm

14-mit-scheme-library:
	

14-mit-scheme-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --batch-mode --load ./srfi/8.sld ./srfi/1.sld ./srfi/26.sld ./srfi/28.sld ./srfi/39.sld ./srfi/60.sld ./srfi/14.sld ./srfi/13.sld ./srfi/64.sld srfi-test/r7rs-programs/14.scm"

14-mit-scheme-library-docker:
	

14-mit-scheme-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --batch-mode --load ./srfi/8.sld ./srfi/1.sld ./srfi/26.sld ./srfi/28.sld ./srfi/39.sld ./srfi/60.sld ./srfi/14.sld ./srfi/13.sld ./srfi/64.sld srfi-test/r7rs-programs/14.scm"

14-mit-scheme-library-docker-head:
	

14-mosh:
	
	mosh --loadpath=. srfi-test/r7rs-programs/14.scm

14-mosh-library:
	

14-mosh-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mosh:latest bash -c "cd workdir && mosh --loadpath=. srfi-test/r7rs-programs/14.scm"

14-mosh-library-docker:
	

14-mosh-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mosh:latest bash -c "cd workdir && mosh --loadpath=. srfi-test/r7rs-programs/14.scm"

14-mosh-library-docker-head:
	

14-racket:
	
	racket -I r7rs -S . --script srfi-test/r7rs-programs/14.scm

14-racket-library:
	

14-racket-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:latest bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/14.scm"

14-racket-library-docker:
	

14-racket-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:latest bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/14.scm"

14-racket-library-docker-head:
	

14-sagittarius:
	
	sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/14.scm

14-sagittarius-library:
	

14-sagittarius-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:latest bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/14.scm"

14-sagittarius-library-docker:
	

14-sagittarius-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:latest bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/14.scm"

14-sagittarius-library-docker-head:
	

14-stklos:
	
	stklos -I . -I ./srfi -f srfi-test/r7rs-programs/14.scm

14-stklos-library:
	

14-stklos-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:latest bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/14.scm"

14-stklos-library-docker:
	

14-stklos-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:latest bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/14.scm"

14-stklos-library-docker-head:
	

14-skint:
	
	skint -I ./ --script srfi-test/r7rs-programs/14.scm

14-skint-library:
	

14-skint-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:latest bash -c "cd workdir && skint -I ./ --script srfi-test/r7rs-programs/14.scm"

14-skint-library-docker:
	

14-skint-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:latest bash -c "cd workdir && skint -I ./ --script srfi-test/r7rs-programs/14.scm"

14-skint-library-docker-head:
	

14-tr7:
	
	tr7i srfi-test/r7rs-programs/14.scm

14-tr7-library:
	

14-tr7-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:latest bash -c "cd workdir && tr7i srfi-test/r7rs-programs/14.scm"

14-tr7-library-docker:
	

14-tr7-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:latest bash -c "cd workdir && tr7i srfi-test/r7rs-programs/14.scm"

14-tr7-library-docker-head:
	

14-ypsilon:
	
	ypsilon --r7rs --verbose --warning --sitelib=. --top-level-program srfi-test/r7rs-programs/14.scm

14-ypsilon-library:
	

14-ypsilon-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/ypsilon:latest bash -c "cd workdir && ypsilon --r7rs --verbose --warning --sitelib=. --top-level-program srfi-test/r7rs-programs/14.scm"

14-ypsilon-library-docker:
	

14-ypsilon-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/ypsilon:latest bash -c "cd workdir && ypsilon --r7rs --verbose --warning --sitelib=. --top-level-program srfi-test/r7rs-programs/14.scm"

14-ypsilon-library-docker-head:
	

26-chibi:
	
	chibi-scheme -I . srfi-test/r7rs-programs/26.scm

26-chibi-library:
	

26-chibi-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:latest bash -c "cd workdir && chibi-scheme -I . srfi-test/r7rs-programs/26.scm"

26-chibi-library-docker:
	

26-chibi-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:latest bash -c "cd workdir && chibi-scheme -I . srfi-test/r7rs-programs/26.scm"

26-chibi-library-docker-head:
	

26-chicken-compiler:
	 cp srfi/srfi-26.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-26.scm 
	csc -X r7rs -R r7rs -I ./srfi -o test srfi-test/r7rs-programs/26.scm && ./test

26-chicken-compiler-library:
	 cp srfi/srfi-26.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-26.scm 

26-chicken-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-26.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-26.scm"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csc -X r7rs -R r7rs -I ./srfi -o test srfi-test/r7rs-programs/26.scm && ./test"

26-chicken-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-26.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-26.scm" 

26-chicken-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-26.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-26.scm"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csc -X r7rs -R r7rs -I ./srfi -o test srfi-test/r7rs-programs/26.scm && ./test"

26-chicken-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-26.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-26.scm" 

26-chicken-interpreter:
	 cp srfi/srfi-26.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-26.scm 
	csi -b -R r7rs -I ./ -I ./srfi -script srfi-test/r7rs-programs/26.scm

26-chicken-interpreter-library:
	 cp srfi/srfi-26.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-26.scm 

26-chicken-interpreter-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-26.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-26.scm"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csi -b -R r7rs -I ./ -I ./srfi -script srfi-test/r7rs-programs/26.scm"

26-chicken-interpreter-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-26.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-26.scm" 

26-chicken-interpreter-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-26.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-26.scm"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csi -b -R r7rs -I ./ -I ./srfi -script srfi-test/r7rs-programs/26.scm"

26-chicken-interpreter-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-26.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-26.scm" 

26-cyclone-compiler:
	 cyclone -I . srfi/26.sld 
	cyclone -o ./test -I . srfi-test/r7rs-programs/26.scm && mv srfi-test/r7rs-programs/26 ./test && ./test

26-cyclone-compiler-library:
	 cyclone -I . srfi/26.sld 

26-cyclone-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/26.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -o ./test -I . srfi-test/r7rs-programs/26.scm && mv srfi-test/r7rs-programs/26 ./test && ./test"

26-cyclone-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/26.sld" 

26-cyclone-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/26.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -o ./test -I . srfi-test/r7rs-programs/26.scm && mv srfi-test/r7rs-programs/26 ./test && ./test"

26-cyclone-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/26.sld" 

26-cyclone-interpreter:
	
	icyc -I . -I ./srfi -s srfi-test/r7rs-programs/26.scm

26-cyclone-interpreter-library:
	

26-cyclone-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && icyc -I . -I ./srfi -s srfi-test/r7rs-programs/26.scm"

26-cyclone-interpreter-library-docker:
	

26-cyclone-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && icyc -I . -I ./srfi -s srfi-test/r7rs-programs/26.scm"

26-cyclone-interpreter-library-docker-head:
	

26-foment:
	
	foment -X .sld -I . -b srfi-test/r7rs-programs/26.scm

26-foment-library:
	

26-foment-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment:latest bash -c "cd workdir && foment -X .sld -I . -b srfi-test/r7rs-programs/26.scm"

26-foment-library-docker:
	

26-foment-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment:latest bash -c "cd workdir && foment -X .sld -I . -b srfi-test/r7rs-programs/26.scm"

26-foment-library-docker-head:
	

26-gambit-compiler:
	 ls srfi/26.sld 
	gsc -o ./test -exe -nopreload ./ srfi-test/r7rs-programs/26.scm && ./test

26-gambit-compiler-library:
	 ls srfi/26.sld 

26-gambit-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && ls srfi/26.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsc -o ./test -exe -nopreload ./ srfi-test/r7rs-programs/26.scm && ./test"

26-gambit-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && ls srfi/26.sld" 

26-gambit-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && ls srfi/26.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsc -o ./test -exe -nopreload ./ srfi-test/r7rs-programs/26.scm && ./test"

26-gambit-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && ls srfi/26.sld" 

26-gambit-interpreter:
	
	gsi -:search=./ srfi-test/r7rs-programs/26.scm

26-gambit-interpreter-library:
	

26-gambit-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsi -:search=./ srfi-test/r7rs-programs/26.scm"

26-gambit-interpreter-library-docker:
	

26-gambit-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsi -:search=./ srfi-test/r7rs-programs/26.scm"

26-gambit-interpreter-library-docker-head:
	

26-gauche:
	
	gosh -r7 -I . srfi-test/r7rs-programs/26.scm

26-gauche-library:
	

26-gauche-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:latest bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/26.scm"

26-gauche-library-docker:
	

26-gauche-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:latest bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/26.scm"

26-gauche-library-docker-head:
	

26-gerbil-compiler:
	 gxc srfi/26.sld 
	GERBIL_LOADPATH=. gxc -o ./test --lang r7rs -exe srfi-test/r7rs-programs/26.scm && ./test

26-gerbil-compiler-library:
	 gxc srfi/26.sld 

26-gerbil-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc srfi/26.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && GERBIL_LOADPATH=. gxc -o ./test --lang r7rs -exe srfi-test/r7rs-programs/26.scm && ./test"

26-gerbil-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc srfi/26.sld" 

26-gerbil-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc srfi/26.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && GERBIL_LOADPATH=. gxc -o ./test --lang r7rs -exe srfi-test/r7rs-programs/26.scm && ./test"

26-gerbil-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc srfi/26.sld" 

26-gerbil-interpreter:
	
	GERBIL_LOADPATH=.:./srfi gxi --lang r7rs srfi-test/r7rs-programs/26.scm

26-gerbil-interpreter-library:
	

26-gerbil-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && GERBIL_LOADPATH=.:./srfi gxi --lang r7rs srfi-test/r7rs-programs/26.scm"

26-gerbil-interpreter-library-docker:
	

26-gerbil-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && GERBIL_LOADPATH=.:./srfi gxi --lang r7rs srfi-test/r7rs-programs/26.scm"

26-gerbil-interpreter-library-docker-head:
	

26-guile:
	
	guile --fresh-auto-compile --r7rs -L . -L ./srfi srfi-test/r7rs-programs/26.scm

26-guile-library:
	

26-guile-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:latest bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . -L ./srfi srfi-test/r7rs-programs/26.scm"

26-guile-library-docker:
	

26-guile-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:latest bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . -L ./srfi srfi-test/r7rs-programs/26.scm"

26-guile-library-docker-head:
	

26-kawa:
	
	kawa --r7rs --full-tailcalls -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/26.scm

26-kawa-library:
	

26-kawa-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:latest bash -c "cd workdir && kawa --r7rs --full-tailcalls -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/26.scm"

26-kawa-library-docker:
	

26-kawa-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:latest bash -c "cd workdir && kawa --r7rs --full-tailcalls -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/26.scm"

26-kawa-library-docker-head:
	

26-loko-compiler:
	 ls srfi/26.sld 
	loko -std=r7rs --compile srfi-test/r7rs-programs/26.scm && mv srfi-test/r7rs-programs/26 ./test && ./test

26-loko-compiler-library:
	 ls srfi/26.sld 

26-loko-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && ls srfi/26.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/26.scm && mv srfi-test/r7rs-programs/26 ./test && ./test"

26-loko-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && ls srfi/26.sld" 

26-loko-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && ls srfi/26.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/26.scm && mv srfi-test/r7rs-programs/26 ./test && ./test"

26-loko-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && ls srfi/26.sld" 

26-mit-scheme:
	
	mit-scheme --batch-mode --load ./srfi/8.sld ./srfi/1.sld ./srfi/26.sld ./srfi/28.sld ./srfi/39.sld ./srfi/60.sld ./srfi/14.sld ./srfi/13.sld ./srfi/64.sld srfi-test/r7rs-programs/26.scm

26-mit-scheme-library:
	

26-mit-scheme-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --batch-mode --load ./srfi/8.sld ./srfi/1.sld ./srfi/26.sld ./srfi/28.sld ./srfi/39.sld ./srfi/60.sld ./srfi/14.sld ./srfi/13.sld ./srfi/64.sld srfi-test/r7rs-programs/26.scm"

26-mit-scheme-library-docker:
	

26-mit-scheme-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --batch-mode --load ./srfi/8.sld ./srfi/1.sld ./srfi/26.sld ./srfi/28.sld ./srfi/39.sld ./srfi/60.sld ./srfi/14.sld ./srfi/13.sld ./srfi/64.sld srfi-test/r7rs-programs/26.scm"

26-mit-scheme-library-docker-head:
	

26-mosh:
	
	mosh --loadpath=. srfi-test/r7rs-programs/26.scm

26-mosh-library:
	

26-mosh-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mosh:latest bash -c "cd workdir && mosh --loadpath=. srfi-test/r7rs-programs/26.scm"

26-mosh-library-docker:
	

26-mosh-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mosh:latest bash -c "cd workdir && mosh --loadpath=. srfi-test/r7rs-programs/26.scm"

26-mosh-library-docker-head:
	

26-racket:
	
	racket -I r7rs -S . --script srfi-test/r7rs-programs/26.scm

26-racket-library:
	

26-racket-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:latest bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/26.scm"

26-racket-library-docker:
	

26-racket-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:latest bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/26.scm"

26-racket-library-docker-head:
	

26-sagittarius:
	
	sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/26.scm

26-sagittarius-library:
	

26-sagittarius-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:latest bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/26.scm"

26-sagittarius-library-docker:
	

26-sagittarius-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:latest bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/26.scm"

26-sagittarius-library-docker-head:
	

26-stklos:
	
	stklos -I . -I ./srfi -f srfi-test/r7rs-programs/26.scm

26-stklos-library:
	

26-stklos-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:latest bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/26.scm"

26-stklos-library-docker:
	

26-stklos-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:latest bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/26.scm"

26-stklos-library-docker-head:
	

26-skint:
	
	skint -I ./ --script srfi-test/r7rs-programs/26.scm

26-skint-library:
	

26-skint-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:latest bash -c "cd workdir && skint -I ./ --script srfi-test/r7rs-programs/26.scm"

26-skint-library-docker:
	

26-skint-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:latest bash -c "cd workdir && skint -I ./ --script srfi-test/r7rs-programs/26.scm"

26-skint-library-docker-head:
	

26-tr7:
	
	tr7i srfi-test/r7rs-programs/26.scm

26-tr7-library:
	

26-tr7-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:latest bash -c "cd workdir && tr7i srfi-test/r7rs-programs/26.scm"

26-tr7-library-docker:
	

26-tr7-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:latest bash -c "cd workdir && tr7i srfi-test/r7rs-programs/26.scm"

26-tr7-library-docker-head:
	

26-ypsilon:
	
	ypsilon --r7rs --verbose --warning --sitelib=. --top-level-program srfi-test/r7rs-programs/26.scm

26-ypsilon-library:
	

26-ypsilon-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/ypsilon:latest bash -c "cd workdir && ypsilon --r7rs --verbose --warning --sitelib=. --top-level-program srfi-test/r7rs-programs/26.scm"

26-ypsilon-library-docker:
	

26-ypsilon-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/ypsilon:latest bash -c "cd workdir && ypsilon --r7rs --verbose --warning --sitelib=. --top-level-program srfi-test/r7rs-programs/26.scm"

26-ypsilon-library-docker-head:
	

28-chibi:
	
	chibi-scheme -I . srfi-test/r7rs-programs/28.scm

28-chibi-library:
	

28-chibi-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:latest bash -c "cd workdir && chibi-scheme -I . srfi-test/r7rs-programs/28.scm"

28-chibi-library-docker:
	

28-chibi-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:latest bash -c "cd workdir && chibi-scheme -I . srfi-test/r7rs-programs/28.scm"

28-chibi-library-docker-head:
	

28-chicken-compiler:
	 cp srfi/srfi-28.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-28.scm 
	csc -X r7rs -R r7rs -I ./srfi -o test srfi-test/r7rs-programs/28.scm && ./test

28-chicken-compiler-library:
	 cp srfi/srfi-28.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-28.scm 

28-chicken-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-28.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-28.scm"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csc -X r7rs -R r7rs -I ./srfi -o test srfi-test/r7rs-programs/28.scm && ./test"

28-chicken-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-28.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-28.scm" 

28-chicken-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-28.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-28.scm"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csc -X r7rs -R r7rs -I ./srfi -o test srfi-test/r7rs-programs/28.scm && ./test"

28-chicken-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-28.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-28.scm" 

28-chicken-interpreter:
	 cp srfi/srfi-28.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-28.scm 
	csi -b -R r7rs -I ./ -I ./srfi -script srfi-test/r7rs-programs/28.scm

28-chicken-interpreter-library:
	 cp srfi/srfi-28.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-28.scm 

28-chicken-interpreter-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-28.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-28.scm"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csi -b -R r7rs -I ./ -I ./srfi -script srfi-test/r7rs-programs/28.scm"

28-chicken-interpreter-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-28.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-28.scm" 

28-chicken-interpreter-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-28.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-28.scm"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csi -b -R r7rs -I ./ -I ./srfi -script srfi-test/r7rs-programs/28.scm"

28-chicken-interpreter-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-28.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-28.scm" 

28-cyclone-compiler:
	 cyclone -I . srfi/28.sld 
	cyclone -o ./test -I . srfi-test/r7rs-programs/28.scm && mv srfi-test/r7rs-programs/28 ./test && ./test

28-cyclone-compiler-library:
	 cyclone -I . srfi/28.sld 

28-cyclone-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/28.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -o ./test -I . srfi-test/r7rs-programs/28.scm && mv srfi-test/r7rs-programs/28 ./test && ./test"

28-cyclone-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/28.sld" 

28-cyclone-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/28.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -o ./test -I . srfi-test/r7rs-programs/28.scm && mv srfi-test/r7rs-programs/28 ./test && ./test"

28-cyclone-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/28.sld" 

28-cyclone-interpreter:
	
	icyc -I . -I ./srfi -s srfi-test/r7rs-programs/28.scm

28-cyclone-interpreter-library:
	

28-cyclone-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && icyc -I . -I ./srfi -s srfi-test/r7rs-programs/28.scm"

28-cyclone-interpreter-library-docker:
	

28-cyclone-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && icyc -I . -I ./srfi -s srfi-test/r7rs-programs/28.scm"

28-cyclone-interpreter-library-docker-head:
	

28-foment:
	
	foment -X .sld -I . -b srfi-test/r7rs-programs/28.scm

28-foment-library:
	

28-foment-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment:latest bash -c "cd workdir && foment -X .sld -I . -b srfi-test/r7rs-programs/28.scm"

28-foment-library-docker:
	

28-foment-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment:latest bash -c "cd workdir && foment -X .sld -I . -b srfi-test/r7rs-programs/28.scm"

28-foment-library-docker-head:
	

28-gambit-compiler:
	 ls srfi/28.sld 
	gsc -o ./test -exe -nopreload ./ srfi-test/r7rs-programs/28.scm && ./test

28-gambit-compiler-library:
	 ls srfi/28.sld 

28-gambit-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && ls srfi/28.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsc -o ./test -exe -nopreload ./ srfi-test/r7rs-programs/28.scm && ./test"

28-gambit-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && ls srfi/28.sld" 

28-gambit-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && ls srfi/28.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsc -o ./test -exe -nopreload ./ srfi-test/r7rs-programs/28.scm && ./test"

28-gambit-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && ls srfi/28.sld" 

28-gambit-interpreter:
	
	gsi -:search=./ srfi-test/r7rs-programs/28.scm

28-gambit-interpreter-library:
	

28-gambit-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsi -:search=./ srfi-test/r7rs-programs/28.scm"

28-gambit-interpreter-library-docker:
	

28-gambit-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsi -:search=./ srfi-test/r7rs-programs/28.scm"

28-gambit-interpreter-library-docker-head:
	

28-gauche:
	
	gosh -r7 -I . srfi-test/r7rs-programs/28.scm

28-gauche-library:
	

28-gauche-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:latest bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/28.scm"

28-gauche-library-docker:
	

28-gauche-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:latest bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/28.scm"

28-gauche-library-docker-head:
	

28-gerbil-compiler:
	 gxc srfi/28.sld 
	GERBIL_LOADPATH=. gxc -o ./test --lang r7rs -exe srfi-test/r7rs-programs/28.scm && ./test

28-gerbil-compiler-library:
	 gxc srfi/28.sld 

28-gerbil-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc srfi/28.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && GERBIL_LOADPATH=. gxc -o ./test --lang r7rs -exe srfi-test/r7rs-programs/28.scm && ./test"

28-gerbil-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc srfi/28.sld" 

28-gerbil-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc srfi/28.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && GERBIL_LOADPATH=. gxc -o ./test --lang r7rs -exe srfi-test/r7rs-programs/28.scm && ./test"

28-gerbil-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc srfi/28.sld" 

28-gerbil-interpreter:
	
	GERBIL_LOADPATH=.:./srfi gxi --lang r7rs srfi-test/r7rs-programs/28.scm

28-gerbil-interpreter-library:
	

28-gerbil-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && GERBIL_LOADPATH=.:./srfi gxi --lang r7rs srfi-test/r7rs-programs/28.scm"

28-gerbil-interpreter-library-docker:
	

28-gerbil-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && GERBIL_LOADPATH=.:./srfi gxi --lang r7rs srfi-test/r7rs-programs/28.scm"

28-gerbil-interpreter-library-docker-head:
	

28-guile:
	
	guile --fresh-auto-compile --r7rs -L . -L ./srfi srfi-test/r7rs-programs/28.scm

28-guile-library:
	

28-guile-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:latest bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . -L ./srfi srfi-test/r7rs-programs/28.scm"

28-guile-library-docker:
	

28-guile-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:latest bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . -L ./srfi srfi-test/r7rs-programs/28.scm"

28-guile-library-docker-head:
	

28-kawa:
	
	kawa --r7rs --full-tailcalls -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/28.scm

28-kawa-library:
	

28-kawa-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:latest bash -c "cd workdir && kawa --r7rs --full-tailcalls -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/28.scm"

28-kawa-library-docker:
	

28-kawa-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:latest bash -c "cd workdir && kawa --r7rs --full-tailcalls -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/28.scm"

28-kawa-library-docker-head:
	

28-loko-compiler:
	 ls srfi/28.sld 
	loko -std=r7rs --compile srfi-test/r7rs-programs/28.scm && mv srfi-test/r7rs-programs/28 ./test && ./test

28-loko-compiler-library:
	 ls srfi/28.sld 

28-loko-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && ls srfi/28.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/28.scm && mv srfi-test/r7rs-programs/28 ./test && ./test"

28-loko-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && ls srfi/28.sld" 

28-loko-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && ls srfi/28.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/28.scm && mv srfi-test/r7rs-programs/28 ./test && ./test"

28-loko-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && ls srfi/28.sld" 

28-mit-scheme:
	
	mit-scheme --batch-mode --load ./srfi/8.sld ./srfi/1.sld ./srfi/26.sld ./srfi/28.sld ./srfi/39.sld ./srfi/60.sld ./srfi/14.sld ./srfi/13.sld ./srfi/64.sld srfi-test/r7rs-programs/28.scm

28-mit-scheme-library:
	

28-mit-scheme-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --batch-mode --load ./srfi/8.sld ./srfi/1.sld ./srfi/26.sld ./srfi/28.sld ./srfi/39.sld ./srfi/60.sld ./srfi/14.sld ./srfi/13.sld ./srfi/64.sld srfi-test/r7rs-programs/28.scm"

28-mit-scheme-library-docker:
	

28-mit-scheme-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --batch-mode --load ./srfi/8.sld ./srfi/1.sld ./srfi/26.sld ./srfi/28.sld ./srfi/39.sld ./srfi/60.sld ./srfi/14.sld ./srfi/13.sld ./srfi/64.sld srfi-test/r7rs-programs/28.scm"

28-mit-scheme-library-docker-head:
	

28-mosh:
	
	mosh --loadpath=. srfi-test/r7rs-programs/28.scm

28-mosh-library:
	

28-mosh-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mosh:latest bash -c "cd workdir && mosh --loadpath=. srfi-test/r7rs-programs/28.scm"

28-mosh-library-docker:
	

28-mosh-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mosh:latest bash -c "cd workdir && mosh --loadpath=. srfi-test/r7rs-programs/28.scm"

28-mosh-library-docker-head:
	

28-racket:
	
	racket -I r7rs -S . --script srfi-test/r7rs-programs/28.scm

28-racket-library:
	

28-racket-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:latest bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/28.scm"

28-racket-library-docker:
	

28-racket-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:latest bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/28.scm"

28-racket-library-docker-head:
	

28-sagittarius:
	
	sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/28.scm

28-sagittarius-library:
	

28-sagittarius-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:latest bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/28.scm"

28-sagittarius-library-docker:
	

28-sagittarius-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:latest bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/28.scm"

28-sagittarius-library-docker-head:
	

28-stklos:
	
	stklos -I . -I ./srfi -f srfi-test/r7rs-programs/28.scm

28-stklos-library:
	

28-stklos-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:latest bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/28.scm"

28-stklos-library-docker:
	

28-stklos-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:latest bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/28.scm"

28-stklos-library-docker-head:
	

28-skint:
	
	skint -I ./ --script srfi-test/r7rs-programs/28.scm

28-skint-library:
	

28-skint-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:latest bash -c "cd workdir && skint -I ./ --script srfi-test/r7rs-programs/28.scm"

28-skint-library-docker:
	

28-skint-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:latest bash -c "cd workdir && skint -I ./ --script srfi-test/r7rs-programs/28.scm"

28-skint-library-docker-head:
	

28-tr7:
	
	tr7i srfi-test/r7rs-programs/28.scm

28-tr7-library:
	

28-tr7-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:latest bash -c "cd workdir && tr7i srfi-test/r7rs-programs/28.scm"

28-tr7-library-docker:
	

28-tr7-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:latest bash -c "cd workdir && tr7i srfi-test/r7rs-programs/28.scm"

28-tr7-library-docker-head:
	

28-ypsilon:
	
	ypsilon --r7rs --verbose --warning --sitelib=. --top-level-program srfi-test/r7rs-programs/28.scm

28-ypsilon-library:
	

28-ypsilon-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/ypsilon:latest bash -c "cd workdir && ypsilon --r7rs --verbose --warning --sitelib=. --top-level-program srfi-test/r7rs-programs/28.scm"

28-ypsilon-library-docker:
	

28-ypsilon-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/ypsilon:latest bash -c "cd workdir && ypsilon --r7rs --verbose --warning --sitelib=. --top-level-program srfi-test/r7rs-programs/28.scm"

28-ypsilon-library-docker-head:
	

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
	
	icyc -I . -I ./srfi -s srfi-test/r7rs-programs/39.scm

39-cyclone-interpreter-library:
	

39-cyclone-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && icyc -I . -I ./srfi -s srfi-test/r7rs-programs/39.scm"

39-cyclone-interpreter-library-docker:
	

39-cyclone-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && icyc -I . -I ./srfi -s srfi-test/r7rs-programs/39.scm"

39-cyclone-interpreter-library-docker-head:
	

39-foment:
	
	foment -X .sld -I . -b srfi-test/r7rs-programs/39.scm

39-foment-library:
	

39-foment-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment:latest bash -c "cd workdir && foment -X .sld -I . -b srfi-test/r7rs-programs/39.scm"

39-foment-library-docker:
	

39-foment-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment:latest bash -c "cd workdir && foment -X .sld -I . -b srfi-test/r7rs-programs/39.scm"

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
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:latest bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . -L ./srfi srfi-test/r7rs-programs/39.scm"

39-guile-library-docker:
	

39-guile-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:latest bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . -L ./srfi srfi-test/r7rs-programs/39.scm"

39-guile-library-docker-head:
	

39-kawa:
	
	kawa --r7rs --full-tailcalls -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/39.scm

39-kawa-library:
	

39-kawa-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:latest bash -c "cd workdir && kawa --r7rs --full-tailcalls -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/39.scm"

39-kawa-library-docker:
	

39-kawa-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:latest bash -c "cd workdir && kawa --r7rs --full-tailcalls -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/39.scm"

39-kawa-library-docker-head:
	

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
	
	mit-scheme --batch-mode --load ./srfi/8.sld ./srfi/1.sld ./srfi/26.sld ./srfi/28.sld ./srfi/39.sld ./srfi/60.sld ./srfi/14.sld ./srfi/13.sld ./srfi/64.sld srfi-test/r7rs-programs/39.scm

39-mit-scheme-library:
	

39-mit-scheme-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --batch-mode --load ./srfi/8.sld ./srfi/1.sld ./srfi/26.sld ./srfi/28.sld ./srfi/39.sld ./srfi/60.sld ./srfi/14.sld ./srfi/13.sld ./srfi/64.sld srfi-test/r7rs-programs/39.scm"

39-mit-scheme-library-docker:
	

39-mit-scheme-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --batch-mode --load ./srfi/8.sld ./srfi/1.sld ./srfi/26.sld ./srfi/28.sld ./srfi/39.sld ./srfi/60.sld ./srfi/14.sld ./srfi/13.sld ./srfi/64.sld srfi-test/r7rs-programs/39.scm"

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
	
	stklos -I . -I ./srfi -f srfi-test/r7rs-programs/39.scm

39-stklos-library:
	

39-stklos-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:latest bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/39.scm"

39-stklos-library-docker:
	

39-stklos-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:latest bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/39.scm"

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
	
	tr7i srfi-test/r7rs-programs/39.scm

39-tr7-library:
	

39-tr7-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:latest bash -c "cd workdir && tr7i srfi-test/r7rs-programs/39.scm"

39-tr7-library-docker:
	

39-tr7-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:latest bash -c "cd workdir && tr7i srfi-test/r7rs-programs/39.scm"

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
	

60-chibi:
	
	chibi-scheme -I . srfi-test/r7rs-programs/60.scm

60-chibi-library:
	

60-chibi-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:latest bash -c "cd workdir && chibi-scheme -I . srfi-test/r7rs-programs/60.scm"

60-chibi-library-docker:
	

60-chibi-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:latest bash -c "cd workdir && chibi-scheme -I . srfi-test/r7rs-programs/60.scm"

60-chibi-library-docker-head:
	

60-chicken-compiler:
	 cp srfi/srfi-60.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-60.scm 
	csc -X r7rs -R r7rs -I ./srfi -o test srfi-test/r7rs-programs/60.scm && ./test

60-chicken-compiler-library:
	 cp srfi/srfi-60.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-60.scm 

60-chicken-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-60.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-60.scm"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csc -X r7rs -R r7rs -I ./srfi -o test srfi-test/r7rs-programs/60.scm && ./test"

60-chicken-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-60.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-60.scm" 

60-chicken-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-60.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-60.scm"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csc -X r7rs -R r7rs -I ./srfi -o test srfi-test/r7rs-programs/60.scm && ./test"

60-chicken-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-60.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-60.scm" 

60-chicken-interpreter:
	 cp srfi/srfi-60.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-60.scm 
	csi -b -R r7rs -I ./ -I ./srfi -script srfi-test/r7rs-programs/60.scm

60-chicken-interpreter-library:
	 cp srfi/srfi-60.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-60.scm 

60-chicken-interpreter-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-60.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-60.scm"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csi -b -R r7rs -I ./ -I ./srfi -script srfi-test/r7rs-programs/60.scm"

60-chicken-interpreter-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-60.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-60.scm" 

60-chicken-interpreter-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-60.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-60.scm"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csi -b -R r7rs -I ./ -I ./srfi -script srfi-test/r7rs-programs/60.scm"

60-chicken-interpreter-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/srfi-60.scm . && csc -X r7rs -R r7rs -I ./srfi -s -J srfi-60.scm" 

60-cyclone-compiler:
	 cyclone -I . srfi/60.sld 
	cyclone -o ./test -I . srfi-test/r7rs-programs/60.scm && mv srfi-test/r7rs-programs/60 ./test && ./test

60-cyclone-compiler-library:
	 cyclone -I . srfi/60.sld 

60-cyclone-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/60.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -o ./test -I . srfi-test/r7rs-programs/60.scm && mv srfi-test/r7rs-programs/60 ./test && ./test"

60-cyclone-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/60.sld" 

60-cyclone-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/60.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -o ./test -I . srfi-test/r7rs-programs/60.scm && mv srfi-test/r7rs-programs/60 ./test && ./test"

60-cyclone-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/60.sld" 

60-cyclone-interpreter:
	
	icyc -I . -I ./srfi -s srfi-test/r7rs-programs/60.scm

60-cyclone-interpreter-library:
	

60-cyclone-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && icyc -I . -I ./srfi -s srfi-test/r7rs-programs/60.scm"

60-cyclone-interpreter-library-docker:
	

60-cyclone-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && icyc -I . -I ./srfi -s srfi-test/r7rs-programs/60.scm"

60-cyclone-interpreter-library-docker-head:
	

60-foment:
	
	foment -X .sld -I . -b srfi-test/r7rs-programs/60.scm

60-foment-library:
	

60-foment-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment:latest bash -c "cd workdir && foment -X .sld -I . -b srfi-test/r7rs-programs/60.scm"

60-foment-library-docker:
	

60-foment-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment:latest bash -c "cd workdir && foment -X .sld -I . -b srfi-test/r7rs-programs/60.scm"

60-foment-library-docker-head:
	

60-gambit-compiler:
	 ls srfi/60.sld 
	gsc -o ./test -exe -nopreload ./ srfi-test/r7rs-programs/60.scm && ./test

60-gambit-compiler-library:
	 ls srfi/60.sld 

60-gambit-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && ls srfi/60.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsc -o ./test -exe -nopreload ./ srfi-test/r7rs-programs/60.scm && ./test"

60-gambit-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && ls srfi/60.sld" 

60-gambit-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && ls srfi/60.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsc -o ./test -exe -nopreload ./ srfi-test/r7rs-programs/60.scm && ./test"

60-gambit-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && ls srfi/60.sld" 

60-gambit-interpreter:
	
	gsi -:search=./ srfi-test/r7rs-programs/60.scm

60-gambit-interpreter-library:
	

60-gambit-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsi -:search=./ srfi-test/r7rs-programs/60.scm"

60-gambit-interpreter-library-docker:
	

60-gambit-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsi -:search=./ srfi-test/r7rs-programs/60.scm"

60-gambit-interpreter-library-docker-head:
	

60-gauche:
	
	gosh -r7 -I . srfi-test/r7rs-programs/60.scm

60-gauche-library:
	

60-gauche-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:latest bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/60.scm"

60-gauche-library-docker:
	

60-gauche-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:latest bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/60.scm"

60-gauche-library-docker-head:
	

60-gerbil-compiler:
	 gxc srfi/60.sld 
	GERBIL_LOADPATH=. gxc -o ./test --lang r7rs -exe srfi-test/r7rs-programs/60.scm && ./test

60-gerbil-compiler-library:
	 gxc srfi/60.sld 

60-gerbil-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc srfi/60.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && GERBIL_LOADPATH=. gxc -o ./test --lang r7rs -exe srfi-test/r7rs-programs/60.scm && ./test"

60-gerbil-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc srfi/60.sld" 

60-gerbil-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc srfi/60.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && GERBIL_LOADPATH=. gxc -o ./test --lang r7rs -exe srfi-test/r7rs-programs/60.scm && ./test"

60-gerbil-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc srfi/60.sld" 

60-gerbil-interpreter:
	
	GERBIL_LOADPATH=.:./srfi gxi --lang r7rs srfi-test/r7rs-programs/60.scm

60-gerbil-interpreter-library:
	

60-gerbil-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && GERBIL_LOADPATH=.:./srfi gxi --lang r7rs srfi-test/r7rs-programs/60.scm"

60-gerbil-interpreter-library-docker:
	

60-gerbil-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && GERBIL_LOADPATH=.:./srfi gxi --lang r7rs srfi-test/r7rs-programs/60.scm"

60-gerbil-interpreter-library-docker-head:
	

60-guile:
	
	guile --fresh-auto-compile --r7rs -L . -L ./srfi srfi-test/r7rs-programs/60.scm

60-guile-library:
	

60-guile-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:latest bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . -L ./srfi srfi-test/r7rs-programs/60.scm"

60-guile-library-docker:
	

60-guile-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:latest bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . -L ./srfi srfi-test/r7rs-programs/60.scm"

60-guile-library-docker-head:
	

60-kawa:
	
	kawa --r7rs --full-tailcalls -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/60.scm

60-kawa-library:
	

60-kawa-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:latest bash -c "cd workdir && kawa --r7rs --full-tailcalls -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/60.scm"

60-kawa-library-docker:
	

60-kawa-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:latest bash -c "cd workdir && kawa --r7rs --full-tailcalls -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/60.scm"

60-kawa-library-docker-head:
	

60-loko-compiler:
	 ls srfi/60.sld 
	loko -std=r7rs --compile srfi-test/r7rs-programs/60.scm && mv srfi-test/r7rs-programs/60 ./test && ./test

60-loko-compiler-library:
	 ls srfi/60.sld 

60-loko-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && ls srfi/60.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/60.scm && mv srfi-test/r7rs-programs/60 ./test && ./test"

60-loko-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && ls srfi/60.sld" 

60-loko-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && ls srfi/60.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/60.scm && mv srfi-test/r7rs-programs/60 ./test && ./test"

60-loko-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && ls srfi/60.sld" 

60-mit-scheme:
	
	mit-scheme --batch-mode --load ./srfi/8.sld ./srfi/1.sld ./srfi/26.sld ./srfi/28.sld ./srfi/39.sld ./srfi/60.sld ./srfi/14.sld ./srfi/13.sld ./srfi/64.sld srfi-test/r7rs-programs/60.scm

60-mit-scheme-library:
	

60-mit-scheme-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --batch-mode --load ./srfi/8.sld ./srfi/1.sld ./srfi/26.sld ./srfi/28.sld ./srfi/39.sld ./srfi/60.sld ./srfi/14.sld ./srfi/13.sld ./srfi/64.sld srfi-test/r7rs-programs/60.scm"

60-mit-scheme-library-docker:
	

60-mit-scheme-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --batch-mode --load ./srfi/8.sld ./srfi/1.sld ./srfi/26.sld ./srfi/28.sld ./srfi/39.sld ./srfi/60.sld ./srfi/14.sld ./srfi/13.sld ./srfi/64.sld srfi-test/r7rs-programs/60.scm"

60-mit-scheme-library-docker-head:
	

60-mosh:
	
	mosh --loadpath=. srfi-test/r7rs-programs/60.scm

60-mosh-library:
	

60-mosh-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mosh:latest bash -c "cd workdir && mosh --loadpath=. srfi-test/r7rs-programs/60.scm"

60-mosh-library-docker:
	

60-mosh-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mosh:latest bash -c "cd workdir && mosh --loadpath=. srfi-test/r7rs-programs/60.scm"

60-mosh-library-docker-head:
	

60-racket:
	
	racket -I r7rs -S . --script srfi-test/r7rs-programs/60.scm

60-racket-library:
	

60-racket-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:latest bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/60.scm"

60-racket-library-docker:
	

60-racket-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:latest bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/60.scm"

60-racket-library-docker-head:
	

60-sagittarius:
	
	sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/60.scm

60-sagittarius-library:
	

60-sagittarius-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:latest bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/60.scm"

60-sagittarius-library-docker:
	

60-sagittarius-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:latest bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/60.scm"

60-sagittarius-library-docker-head:
	

60-stklos:
	
	stklos -I . -I ./srfi -f srfi-test/r7rs-programs/60.scm

60-stklos-library:
	

60-stklos-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:latest bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/60.scm"

60-stklos-library-docker:
	

60-stklos-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:latest bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/60.scm"

60-stklos-library-docker-head:
	

60-skint:
	
	skint -I ./ --script srfi-test/r7rs-programs/60.scm

60-skint-library:
	

60-skint-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:latest bash -c "cd workdir && skint -I ./ --script srfi-test/r7rs-programs/60.scm"

60-skint-library-docker:
	

60-skint-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:latest bash -c "cd workdir && skint -I ./ --script srfi-test/r7rs-programs/60.scm"

60-skint-library-docker-head:
	

60-tr7:
	
	tr7i srfi-test/r7rs-programs/60.scm

60-tr7-library:
	

60-tr7-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:latest bash -c "cd workdir && tr7i srfi-test/r7rs-programs/60.scm"

60-tr7-library-docker:
	

60-tr7-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:latest bash -c "cd workdir && tr7i srfi-test/r7rs-programs/60.scm"

60-tr7-library-docker-head:
	

60-ypsilon:
	
	ypsilon --r7rs --verbose --warning --sitelib=. --top-level-program srfi-test/r7rs-programs/60.scm

60-ypsilon-library:
	

60-ypsilon-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/ypsilon:latest bash -c "cd workdir && ypsilon --r7rs --verbose --warning --sitelib=. --top-level-program srfi-test/r7rs-programs/60.scm"

60-ypsilon-library-docker:
	

60-ypsilon-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/ypsilon:latest bash -c "cd workdir && ypsilon --r7rs --verbose --warning --sitelib=. --top-level-program srfi-test/r7rs-programs/60.scm"

60-ypsilon-library-docker-head:
	

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
	
	icyc -I . -I ./srfi -s srfi-test/r7rs-programs/64.scm

64-cyclone-interpreter-library:
	

64-cyclone-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && icyc -I . -I ./srfi -s srfi-test/r7rs-programs/64.scm"

64-cyclone-interpreter-library-docker:
	

64-cyclone-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && icyc -I . -I ./srfi -s srfi-test/r7rs-programs/64.scm"

64-cyclone-interpreter-library-docker-head:
	

64-foment:
	
	foment -X .sld -I . -b srfi-test/r7rs-programs/64.scm

64-foment-library:
	

64-foment-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment:latest bash -c "cd workdir && foment -X .sld -I . -b srfi-test/r7rs-programs/64.scm"

64-foment-library-docker:
	

64-foment-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment:latest bash -c "cd workdir && foment -X .sld -I . -b srfi-test/r7rs-programs/64.scm"

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
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:latest bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . -L ./srfi srfi-test/r7rs-programs/64.scm"

64-guile-library-docker:
	

64-guile-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:latest bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . -L ./srfi srfi-test/r7rs-programs/64.scm"

64-guile-library-docker-head:
	

64-kawa:
	
	kawa --r7rs --full-tailcalls -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/64.scm

64-kawa-library:
	

64-kawa-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:latest bash -c "cd workdir && kawa --r7rs --full-tailcalls -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/64.scm"

64-kawa-library-docker:
	

64-kawa-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:latest bash -c "cd workdir && kawa --r7rs --full-tailcalls -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/64.scm"

64-kawa-library-docker-head:
	

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
	
	mit-scheme --batch-mode --load ./srfi/8.sld ./srfi/1.sld ./srfi/26.sld ./srfi/28.sld ./srfi/39.sld ./srfi/60.sld ./srfi/14.sld ./srfi/13.sld ./srfi/64.sld srfi-test/r7rs-programs/64.scm

64-mit-scheme-library:
	

64-mit-scheme-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --batch-mode --load ./srfi/8.sld ./srfi/1.sld ./srfi/26.sld ./srfi/28.sld ./srfi/39.sld ./srfi/60.sld ./srfi/14.sld ./srfi/13.sld ./srfi/64.sld srfi-test/r7rs-programs/64.scm"

64-mit-scheme-library-docker:
	

64-mit-scheme-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --batch-mode --load ./srfi/8.sld ./srfi/1.sld ./srfi/26.sld ./srfi/28.sld ./srfi/39.sld ./srfi/60.sld ./srfi/14.sld ./srfi/13.sld ./srfi/64.sld srfi-test/r7rs-programs/64.scm"

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
	
	stklos -I . -I ./srfi -f srfi-test/r7rs-programs/64.scm

64-stklos-library:
	

64-stklos-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:latest bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/64.scm"

64-stklos-library-docker:
	

64-stklos-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:latest bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/64.scm"

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
	
	tr7i srfi-test/r7rs-programs/64.scm

64-tr7-library:
	

64-tr7-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:latest bash -c "cd workdir && tr7i srfi-test/r7rs-programs/64.scm"

64-tr7-library-docker:
	

64-tr7-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:latest bash -c "cd workdir && tr7i srfi-test/r7rs-programs/64.scm"

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
	


