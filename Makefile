test-srfi-8-chibi:
	
	chibi-scheme -I . srfi-test/r7rs-programs/8.scm

build-srfi-8-chibi-library:
	

test-srfi-8-chibi-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:latest bash -c "cd workdir && chibi-scheme -I . srfi-test/r7rs-programs/8.scm"

build-srfi-8-chibi-library-docker:
	

test-srfi-8-chibi-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:latest bash -c "cd workdir && chibi-scheme -I . srfi-test/r7rs-programs/8.scm"

build-srfi-8-chibi-library-docker-head:
	

test-srfi-8-chicken-compiler:
	 csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi/8.sld 
	csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/8.scm && srfi-test/r7rs-programs/8 && rm srfi-test/r7rs-programs/8

build-srfi-8-chicken-compiler-library:
	 csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi/8.sld 

test-srfi-8-chicken-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken-compiler:latest bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi/8.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/8.scm && srfi-test/r7rs-programs/8 && rm srfi-test/r7rs-programs/8"

build-srfi-8-chicken-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken-compiler:latest bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi/8.sld" 

test-srfi-8-chicken-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken-compiler:head bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi/8.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/8.scm && srfi-test/r7rs-programs/8 && rm srfi-test/r7rs-programs/8"

build-srfi-8-chicken-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken-compiler:head bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi/8.sld" 

test-srfi-8-chicken-interpreter:
	
	csi srfi-test/r7rs-programs/8.scm

build-srfi-8-chicken-interpreter-library:
	

test-srfi-8-chicken-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csi srfi-test/r7rs-programs/8.scm"

build-srfi-8-chicken-interpreter-library-docker:
	

test-srfi-8-chicken-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csi srfi-test/r7rs-programs/8.scm"

build-srfi-8-chicken-interpreter-library-docker-head:
	

test-srfi-8-cyclone-compiler:
	 cyclone -I . srfi/8.sld 
	cyclone -I . srfi-test/r7rs-programs/8.scm && srfi-test/r7rs-programs/8 && rm srfi-test/r7rs-programs/8

build-srfi-8-cyclone-compiler-library:
	 cyclone -I . srfi/8.sld 

test-srfi-8-cyclone-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone-compiler:latest bash -c "cd workdir && cyclone -I . srfi/8.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi-test/r7rs-programs/8.scm && srfi-test/r7rs-programs/8 && rm srfi-test/r7rs-programs/8"

build-srfi-8-cyclone-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone-compiler:latest bash -c "cd workdir && cyclone -I . srfi/8.sld" 

test-srfi-8-cyclone-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone-compiler:head bash -c "cd workdir && cyclone -I . srfi/8.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi-test/r7rs-programs/8.scm && srfi-test/r7rs-programs/8 && rm srfi-test/r7rs-programs/8"

build-srfi-8-cyclone-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone-compiler:head bash -c "cd workdir && cyclone -I . srfi/8.sld" 

test-srfi-8-cyclone-interpreter:
	
	icyc -I . srfi-test/r7rs-programs/8.scm

build-srfi-8-cyclone-interpreter-library:
	

test-srfi-8-cyclone-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && icyc -I . srfi-test/r7rs-programs/8.scm"

build-srfi-8-cyclone-interpreter-library-docker:
	

test-srfi-8-cyclone-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && icyc -I . srfi-test/r7rs-programs/8.scm"

build-srfi-8-cyclone-interpreter-library-docker-head:
	

test-srfi-8-foment:
	
	foment -I . -I ./srfi srfi-test/r7rs-programs/8.scm

build-srfi-8-foment-library:
	

test-srfi-8-foment-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment:latest bash -c "cd workdir && foment -I . -I ./srfi srfi-test/r7rs-programs/8.scm"

build-srfi-8-foment-library-docker:
	

test-srfi-8-foment-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment:latest bash -c "cd workdir && foment -I . -I ./srfi srfi-test/r7rs-programs/8.scm"

build-srfi-8-foment-library-docker-head:
	

test-srfi-8-gambit-compiler:
	 gsc -:search=.,s -debug -warnings -obj srfi/8.sld 
	gsc -:search=.,s -debug -warnings -exe ./  -nopreload srfi-test/r7rs-programs/8.scm && srfi-test/r7rs-programs/8 && rm srfi-test/r7rs-programs/8

build-srfi-8-gambit-compiler-library:
	 gsc -:search=.,s -debug -warnings -obj srfi/8.sld 

test-srfi-8-gambit-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit-compiler:latest bash -c "cd workdir && gsc -:search=.,s -debug -warnings -obj srfi/8.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsc -:search=.,s -debug -warnings -exe ./  -nopreload srfi-test/r7rs-programs/8.scm && srfi-test/r7rs-programs/8 && rm srfi-test/r7rs-programs/8"

build-srfi-8-gambit-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit-compiler:latest bash -c "cd workdir && gsc -:search=.,s -debug -warnings -obj srfi/8.sld" 

test-srfi-8-gambit-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit-compiler:head bash -c "cd workdir && gsc -:search=.,s -debug -warnings -obj srfi/8.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsc -:search=.,s -debug -warnings -exe ./  -nopreload srfi-test/r7rs-programs/8.scm && srfi-test/r7rs-programs/8 && rm srfi-test/r7rs-programs/8"

build-srfi-8-gambit-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit-compiler:head bash -c "cd workdir && gsc -:search=.,s -debug -warnings -obj srfi/8.sld" 

test-srfi-8-gambit-interpreter:
	
	gsi -:s srfi-test/r7rs-programs/8.scm

build-srfi-8-gambit-interpreter-library:
	

test-srfi-8-gambit-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsi -:s srfi-test/r7rs-programs/8.scm"

build-srfi-8-gambit-interpreter-library-docker:
	

test-srfi-8-gambit-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsi -:s srfi-test/r7rs-programs/8.scm"

build-srfi-8-gambit-interpreter-library-docker-head:
	

test-srfi-8-gauche:
	
	gosh -r7 -I . srfi-test/r7rs-programs/8.scm

build-srfi-8-gauche-library:
	

test-srfi-8-gauche-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:latest bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/8.scm"

build-srfi-8-gauche-library-docker:
	

test-srfi-8-gauche-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:latest bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/8.scm"

build-srfi-8-gauche-library-docker-head:
	

test-srfi-8-gerbil-compiler:
	 gxc -O srfi/8.sld 
	gxc --lang r7rs srfi-test/r7rs-programs/8.scm && srfi-test/r7rs-programs/8 && rm srfi-test/r7rs-programs/8

build-srfi-8-gerbil-compiler-library:
	 gxc -O srfi/8.sld 

test-srfi-8-gerbil-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil-compiler:latest bash -c "cd workdir && gxc -O srfi/8.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc --lang r7rs srfi-test/r7rs-programs/8.scm && srfi-test/r7rs-programs/8 && rm srfi-test/r7rs-programs/8"

build-srfi-8-gerbil-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil-compiler:latest bash -c "cd workdir && gxc -O srfi/8.sld" 

test-srfi-8-gerbil-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil-compiler:head bash -c "cd workdir && gxc -O srfi/8.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc --lang r7rs srfi-test/r7rs-programs/8.scm && srfi-test/r7rs-programs/8 && rm srfi-test/r7rs-programs/8"

build-srfi-8-gerbil-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil-compiler:head bash -c "cd workdir && gxc -O srfi/8.sld" 

test-srfi-8-gerbil-interpreter:
	
	gxi --lang r7rs srfi-test/r7rs-programs/8.scm

build-srfi-8-gerbil-interpreter-library:
	

test-srfi-8-gerbil-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxi --lang r7rs srfi-test/r7rs-programs/8.scm"

build-srfi-8-gerbil-interpreter-library-docker:
	

test-srfi-8-gerbil-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxi --lang r7rs srfi-test/r7rs-programs/8.scm"

build-srfi-8-gerbil-interpreter-library-docker-head:
	

test-srfi-8-guile:
	
	guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/8.scm

build-srfi-8-guile-library:
	

test-srfi-8-guile-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:latest bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/8.scm"

build-srfi-8-guile-library-docker:
	

test-srfi-8-guile-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:latest bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/8.scm"

build-srfi-8-guile-library-docker-head:
	

test-srfi-8-kawa:
	
	kawa --r7rs -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/8.scm

build-srfi-8-kawa-library:
	

test-srfi-8-kawa-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:latest bash -c "cd workdir && kawa --r7rs -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/8.scm"

build-srfi-8-kawa-library-docker:
	

test-srfi-8-kawa-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:latest bash -c "cd workdir && kawa --r7rs -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/8.scm"

build-srfi-8-kawa-library-docker-head:
	

test-srfi-8-loko:
	 ls srfi/8.sld 
	loko -std=r7rs --compile srfi-test/r7rs-programs/8.scm && srfi-test/r7rs-programs/8 && rm srfi-test/r7rs-programs/8

build-srfi-8-loko-library:
	 ls srfi/8.sld 

test-srfi-8-loko-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && ls srfi/8.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/8.scm && srfi-test/r7rs-programs/8 && rm srfi-test/r7rs-programs/8"

build-srfi-8-loko-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && ls srfi/8.sld" 

test-srfi-8-loko-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:head bash -c "cd workdir && ls srfi/8.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/8.scm && srfi-test/r7rs-programs/8 && rm srfi-test/r7rs-programs/8"

build-srfi-8-loko-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:head bash -c "cd workdir && ls srfi/8.sld" 

test-srfi-8-mit-scheme:
	
	mit-scheme --batch-mode --load ./srfi/26.sld ./srfi/28.sld ./srfi/64.sld srfi-test/r7rs-programs/8.scm

build-srfi-8-mit-scheme-library:
	

test-srfi-8-mit-scheme-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --batch-mode --load ./srfi/26.sld ./srfi/28.sld ./srfi/64.sld srfi-test/r7rs-programs/8.scm"

build-srfi-8-mit-scheme-library-docker:
	

test-srfi-8-mit-scheme-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --batch-mode --load ./srfi/26.sld ./srfi/28.sld ./srfi/64.sld srfi-test/r7rs-programs/8.scm"

build-srfi-8-mit-scheme-library-docker-head:
	

test-srfi-8-mosh:
	
	mosh --loadpath=. srfi-test/r7rs-programs/8.scm

build-srfi-8-mosh-library:
	

test-srfi-8-mosh-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mosh:latest bash -c "cd workdir && mosh --loadpath=. srfi-test/r7rs-programs/8.scm"

build-srfi-8-mosh-library-docker:
	

test-srfi-8-mosh-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mosh:latest bash -c "cd workdir && mosh --loadpath=. srfi-test/r7rs-programs/8.scm"

build-srfi-8-mosh-library-docker-head:
	

test-srfi-8-racket:
	
	racket -I r7rs -S . --script srfi-test/r7rs-programs/8.scm

build-srfi-8-racket-library:
	

test-srfi-8-racket-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:latest bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/8.scm"

build-srfi-8-racket-library-docker:
	

test-srfi-8-racket-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:latest bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/8.scm"

build-srfi-8-racket-library-docker-head:
	

test-srfi-8-sagittarius:
	
	sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/8.scm

build-srfi-8-sagittarius-library:
	

test-srfi-8-sagittarius-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:latest bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/8.scm"

build-srfi-8-sagittarius-library-docker:
	

test-srfi-8-sagittarius-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:latest bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/8.scm"

build-srfi-8-sagittarius-library-docker-head:
	

test-srfi-8-stklos:
	
	stklos -I . -I ./srfi -f srfi-test/r7rs-programs/8.scm

build-srfi-8-stklos-library:
	

test-srfi-8-stklos-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:latest bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/8.scm"

build-srfi-8-stklos-library-docker:
	

test-srfi-8-stklos-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:latest bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/8.scm"

build-srfi-8-stklos-library-docker-head:
	

test-srfi-8-skint:
	
	skint -I ./ srfi-test/r7rs-programs/8.scm

build-srfi-8-skint-library:
	

test-srfi-8-skint-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:latest bash -c "cd workdir && skint -I ./ srfi-test/r7rs-programs/8.scm"

build-srfi-8-skint-library-docker:
	

test-srfi-8-skint-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:latest bash -c "cd workdir && skint -I ./ srfi-test/r7rs-programs/8.scm"

build-srfi-8-skint-library-docker-head:
	

test-srfi-8-tr7:
	
	tr7i srfi-test/r7rs-programs/8.scm

build-srfi-8-tr7-library:
	

test-srfi-8-tr7-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:latest bash -c "cd workdir && tr7i srfi-test/r7rs-programs/8.scm"

build-srfi-8-tr7-library-docker:
	

test-srfi-8-tr7-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:latest bash -c "cd workdir && tr7i srfi-test/r7rs-programs/8.scm"

build-srfi-8-tr7-library-docker-head:
	

test-srfi-8-ypsilon:
	
	ypsilon --r7rs --loadpath=. --loadpath=./srfi srfi-test/r7rs-programs/8.scm

build-srfi-8-ypsilon-library:
	

test-srfi-8-ypsilon-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/ypsilon:latest bash -c "cd workdir && ypsilon --r7rs --loadpath=. --loadpath=./srfi srfi-test/r7rs-programs/8.scm"

build-srfi-8-ypsilon-library-docker:
	

test-srfi-8-ypsilon-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/ypsilon:latest bash -c "cd workdir && ypsilon --r7rs --loadpath=. --loadpath=./srfi srfi-test/r7rs-programs/8.scm"

build-srfi-8-ypsilon-library-docker-head:
	

test-srfi-1-chibi:
	
	chibi-scheme -I . srfi-test/r7rs-programs/1.scm

build-srfi-1-chibi-library:
	

test-srfi-1-chibi-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:latest bash -c "cd workdir && chibi-scheme -I . srfi-test/r7rs-programs/1.scm"

build-srfi-1-chibi-library-docker:
	

test-srfi-1-chibi-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:latest bash -c "cd workdir && chibi-scheme -I . srfi-test/r7rs-programs/1.scm"

build-srfi-1-chibi-library-docker-head:
	

test-srfi-1-chicken-compiler:
	 csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi/1.sld 
	csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/1.scm && srfi-test/r7rs-programs/1 && rm srfi-test/r7rs-programs/1

build-srfi-1-chicken-compiler-library:
	 csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi/1.sld 

test-srfi-1-chicken-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken-compiler:latest bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi/1.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/1.scm && srfi-test/r7rs-programs/1 && rm srfi-test/r7rs-programs/1"

build-srfi-1-chicken-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken-compiler:latest bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi/1.sld" 

test-srfi-1-chicken-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken-compiler:head bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi/1.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/1.scm && srfi-test/r7rs-programs/1 && rm srfi-test/r7rs-programs/1"

build-srfi-1-chicken-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken-compiler:head bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi/1.sld" 

test-srfi-1-chicken-interpreter:
	
	csi srfi-test/r7rs-programs/1.scm

build-srfi-1-chicken-interpreter-library:
	

test-srfi-1-chicken-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csi srfi-test/r7rs-programs/1.scm"

build-srfi-1-chicken-interpreter-library-docker:
	

test-srfi-1-chicken-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csi srfi-test/r7rs-programs/1.scm"

build-srfi-1-chicken-interpreter-library-docker-head:
	

test-srfi-1-cyclone-compiler:
	 cyclone -I . srfi/1.sld 
	cyclone -I . srfi-test/r7rs-programs/1.scm && srfi-test/r7rs-programs/1 && rm srfi-test/r7rs-programs/1

build-srfi-1-cyclone-compiler-library:
	 cyclone -I . srfi/1.sld 

test-srfi-1-cyclone-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone-compiler:latest bash -c "cd workdir && cyclone -I . srfi/1.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi-test/r7rs-programs/1.scm && srfi-test/r7rs-programs/1 && rm srfi-test/r7rs-programs/1"

build-srfi-1-cyclone-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone-compiler:latest bash -c "cd workdir && cyclone -I . srfi/1.sld" 

test-srfi-1-cyclone-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone-compiler:head bash -c "cd workdir && cyclone -I . srfi/1.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi-test/r7rs-programs/1.scm && srfi-test/r7rs-programs/1 && rm srfi-test/r7rs-programs/1"

build-srfi-1-cyclone-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone-compiler:head bash -c "cd workdir && cyclone -I . srfi/1.sld" 

test-srfi-1-cyclone-interpreter:
	
	icyc -I . srfi-test/r7rs-programs/1.scm

build-srfi-1-cyclone-interpreter-library:
	

test-srfi-1-cyclone-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && icyc -I . srfi-test/r7rs-programs/1.scm"

build-srfi-1-cyclone-interpreter-library-docker:
	

test-srfi-1-cyclone-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && icyc -I . srfi-test/r7rs-programs/1.scm"

build-srfi-1-cyclone-interpreter-library-docker-head:
	

test-srfi-1-foment:
	
	foment -I . -I ./srfi srfi-test/r7rs-programs/1.scm

build-srfi-1-foment-library:
	

test-srfi-1-foment-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment:latest bash -c "cd workdir && foment -I . -I ./srfi srfi-test/r7rs-programs/1.scm"

build-srfi-1-foment-library-docker:
	

test-srfi-1-foment-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment:latest bash -c "cd workdir && foment -I . -I ./srfi srfi-test/r7rs-programs/1.scm"

build-srfi-1-foment-library-docker-head:
	

test-srfi-1-gambit-compiler:
	 gsc -:search=.,s -debug -warnings -obj srfi/1.sld 
	gsc -:search=.,s -debug -warnings -exe ./  -nopreload srfi-test/r7rs-programs/1.scm && srfi-test/r7rs-programs/1 && rm srfi-test/r7rs-programs/1

build-srfi-1-gambit-compiler-library:
	 gsc -:search=.,s -debug -warnings -obj srfi/1.sld 

test-srfi-1-gambit-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit-compiler:latest bash -c "cd workdir && gsc -:search=.,s -debug -warnings -obj srfi/1.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsc -:search=.,s -debug -warnings -exe ./  -nopreload srfi-test/r7rs-programs/1.scm && srfi-test/r7rs-programs/1 && rm srfi-test/r7rs-programs/1"

build-srfi-1-gambit-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit-compiler:latest bash -c "cd workdir && gsc -:search=.,s -debug -warnings -obj srfi/1.sld" 

test-srfi-1-gambit-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit-compiler:head bash -c "cd workdir && gsc -:search=.,s -debug -warnings -obj srfi/1.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsc -:search=.,s -debug -warnings -exe ./  -nopreload srfi-test/r7rs-programs/1.scm && srfi-test/r7rs-programs/1 && rm srfi-test/r7rs-programs/1"

build-srfi-1-gambit-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit-compiler:head bash -c "cd workdir && gsc -:search=.,s -debug -warnings -obj srfi/1.sld" 

test-srfi-1-gambit-interpreter:
	
	gsi -:s srfi-test/r7rs-programs/1.scm

build-srfi-1-gambit-interpreter-library:
	

test-srfi-1-gambit-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsi -:s srfi-test/r7rs-programs/1.scm"

build-srfi-1-gambit-interpreter-library-docker:
	

test-srfi-1-gambit-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsi -:s srfi-test/r7rs-programs/1.scm"

build-srfi-1-gambit-interpreter-library-docker-head:
	

test-srfi-1-gauche:
	
	gosh -r7 -I . srfi-test/r7rs-programs/1.scm

build-srfi-1-gauche-library:
	

test-srfi-1-gauche-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:latest bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/1.scm"

build-srfi-1-gauche-library-docker:
	

test-srfi-1-gauche-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:latest bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/1.scm"

build-srfi-1-gauche-library-docker-head:
	

test-srfi-1-gerbil-compiler:
	 gxc -O srfi/1.sld 
	gxc --lang r7rs srfi-test/r7rs-programs/1.scm && srfi-test/r7rs-programs/1 && rm srfi-test/r7rs-programs/1

build-srfi-1-gerbil-compiler-library:
	 gxc -O srfi/1.sld 

test-srfi-1-gerbil-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil-compiler:latest bash -c "cd workdir && gxc -O srfi/1.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc --lang r7rs srfi-test/r7rs-programs/1.scm && srfi-test/r7rs-programs/1 && rm srfi-test/r7rs-programs/1"

build-srfi-1-gerbil-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil-compiler:latest bash -c "cd workdir && gxc -O srfi/1.sld" 

test-srfi-1-gerbil-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil-compiler:head bash -c "cd workdir && gxc -O srfi/1.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc --lang r7rs srfi-test/r7rs-programs/1.scm && srfi-test/r7rs-programs/1 && rm srfi-test/r7rs-programs/1"

build-srfi-1-gerbil-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil-compiler:head bash -c "cd workdir && gxc -O srfi/1.sld" 

test-srfi-1-gerbil-interpreter:
	
	gxi --lang r7rs srfi-test/r7rs-programs/1.scm

build-srfi-1-gerbil-interpreter-library:
	

test-srfi-1-gerbil-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxi --lang r7rs srfi-test/r7rs-programs/1.scm"

build-srfi-1-gerbil-interpreter-library-docker:
	

test-srfi-1-gerbil-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxi --lang r7rs srfi-test/r7rs-programs/1.scm"

build-srfi-1-gerbil-interpreter-library-docker-head:
	

test-srfi-1-guile:
	
	guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/1.scm

build-srfi-1-guile-library:
	

test-srfi-1-guile-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:latest bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/1.scm"

build-srfi-1-guile-library-docker:
	

test-srfi-1-guile-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:latest bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/1.scm"

build-srfi-1-guile-library-docker-head:
	

test-srfi-1-kawa:
	
	kawa --r7rs -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/1.scm

build-srfi-1-kawa-library:
	

test-srfi-1-kawa-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:latest bash -c "cd workdir && kawa --r7rs -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/1.scm"

build-srfi-1-kawa-library-docker:
	

test-srfi-1-kawa-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:latest bash -c "cd workdir && kawa --r7rs -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/1.scm"

build-srfi-1-kawa-library-docker-head:
	

test-srfi-1-loko:
	 ls srfi/1.sld 
	loko -std=r7rs --compile srfi-test/r7rs-programs/1.scm && srfi-test/r7rs-programs/1 && rm srfi-test/r7rs-programs/1

build-srfi-1-loko-library:
	 ls srfi/1.sld 

test-srfi-1-loko-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && ls srfi/1.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/1.scm && srfi-test/r7rs-programs/1 && rm srfi-test/r7rs-programs/1"

build-srfi-1-loko-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && ls srfi/1.sld" 

test-srfi-1-loko-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:head bash -c "cd workdir && ls srfi/1.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/1.scm && srfi-test/r7rs-programs/1 && rm srfi-test/r7rs-programs/1"

build-srfi-1-loko-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:head bash -c "cd workdir && ls srfi/1.sld" 

test-srfi-1-mit-scheme:
	
	mit-scheme --batch-mode --load ./srfi/26.sld ./srfi/28.sld ./srfi/64.sld srfi-test/r7rs-programs/1.scm

build-srfi-1-mit-scheme-library:
	

test-srfi-1-mit-scheme-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --batch-mode --load ./srfi/26.sld ./srfi/28.sld ./srfi/64.sld srfi-test/r7rs-programs/1.scm"

build-srfi-1-mit-scheme-library-docker:
	

test-srfi-1-mit-scheme-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --batch-mode --load ./srfi/26.sld ./srfi/28.sld ./srfi/64.sld srfi-test/r7rs-programs/1.scm"

build-srfi-1-mit-scheme-library-docker-head:
	

test-srfi-1-mosh:
	
	mosh --loadpath=. srfi-test/r7rs-programs/1.scm

build-srfi-1-mosh-library:
	

test-srfi-1-mosh-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mosh:latest bash -c "cd workdir && mosh --loadpath=. srfi-test/r7rs-programs/1.scm"

build-srfi-1-mosh-library-docker:
	

test-srfi-1-mosh-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mosh:latest bash -c "cd workdir && mosh --loadpath=. srfi-test/r7rs-programs/1.scm"

build-srfi-1-mosh-library-docker-head:
	

test-srfi-1-racket:
	
	racket -I r7rs -S . --script srfi-test/r7rs-programs/1.scm

build-srfi-1-racket-library:
	

test-srfi-1-racket-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:latest bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/1.scm"

build-srfi-1-racket-library-docker:
	

test-srfi-1-racket-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:latest bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/1.scm"

build-srfi-1-racket-library-docker-head:
	

test-srfi-1-sagittarius:
	
	sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/1.scm

build-srfi-1-sagittarius-library:
	

test-srfi-1-sagittarius-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:latest bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/1.scm"

build-srfi-1-sagittarius-library-docker:
	

test-srfi-1-sagittarius-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:latest bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/1.scm"

build-srfi-1-sagittarius-library-docker-head:
	

test-srfi-1-stklos:
	
	stklos -I . -I ./srfi -f srfi-test/r7rs-programs/1.scm

build-srfi-1-stklos-library:
	

test-srfi-1-stklos-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:latest bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/1.scm"

build-srfi-1-stklos-library-docker:
	

test-srfi-1-stklos-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:latest bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/1.scm"

build-srfi-1-stklos-library-docker-head:
	

test-srfi-1-skint:
	
	skint -I ./ srfi-test/r7rs-programs/1.scm

build-srfi-1-skint-library:
	

test-srfi-1-skint-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:latest bash -c "cd workdir && skint -I ./ srfi-test/r7rs-programs/1.scm"

build-srfi-1-skint-library-docker:
	

test-srfi-1-skint-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:latest bash -c "cd workdir && skint -I ./ srfi-test/r7rs-programs/1.scm"

build-srfi-1-skint-library-docker-head:
	

test-srfi-1-tr7:
	
	tr7i srfi-test/r7rs-programs/1.scm

build-srfi-1-tr7-library:
	

test-srfi-1-tr7-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:latest bash -c "cd workdir && tr7i srfi-test/r7rs-programs/1.scm"

build-srfi-1-tr7-library-docker:
	

test-srfi-1-tr7-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:latest bash -c "cd workdir && tr7i srfi-test/r7rs-programs/1.scm"

build-srfi-1-tr7-library-docker-head:
	

test-srfi-1-ypsilon:
	
	ypsilon --r7rs --loadpath=. --loadpath=./srfi srfi-test/r7rs-programs/1.scm

build-srfi-1-ypsilon-library:
	

test-srfi-1-ypsilon-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/ypsilon:latest bash -c "cd workdir && ypsilon --r7rs --loadpath=. --loadpath=./srfi srfi-test/r7rs-programs/1.scm"

build-srfi-1-ypsilon-library-docker:
	

test-srfi-1-ypsilon-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/ypsilon:latest bash -c "cd workdir && ypsilon --r7rs --loadpath=. --loadpath=./srfi srfi-test/r7rs-programs/1.scm"

build-srfi-1-ypsilon-library-docker-head:
	

test-srfi-14-chibi:
	
	chibi-scheme -I . srfi-test/r7rs-programs/14.scm

build-srfi-14-chibi-library:
	

test-srfi-14-chibi-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:latest bash -c "cd workdir && chibi-scheme -I . srfi-test/r7rs-programs/14.scm"

build-srfi-14-chibi-library-docker:
	

test-srfi-14-chibi-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:latest bash -c "cd workdir && chibi-scheme -I . srfi-test/r7rs-programs/14.scm"

build-srfi-14-chibi-library-docker-head:
	

test-srfi-14-chicken-compiler:
	 csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi/14.sld 
	csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/14.scm && srfi-test/r7rs-programs/14 && rm srfi-test/r7rs-programs/14

build-srfi-14-chicken-compiler-library:
	 csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi/14.sld 

test-srfi-14-chicken-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken-compiler:latest bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi/14.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/14.scm && srfi-test/r7rs-programs/14 && rm srfi-test/r7rs-programs/14"

build-srfi-14-chicken-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken-compiler:latest bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi/14.sld" 

test-srfi-14-chicken-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken-compiler:head bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi/14.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/14.scm && srfi-test/r7rs-programs/14 && rm srfi-test/r7rs-programs/14"

build-srfi-14-chicken-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken-compiler:head bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi/14.sld" 

test-srfi-14-chicken-interpreter:
	
	csi srfi-test/r7rs-programs/14.scm

build-srfi-14-chicken-interpreter-library:
	

test-srfi-14-chicken-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csi srfi-test/r7rs-programs/14.scm"

build-srfi-14-chicken-interpreter-library-docker:
	

test-srfi-14-chicken-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csi srfi-test/r7rs-programs/14.scm"

build-srfi-14-chicken-interpreter-library-docker-head:
	

test-srfi-14-cyclone-compiler:
	 cyclone -I . srfi/14.sld 
	cyclone -I . srfi-test/r7rs-programs/14.scm && srfi-test/r7rs-programs/14 && rm srfi-test/r7rs-programs/14

build-srfi-14-cyclone-compiler-library:
	 cyclone -I . srfi/14.sld 

test-srfi-14-cyclone-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone-compiler:latest bash -c "cd workdir && cyclone -I . srfi/14.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi-test/r7rs-programs/14.scm && srfi-test/r7rs-programs/14 && rm srfi-test/r7rs-programs/14"

build-srfi-14-cyclone-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone-compiler:latest bash -c "cd workdir && cyclone -I . srfi/14.sld" 

test-srfi-14-cyclone-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone-compiler:head bash -c "cd workdir && cyclone -I . srfi/14.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi-test/r7rs-programs/14.scm && srfi-test/r7rs-programs/14 && rm srfi-test/r7rs-programs/14"

build-srfi-14-cyclone-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone-compiler:head bash -c "cd workdir && cyclone -I . srfi/14.sld" 

test-srfi-14-cyclone-interpreter:
	
	icyc -I . srfi-test/r7rs-programs/14.scm

build-srfi-14-cyclone-interpreter-library:
	

test-srfi-14-cyclone-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && icyc -I . srfi-test/r7rs-programs/14.scm"

build-srfi-14-cyclone-interpreter-library-docker:
	

test-srfi-14-cyclone-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && icyc -I . srfi-test/r7rs-programs/14.scm"

build-srfi-14-cyclone-interpreter-library-docker-head:
	

test-srfi-14-foment:
	
	foment -I . -I ./srfi srfi-test/r7rs-programs/14.scm

build-srfi-14-foment-library:
	

test-srfi-14-foment-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment:latest bash -c "cd workdir && foment -I . -I ./srfi srfi-test/r7rs-programs/14.scm"

build-srfi-14-foment-library-docker:
	

test-srfi-14-foment-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment:latest bash -c "cd workdir && foment -I . -I ./srfi srfi-test/r7rs-programs/14.scm"

build-srfi-14-foment-library-docker-head:
	

test-srfi-14-gambit-compiler:
	 gsc -:search=.,s -debug -warnings -obj srfi/14.sld 
	gsc -:search=.,s -debug -warnings -exe ./  -nopreload srfi-test/r7rs-programs/14.scm && srfi-test/r7rs-programs/14 && rm srfi-test/r7rs-programs/14

build-srfi-14-gambit-compiler-library:
	 gsc -:search=.,s -debug -warnings -obj srfi/14.sld 

test-srfi-14-gambit-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit-compiler:latest bash -c "cd workdir && gsc -:search=.,s -debug -warnings -obj srfi/14.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsc -:search=.,s -debug -warnings -exe ./  -nopreload srfi-test/r7rs-programs/14.scm && srfi-test/r7rs-programs/14 && rm srfi-test/r7rs-programs/14"

build-srfi-14-gambit-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit-compiler:latest bash -c "cd workdir && gsc -:search=.,s -debug -warnings -obj srfi/14.sld" 

test-srfi-14-gambit-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit-compiler:head bash -c "cd workdir && gsc -:search=.,s -debug -warnings -obj srfi/14.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsc -:search=.,s -debug -warnings -exe ./  -nopreload srfi-test/r7rs-programs/14.scm && srfi-test/r7rs-programs/14 && rm srfi-test/r7rs-programs/14"

build-srfi-14-gambit-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit-compiler:head bash -c "cd workdir && gsc -:search=.,s -debug -warnings -obj srfi/14.sld" 

test-srfi-14-gambit-interpreter:
	
	gsi -:s srfi-test/r7rs-programs/14.scm

build-srfi-14-gambit-interpreter-library:
	

test-srfi-14-gambit-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsi -:s srfi-test/r7rs-programs/14.scm"

build-srfi-14-gambit-interpreter-library-docker:
	

test-srfi-14-gambit-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsi -:s srfi-test/r7rs-programs/14.scm"

build-srfi-14-gambit-interpreter-library-docker-head:
	

test-srfi-14-gauche:
	
	gosh -r7 -I . srfi-test/r7rs-programs/14.scm

build-srfi-14-gauche-library:
	

test-srfi-14-gauche-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:latest bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/14.scm"

build-srfi-14-gauche-library-docker:
	

test-srfi-14-gauche-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:latest bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/14.scm"

build-srfi-14-gauche-library-docker-head:
	

test-srfi-14-gerbil-compiler:
	 gxc -O srfi/14.sld 
	gxc --lang r7rs srfi-test/r7rs-programs/14.scm && srfi-test/r7rs-programs/14 && rm srfi-test/r7rs-programs/14

build-srfi-14-gerbil-compiler-library:
	 gxc -O srfi/14.sld 

test-srfi-14-gerbil-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil-compiler:latest bash -c "cd workdir && gxc -O srfi/14.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc --lang r7rs srfi-test/r7rs-programs/14.scm && srfi-test/r7rs-programs/14 && rm srfi-test/r7rs-programs/14"

build-srfi-14-gerbil-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil-compiler:latest bash -c "cd workdir && gxc -O srfi/14.sld" 

test-srfi-14-gerbil-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil-compiler:head bash -c "cd workdir && gxc -O srfi/14.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc --lang r7rs srfi-test/r7rs-programs/14.scm && srfi-test/r7rs-programs/14 && rm srfi-test/r7rs-programs/14"

build-srfi-14-gerbil-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil-compiler:head bash -c "cd workdir && gxc -O srfi/14.sld" 

test-srfi-14-gerbil-interpreter:
	
	gxi --lang r7rs srfi-test/r7rs-programs/14.scm

build-srfi-14-gerbil-interpreter-library:
	

test-srfi-14-gerbil-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxi --lang r7rs srfi-test/r7rs-programs/14.scm"

build-srfi-14-gerbil-interpreter-library-docker:
	

test-srfi-14-gerbil-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxi --lang r7rs srfi-test/r7rs-programs/14.scm"

build-srfi-14-gerbil-interpreter-library-docker-head:
	

test-srfi-14-guile:
	
	guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/14.scm

build-srfi-14-guile-library:
	

test-srfi-14-guile-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:latest bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/14.scm"

build-srfi-14-guile-library-docker:
	

test-srfi-14-guile-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:latest bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/14.scm"

build-srfi-14-guile-library-docker-head:
	

test-srfi-14-kawa:
	
	kawa --r7rs -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/14.scm

build-srfi-14-kawa-library:
	

test-srfi-14-kawa-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:latest bash -c "cd workdir && kawa --r7rs -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/14.scm"

build-srfi-14-kawa-library-docker:
	

test-srfi-14-kawa-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:latest bash -c "cd workdir && kawa --r7rs -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/14.scm"

build-srfi-14-kawa-library-docker-head:
	

test-srfi-14-loko:
	 ls srfi/14.sld 
	loko -std=r7rs --compile srfi-test/r7rs-programs/14.scm && srfi-test/r7rs-programs/14 && rm srfi-test/r7rs-programs/14

build-srfi-14-loko-library:
	 ls srfi/14.sld 

test-srfi-14-loko-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && ls srfi/14.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/14.scm && srfi-test/r7rs-programs/14 && rm srfi-test/r7rs-programs/14"

build-srfi-14-loko-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && ls srfi/14.sld" 

test-srfi-14-loko-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:head bash -c "cd workdir && ls srfi/14.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/14.scm && srfi-test/r7rs-programs/14 && rm srfi-test/r7rs-programs/14"

build-srfi-14-loko-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:head bash -c "cd workdir && ls srfi/14.sld" 

test-srfi-14-mit-scheme:
	
	mit-scheme --batch-mode --load ./srfi/26.sld ./srfi/28.sld ./srfi/64.sld srfi-test/r7rs-programs/14.scm

build-srfi-14-mit-scheme-library:
	

test-srfi-14-mit-scheme-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --batch-mode --load ./srfi/26.sld ./srfi/28.sld ./srfi/64.sld srfi-test/r7rs-programs/14.scm"

build-srfi-14-mit-scheme-library-docker:
	

test-srfi-14-mit-scheme-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --batch-mode --load ./srfi/26.sld ./srfi/28.sld ./srfi/64.sld srfi-test/r7rs-programs/14.scm"

build-srfi-14-mit-scheme-library-docker-head:
	

test-srfi-14-mosh:
	
	mosh --loadpath=. srfi-test/r7rs-programs/14.scm

build-srfi-14-mosh-library:
	

test-srfi-14-mosh-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mosh:latest bash -c "cd workdir && mosh --loadpath=. srfi-test/r7rs-programs/14.scm"

build-srfi-14-mosh-library-docker:
	

test-srfi-14-mosh-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mosh:latest bash -c "cd workdir && mosh --loadpath=. srfi-test/r7rs-programs/14.scm"

build-srfi-14-mosh-library-docker-head:
	

test-srfi-14-racket:
	
	racket -I r7rs -S . --script srfi-test/r7rs-programs/14.scm

build-srfi-14-racket-library:
	

test-srfi-14-racket-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:latest bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/14.scm"

build-srfi-14-racket-library-docker:
	

test-srfi-14-racket-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:latest bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/14.scm"

build-srfi-14-racket-library-docker-head:
	

test-srfi-14-sagittarius:
	
	sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/14.scm

build-srfi-14-sagittarius-library:
	

test-srfi-14-sagittarius-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:latest bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/14.scm"

build-srfi-14-sagittarius-library-docker:
	

test-srfi-14-sagittarius-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:latest bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/14.scm"

build-srfi-14-sagittarius-library-docker-head:
	

test-srfi-14-stklos:
	
	stklos -I . -I ./srfi -f srfi-test/r7rs-programs/14.scm

build-srfi-14-stklos-library:
	

test-srfi-14-stklos-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:latest bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/14.scm"

build-srfi-14-stklos-library-docker:
	

test-srfi-14-stklos-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:latest bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/14.scm"

build-srfi-14-stklos-library-docker-head:
	

test-srfi-14-skint:
	
	skint -I ./ srfi-test/r7rs-programs/14.scm

build-srfi-14-skint-library:
	

test-srfi-14-skint-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:latest bash -c "cd workdir && skint -I ./ srfi-test/r7rs-programs/14.scm"

build-srfi-14-skint-library-docker:
	

test-srfi-14-skint-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:latest bash -c "cd workdir && skint -I ./ srfi-test/r7rs-programs/14.scm"

build-srfi-14-skint-library-docker-head:
	

test-srfi-14-tr7:
	
	tr7i srfi-test/r7rs-programs/14.scm

build-srfi-14-tr7-library:
	

test-srfi-14-tr7-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:latest bash -c "cd workdir && tr7i srfi-test/r7rs-programs/14.scm"

build-srfi-14-tr7-library-docker:
	

test-srfi-14-tr7-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:latest bash -c "cd workdir && tr7i srfi-test/r7rs-programs/14.scm"

build-srfi-14-tr7-library-docker-head:
	

test-srfi-14-ypsilon:
	
	ypsilon --r7rs --loadpath=. --loadpath=./srfi srfi-test/r7rs-programs/14.scm

build-srfi-14-ypsilon-library:
	

test-srfi-14-ypsilon-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/ypsilon:latest bash -c "cd workdir && ypsilon --r7rs --loadpath=. --loadpath=./srfi srfi-test/r7rs-programs/14.scm"

build-srfi-14-ypsilon-library-docker:
	

test-srfi-14-ypsilon-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/ypsilon:latest bash -c "cd workdir && ypsilon --r7rs --loadpath=. --loadpath=./srfi srfi-test/r7rs-programs/14.scm"

build-srfi-14-ypsilon-library-docker-head:
	

test-srfi-26-chibi:
	
	chibi-scheme -I . srfi-test/r7rs-programs/26.scm

build-srfi-26-chibi-library:
	

test-srfi-26-chibi-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:latest bash -c "cd workdir && chibi-scheme -I . srfi-test/r7rs-programs/26.scm"

build-srfi-26-chibi-library-docker:
	

test-srfi-26-chibi-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:latest bash -c "cd workdir && chibi-scheme -I . srfi-test/r7rs-programs/26.scm"

build-srfi-26-chibi-library-docker-head:
	

test-srfi-26-chicken-compiler:
	 csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi/26.sld 
	csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/26.scm && srfi-test/r7rs-programs/26 && rm srfi-test/r7rs-programs/26

build-srfi-26-chicken-compiler-library:
	 csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi/26.sld 

test-srfi-26-chicken-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken-compiler:latest bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi/26.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/26.scm && srfi-test/r7rs-programs/26 && rm srfi-test/r7rs-programs/26"

build-srfi-26-chicken-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken-compiler:latest bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi/26.sld" 

test-srfi-26-chicken-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken-compiler:head bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi/26.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/26.scm && srfi-test/r7rs-programs/26 && rm srfi-test/r7rs-programs/26"

build-srfi-26-chicken-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken-compiler:head bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi/26.sld" 

test-srfi-26-chicken-interpreter:
	
	csi srfi-test/r7rs-programs/26.scm

build-srfi-26-chicken-interpreter-library:
	

test-srfi-26-chicken-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csi srfi-test/r7rs-programs/26.scm"

build-srfi-26-chicken-interpreter-library-docker:
	

test-srfi-26-chicken-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csi srfi-test/r7rs-programs/26.scm"

build-srfi-26-chicken-interpreter-library-docker-head:
	

test-srfi-26-cyclone-compiler:
	 cyclone -I . srfi/26.sld 
	cyclone -I . srfi-test/r7rs-programs/26.scm && srfi-test/r7rs-programs/26 && rm srfi-test/r7rs-programs/26

build-srfi-26-cyclone-compiler-library:
	 cyclone -I . srfi/26.sld 

test-srfi-26-cyclone-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone-compiler:latest bash -c "cd workdir && cyclone -I . srfi/26.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi-test/r7rs-programs/26.scm && srfi-test/r7rs-programs/26 && rm srfi-test/r7rs-programs/26"

build-srfi-26-cyclone-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone-compiler:latest bash -c "cd workdir && cyclone -I . srfi/26.sld" 

test-srfi-26-cyclone-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone-compiler:head bash -c "cd workdir && cyclone -I . srfi/26.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi-test/r7rs-programs/26.scm && srfi-test/r7rs-programs/26 && rm srfi-test/r7rs-programs/26"

build-srfi-26-cyclone-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone-compiler:head bash -c "cd workdir && cyclone -I . srfi/26.sld" 

test-srfi-26-cyclone-interpreter:
	
	icyc -I . srfi-test/r7rs-programs/26.scm

build-srfi-26-cyclone-interpreter-library:
	

test-srfi-26-cyclone-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && icyc -I . srfi-test/r7rs-programs/26.scm"

build-srfi-26-cyclone-interpreter-library-docker:
	

test-srfi-26-cyclone-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && icyc -I . srfi-test/r7rs-programs/26.scm"

build-srfi-26-cyclone-interpreter-library-docker-head:
	

test-srfi-26-foment:
	
	foment -I . -I ./srfi srfi-test/r7rs-programs/26.scm

build-srfi-26-foment-library:
	

test-srfi-26-foment-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment:latest bash -c "cd workdir && foment -I . -I ./srfi srfi-test/r7rs-programs/26.scm"

build-srfi-26-foment-library-docker:
	

test-srfi-26-foment-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment:latest bash -c "cd workdir && foment -I . -I ./srfi srfi-test/r7rs-programs/26.scm"

build-srfi-26-foment-library-docker-head:
	

test-srfi-26-gambit-compiler:
	 gsc -:search=.,s -debug -warnings -obj srfi/26.sld 
	gsc -:search=.,s -debug -warnings -exe ./  -nopreload srfi-test/r7rs-programs/26.scm && srfi-test/r7rs-programs/26 && rm srfi-test/r7rs-programs/26

build-srfi-26-gambit-compiler-library:
	 gsc -:search=.,s -debug -warnings -obj srfi/26.sld 

test-srfi-26-gambit-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit-compiler:latest bash -c "cd workdir && gsc -:search=.,s -debug -warnings -obj srfi/26.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsc -:search=.,s -debug -warnings -exe ./  -nopreload srfi-test/r7rs-programs/26.scm && srfi-test/r7rs-programs/26 && rm srfi-test/r7rs-programs/26"

build-srfi-26-gambit-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit-compiler:latest bash -c "cd workdir && gsc -:search=.,s -debug -warnings -obj srfi/26.sld" 

test-srfi-26-gambit-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit-compiler:head bash -c "cd workdir && gsc -:search=.,s -debug -warnings -obj srfi/26.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsc -:search=.,s -debug -warnings -exe ./  -nopreload srfi-test/r7rs-programs/26.scm && srfi-test/r7rs-programs/26 && rm srfi-test/r7rs-programs/26"

build-srfi-26-gambit-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit-compiler:head bash -c "cd workdir && gsc -:search=.,s -debug -warnings -obj srfi/26.sld" 

test-srfi-26-gambit-interpreter:
	
	gsi -:s srfi-test/r7rs-programs/26.scm

build-srfi-26-gambit-interpreter-library:
	

test-srfi-26-gambit-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsi -:s srfi-test/r7rs-programs/26.scm"

build-srfi-26-gambit-interpreter-library-docker:
	

test-srfi-26-gambit-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsi -:s srfi-test/r7rs-programs/26.scm"

build-srfi-26-gambit-interpreter-library-docker-head:
	

test-srfi-26-gauche:
	
	gosh -r7 -I . srfi-test/r7rs-programs/26.scm

build-srfi-26-gauche-library:
	

test-srfi-26-gauche-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:latest bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/26.scm"

build-srfi-26-gauche-library-docker:
	

test-srfi-26-gauche-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:latest bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/26.scm"

build-srfi-26-gauche-library-docker-head:
	

test-srfi-26-gerbil-compiler:
	 gxc -O srfi/26.sld 
	gxc --lang r7rs srfi-test/r7rs-programs/26.scm && srfi-test/r7rs-programs/26 && rm srfi-test/r7rs-programs/26

build-srfi-26-gerbil-compiler-library:
	 gxc -O srfi/26.sld 

test-srfi-26-gerbil-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil-compiler:latest bash -c "cd workdir && gxc -O srfi/26.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc --lang r7rs srfi-test/r7rs-programs/26.scm && srfi-test/r7rs-programs/26 && rm srfi-test/r7rs-programs/26"

build-srfi-26-gerbil-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil-compiler:latest bash -c "cd workdir && gxc -O srfi/26.sld" 

test-srfi-26-gerbil-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil-compiler:head bash -c "cd workdir && gxc -O srfi/26.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc --lang r7rs srfi-test/r7rs-programs/26.scm && srfi-test/r7rs-programs/26 && rm srfi-test/r7rs-programs/26"

build-srfi-26-gerbil-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil-compiler:head bash -c "cd workdir && gxc -O srfi/26.sld" 

test-srfi-26-gerbil-interpreter:
	
	gxi --lang r7rs srfi-test/r7rs-programs/26.scm

build-srfi-26-gerbil-interpreter-library:
	

test-srfi-26-gerbil-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxi --lang r7rs srfi-test/r7rs-programs/26.scm"

build-srfi-26-gerbil-interpreter-library-docker:
	

test-srfi-26-gerbil-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxi --lang r7rs srfi-test/r7rs-programs/26.scm"

build-srfi-26-gerbil-interpreter-library-docker-head:
	

test-srfi-26-guile:
	
	guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/26.scm

build-srfi-26-guile-library:
	

test-srfi-26-guile-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:latest bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/26.scm"

build-srfi-26-guile-library-docker:
	

test-srfi-26-guile-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:latest bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/26.scm"

build-srfi-26-guile-library-docker-head:
	

test-srfi-26-kawa:
	
	kawa --r7rs -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/26.scm

build-srfi-26-kawa-library:
	

test-srfi-26-kawa-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:latest bash -c "cd workdir && kawa --r7rs -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/26.scm"

build-srfi-26-kawa-library-docker:
	

test-srfi-26-kawa-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:latest bash -c "cd workdir && kawa --r7rs -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/26.scm"

build-srfi-26-kawa-library-docker-head:
	

test-srfi-26-loko:
	 ls srfi/26.sld 
	loko -std=r7rs --compile srfi-test/r7rs-programs/26.scm && srfi-test/r7rs-programs/26 && rm srfi-test/r7rs-programs/26

build-srfi-26-loko-library:
	 ls srfi/26.sld 

test-srfi-26-loko-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && ls srfi/26.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/26.scm && srfi-test/r7rs-programs/26 && rm srfi-test/r7rs-programs/26"

build-srfi-26-loko-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && ls srfi/26.sld" 

test-srfi-26-loko-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:head bash -c "cd workdir && ls srfi/26.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/26.scm && srfi-test/r7rs-programs/26 && rm srfi-test/r7rs-programs/26"

build-srfi-26-loko-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:head bash -c "cd workdir && ls srfi/26.sld" 

test-srfi-26-mit-scheme:
	
	mit-scheme --batch-mode --load ./srfi/26.sld ./srfi/28.sld ./srfi/64.sld srfi-test/r7rs-programs/26.scm

build-srfi-26-mit-scheme-library:
	

test-srfi-26-mit-scheme-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --batch-mode --load ./srfi/26.sld ./srfi/28.sld ./srfi/64.sld srfi-test/r7rs-programs/26.scm"

build-srfi-26-mit-scheme-library-docker:
	

test-srfi-26-mit-scheme-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --batch-mode --load ./srfi/26.sld ./srfi/28.sld ./srfi/64.sld srfi-test/r7rs-programs/26.scm"

build-srfi-26-mit-scheme-library-docker-head:
	

test-srfi-26-mosh:
	
	mosh --loadpath=. srfi-test/r7rs-programs/26.scm

build-srfi-26-mosh-library:
	

test-srfi-26-mosh-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mosh:latest bash -c "cd workdir && mosh --loadpath=. srfi-test/r7rs-programs/26.scm"

build-srfi-26-mosh-library-docker:
	

test-srfi-26-mosh-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mosh:latest bash -c "cd workdir && mosh --loadpath=. srfi-test/r7rs-programs/26.scm"

build-srfi-26-mosh-library-docker-head:
	

test-srfi-26-racket:
	
	racket -I r7rs -S . --script srfi-test/r7rs-programs/26.scm

build-srfi-26-racket-library:
	

test-srfi-26-racket-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:latest bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/26.scm"

build-srfi-26-racket-library-docker:
	

test-srfi-26-racket-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:latest bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/26.scm"

build-srfi-26-racket-library-docker-head:
	

test-srfi-26-sagittarius:
	
	sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/26.scm

build-srfi-26-sagittarius-library:
	

test-srfi-26-sagittarius-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:latest bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/26.scm"

build-srfi-26-sagittarius-library-docker:
	

test-srfi-26-sagittarius-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:latest bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/26.scm"

build-srfi-26-sagittarius-library-docker-head:
	

test-srfi-26-stklos:
	
	stklos -I . -I ./srfi -f srfi-test/r7rs-programs/26.scm

build-srfi-26-stklos-library:
	

test-srfi-26-stklos-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:latest bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/26.scm"

build-srfi-26-stklos-library-docker:
	

test-srfi-26-stklos-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:latest bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/26.scm"

build-srfi-26-stklos-library-docker-head:
	

test-srfi-26-skint:
	
	skint -I ./ srfi-test/r7rs-programs/26.scm

build-srfi-26-skint-library:
	

test-srfi-26-skint-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:latest bash -c "cd workdir && skint -I ./ srfi-test/r7rs-programs/26.scm"

build-srfi-26-skint-library-docker:
	

test-srfi-26-skint-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:latest bash -c "cd workdir && skint -I ./ srfi-test/r7rs-programs/26.scm"

build-srfi-26-skint-library-docker-head:
	

test-srfi-26-tr7:
	
	tr7i srfi-test/r7rs-programs/26.scm

build-srfi-26-tr7-library:
	

test-srfi-26-tr7-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:latest bash -c "cd workdir && tr7i srfi-test/r7rs-programs/26.scm"

build-srfi-26-tr7-library-docker:
	

test-srfi-26-tr7-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:latest bash -c "cd workdir && tr7i srfi-test/r7rs-programs/26.scm"

build-srfi-26-tr7-library-docker-head:
	

test-srfi-26-ypsilon:
	
	ypsilon --r7rs --loadpath=. --loadpath=./srfi srfi-test/r7rs-programs/26.scm

build-srfi-26-ypsilon-library:
	

test-srfi-26-ypsilon-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/ypsilon:latest bash -c "cd workdir && ypsilon --r7rs --loadpath=. --loadpath=./srfi srfi-test/r7rs-programs/26.scm"

build-srfi-26-ypsilon-library-docker:
	

test-srfi-26-ypsilon-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/ypsilon:latest bash -c "cd workdir && ypsilon --r7rs --loadpath=. --loadpath=./srfi srfi-test/r7rs-programs/26.scm"

build-srfi-26-ypsilon-library-docker-head:
	

test-srfi-28-chibi:
	
	chibi-scheme -I . srfi-test/r7rs-programs/28.scm

build-srfi-28-chibi-library:
	

test-srfi-28-chibi-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:latest bash -c "cd workdir && chibi-scheme -I . srfi-test/r7rs-programs/28.scm"

build-srfi-28-chibi-library-docker:
	

test-srfi-28-chibi-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:latest bash -c "cd workdir && chibi-scheme -I . srfi-test/r7rs-programs/28.scm"

build-srfi-28-chibi-library-docker-head:
	

test-srfi-28-chicken-compiler:
	 csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi/28.sld 
	csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/28.scm && srfi-test/r7rs-programs/28 && rm srfi-test/r7rs-programs/28

build-srfi-28-chicken-compiler-library:
	 csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi/28.sld 

test-srfi-28-chicken-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken-compiler:latest bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi/28.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/28.scm && srfi-test/r7rs-programs/28 && rm srfi-test/r7rs-programs/28"

build-srfi-28-chicken-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken-compiler:latest bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi/28.sld" 

test-srfi-28-chicken-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken-compiler:head bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi/28.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/28.scm && srfi-test/r7rs-programs/28 && rm srfi-test/r7rs-programs/28"

build-srfi-28-chicken-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken-compiler:head bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi/28.sld" 

test-srfi-28-chicken-interpreter:
	
	csi srfi-test/r7rs-programs/28.scm

build-srfi-28-chicken-interpreter-library:
	

test-srfi-28-chicken-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csi srfi-test/r7rs-programs/28.scm"

build-srfi-28-chicken-interpreter-library-docker:
	

test-srfi-28-chicken-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csi srfi-test/r7rs-programs/28.scm"

build-srfi-28-chicken-interpreter-library-docker-head:
	

test-srfi-28-cyclone-compiler:
	 cyclone -I . srfi/28.sld 
	cyclone -I . srfi-test/r7rs-programs/28.scm && srfi-test/r7rs-programs/28 && rm srfi-test/r7rs-programs/28

build-srfi-28-cyclone-compiler-library:
	 cyclone -I . srfi/28.sld 

test-srfi-28-cyclone-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone-compiler:latest bash -c "cd workdir && cyclone -I . srfi/28.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi-test/r7rs-programs/28.scm && srfi-test/r7rs-programs/28 && rm srfi-test/r7rs-programs/28"

build-srfi-28-cyclone-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone-compiler:latest bash -c "cd workdir && cyclone -I . srfi/28.sld" 

test-srfi-28-cyclone-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone-compiler:head bash -c "cd workdir && cyclone -I . srfi/28.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi-test/r7rs-programs/28.scm && srfi-test/r7rs-programs/28 && rm srfi-test/r7rs-programs/28"

build-srfi-28-cyclone-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone-compiler:head bash -c "cd workdir && cyclone -I . srfi/28.sld" 

test-srfi-28-cyclone-interpreter:
	
	icyc -I . srfi-test/r7rs-programs/28.scm

build-srfi-28-cyclone-interpreter-library:
	

test-srfi-28-cyclone-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && icyc -I . srfi-test/r7rs-programs/28.scm"

build-srfi-28-cyclone-interpreter-library-docker:
	

test-srfi-28-cyclone-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && icyc -I . srfi-test/r7rs-programs/28.scm"

build-srfi-28-cyclone-interpreter-library-docker-head:
	

test-srfi-28-foment:
	
	foment -I . -I ./srfi srfi-test/r7rs-programs/28.scm

build-srfi-28-foment-library:
	

test-srfi-28-foment-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment:latest bash -c "cd workdir && foment -I . -I ./srfi srfi-test/r7rs-programs/28.scm"

build-srfi-28-foment-library-docker:
	

test-srfi-28-foment-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment:latest bash -c "cd workdir && foment -I . -I ./srfi srfi-test/r7rs-programs/28.scm"

build-srfi-28-foment-library-docker-head:
	

test-srfi-28-gambit-compiler:
	 gsc -:search=.,s -debug -warnings -obj srfi/28.sld 
	gsc -:search=.,s -debug -warnings -exe ./  -nopreload srfi-test/r7rs-programs/28.scm && srfi-test/r7rs-programs/28 && rm srfi-test/r7rs-programs/28

build-srfi-28-gambit-compiler-library:
	 gsc -:search=.,s -debug -warnings -obj srfi/28.sld 

test-srfi-28-gambit-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit-compiler:latest bash -c "cd workdir && gsc -:search=.,s -debug -warnings -obj srfi/28.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsc -:search=.,s -debug -warnings -exe ./  -nopreload srfi-test/r7rs-programs/28.scm && srfi-test/r7rs-programs/28 && rm srfi-test/r7rs-programs/28"

build-srfi-28-gambit-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit-compiler:latest bash -c "cd workdir && gsc -:search=.,s -debug -warnings -obj srfi/28.sld" 

test-srfi-28-gambit-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit-compiler:head bash -c "cd workdir && gsc -:search=.,s -debug -warnings -obj srfi/28.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsc -:search=.,s -debug -warnings -exe ./  -nopreload srfi-test/r7rs-programs/28.scm && srfi-test/r7rs-programs/28 && rm srfi-test/r7rs-programs/28"

build-srfi-28-gambit-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit-compiler:head bash -c "cd workdir && gsc -:search=.,s -debug -warnings -obj srfi/28.sld" 

test-srfi-28-gambit-interpreter:
	
	gsi -:s srfi-test/r7rs-programs/28.scm

build-srfi-28-gambit-interpreter-library:
	

test-srfi-28-gambit-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsi -:s srfi-test/r7rs-programs/28.scm"

build-srfi-28-gambit-interpreter-library-docker:
	

test-srfi-28-gambit-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsi -:s srfi-test/r7rs-programs/28.scm"

build-srfi-28-gambit-interpreter-library-docker-head:
	

test-srfi-28-gauche:
	
	gosh -r7 -I . srfi-test/r7rs-programs/28.scm

build-srfi-28-gauche-library:
	

test-srfi-28-gauche-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:latest bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/28.scm"

build-srfi-28-gauche-library-docker:
	

test-srfi-28-gauche-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:latest bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/28.scm"

build-srfi-28-gauche-library-docker-head:
	

test-srfi-28-gerbil-compiler:
	 gxc -O srfi/28.sld 
	gxc --lang r7rs srfi-test/r7rs-programs/28.scm && srfi-test/r7rs-programs/28 && rm srfi-test/r7rs-programs/28

build-srfi-28-gerbil-compiler-library:
	 gxc -O srfi/28.sld 

test-srfi-28-gerbil-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil-compiler:latest bash -c "cd workdir && gxc -O srfi/28.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc --lang r7rs srfi-test/r7rs-programs/28.scm && srfi-test/r7rs-programs/28 && rm srfi-test/r7rs-programs/28"

build-srfi-28-gerbil-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil-compiler:latest bash -c "cd workdir && gxc -O srfi/28.sld" 

test-srfi-28-gerbil-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil-compiler:head bash -c "cd workdir && gxc -O srfi/28.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc --lang r7rs srfi-test/r7rs-programs/28.scm && srfi-test/r7rs-programs/28 && rm srfi-test/r7rs-programs/28"

build-srfi-28-gerbil-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil-compiler:head bash -c "cd workdir && gxc -O srfi/28.sld" 

test-srfi-28-gerbil-interpreter:
	
	gxi --lang r7rs srfi-test/r7rs-programs/28.scm

build-srfi-28-gerbil-interpreter-library:
	

test-srfi-28-gerbil-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxi --lang r7rs srfi-test/r7rs-programs/28.scm"

build-srfi-28-gerbil-interpreter-library-docker:
	

test-srfi-28-gerbil-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxi --lang r7rs srfi-test/r7rs-programs/28.scm"

build-srfi-28-gerbil-interpreter-library-docker-head:
	

test-srfi-28-guile:
	
	guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/28.scm

build-srfi-28-guile-library:
	

test-srfi-28-guile-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:latest bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/28.scm"

build-srfi-28-guile-library-docker:
	

test-srfi-28-guile-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:latest bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/28.scm"

build-srfi-28-guile-library-docker-head:
	

test-srfi-28-kawa:
	
	kawa --r7rs -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/28.scm

build-srfi-28-kawa-library:
	

test-srfi-28-kawa-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:latest bash -c "cd workdir && kawa --r7rs -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/28.scm"

build-srfi-28-kawa-library-docker:
	

test-srfi-28-kawa-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:latest bash -c "cd workdir && kawa --r7rs -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/28.scm"

build-srfi-28-kawa-library-docker-head:
	

test-srfi-28-loko:
	 ls srfi/28.sld 
	loko -std=r7rs --compile srfi-test/r7rs-programs/28.scm && srfi-test/r7rs-programs/28 && rm srfi-test/r7rs-programs/28

build-srfi-28-loko-library:
	 ls srfi/28.sld 

test-srfi-28-loko-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && ls srfi/28.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/28.scm && srfi-test/r7rs-programs/28 && rm srfi-test/r7rs-programs/28"

build-srfi-28-loko-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && ls srfi/28.sld" 

test-srfi-28-loko-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:head bash -c "cd workdir && ls srfi/28.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/28.scm && srfi-test/r7rs-programs/28 && rm srfi-test/r7rs-programs/28"

build-srfi-28-loko-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:head bash -c "cd workdir && ls srfi/28.sld" 

test-srfi-28-mit-scheme:
	
	mit-scheme --batch-mode --load ./srfi/26.sld ./srfi/28.sld ./srfi/64.sld srfi-test/r7rs-programs/28.scm

build-srfi-28-mit-scheme-library:
	

test-srfi-28-mit-scheme-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --batch-mode --load ./srfi/26.sld ./srfi/28.sld ./srfi/64.sld srfi-test/r7rs-programs/28.scm"

build-srfi-28-mit-scheme-library-docker:
	

test-srfi-28-mit-scheme-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --batch-mode --load ./srfi/26.sld ./srfi/28.sld ./srfi/64.sld srfi-test/r7rs-programs/28.scm"

build-srfi-28-mit-scheme-library-docker-head:
	

test-srfi-28-mosh:
	
	mosh --loadpath=. srfi-test/r7rs-programs/28.scm

build-srfi-28-mosh-library:
	

test-srfi-28-mosh-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mosh:latest bash -c "cd workdir && mosh --loadpath=. srfi-test/r7rs-programs/28.scm"

build-srfi-28-mosh-library-docker:
	

test-srfi-28-mosh-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mosh:latest bash -c "cd workdir && mosh --loadpath=. srfi-test/r7rs-programs/28.scm"

build-srfi-28-mosh-library-docker-head:
	

test-srfi-28-racket:
	
	racket -I r7rs -S . --script srfi-test/r7rs-programs/28.scm

build-srfi-28-racket-library:
	

test-srfi-28-racket-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:latest bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/28.scm"

build-srfi-28-racket-library-docker:
	

test-srfi-28-racket-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:latest bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/28.scm"

build-srfi-28-racket-library-docker-head:
	

test-srfi-28-sagittarius:
	
	sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/28.scm

build-srfi-28-sagittarius-library:
	

test-srfi-28-sagittarius-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:latest bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/28.scm"

build-srfi-28-sagittarius-library-docker:
	

test-srfi-28-sagittarius-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:latest bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/28.scm"

build-srfi-28-sagittarius-library-docker-head:
	

test-srfi-28-stklos:
	
	stklos -I . -I ./srfi -f srfi-test/r7rs-programs/28.scm

build-srfi-28-stklos-library:
	

test-srfi-28-stklos-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:latest bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/28.scm"

build-srfi-28-stklos-library-docker:
	

test-srfi-28-stklos-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:latest bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/28.scm"

build-srfi-28-stklos-library-docker-head:
	

test-srfi-28-skint:
	
	skint -I ./ srfi-test/r7rs-programs/28.scm

build-srfi-28-skint-library:
	

test-srfi-28-skint-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:latest bash -c "cd workdir && skint -I ./ srfi-test/r7rs-programs/28.scm"

build-srfi-28-skint-library-docker:
	

test-srfi-28-skint-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:latest bash -c "cd workdir && skint -I ./ srfi-test/r7rs-programs/28.scm"

build-srfi-28-skint-library-docker-head:
	

test-srfi-28-tr7:
	
	tr7i srfi-test/r7rs-programs/28.scm

build-srfi-28-tr7-library:
	

test-srfi-28-tr7-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:latest bash -c "cd workdir && tr7i srfi-test/r7rs-programs/28.scm"

build-srfi-28-tr7-library-docker:
	

test-srfi-28-tr7-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:latest bash -c "cd workdir && tr7i srfi-test/r7rs-programs/28.scm"

build-srfi-28-tr7-library-docker-head:
	

test-srfi-28-ypsilon:
	
	ypsilon --r7rs --loadpath=. --loadpath=./srfi srfi-test/r7rs-programs/28.scm

build-srfi-28-ypsilon-library:
	

test-srfi-28-ypsilon-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/ypsilon:latest bash -c "cd workdir && ypsilon --r7rs --loadpath=. --loadpath=./srfi srfi-test/r7rs-programs/28.scm"

build-srfi-28-ypsilon-library-docker:
	

test-srfi-28-ypsilon-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/ypsilon:latest bash -c "cd workdir && ypsilon --r7rs --loadpath=. --loadpath=./srfi srfi-test/r7rs-programs/28.scm"

build-srfi-28-ypsilon-library-docker-head:
	

test-srfi-13-chibi:
	
	chibi-scheme -I . srfi-test/r7rs-programs/13.scm

build-srfi-13-chibi-library:
	

test-srfi-13-chibi-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:latest bash -c "cd workdir && chibi-scheme -I . srfi-test/r7rs-programs/13.scm"

build-srfi-13-chibi-library-docker:
	

test-srfi-13-chibi-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:latest bash -c "cd workdir && chibi-scheme -I . srfi-test/r7rs-programs/13.scm"

build-srfi-13-chibi-library-docker-head:
	

test-srfi-13-chicken-compiler:
	 csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi/13.sld 
	csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/13.scm && srfi-test/r7rs-programs/13 && rm srfi-test/r7rs-programs/13

build-srfi-13-chicken-compiler-library:
	 csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi/13.sld 

test-srfi-13-chicken-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken-compiler:latest bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi/13.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/13.scm && srfi-test/r7rs-programs/13 && rm srfi-test/r7rs-programs/13"

build-srfi-13-chicken-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken-compiler:latest bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi/13.sld" 

test-srfi-13-chicken-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken-compiler:head bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi/13.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/13.scm && srfi-test/r7rs-programs/13 && rm srfi-test/r7rs-programs/13"

build-srfi-13-chicken-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken-compiler:head bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi/13.sld" 

test-srfi-13-chicken-interpreter:
	
	csi srfi-test/r7rs-programs/13.scm

build-srfi-13-chicken-interpreter-library:
	

test-srfi-13-chicken-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csi srfi-test/r7rs-programs/13.scm"

build-srfi-13-chicken-interpreter-library-docker:
	

test-srfi-13-chicken-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csi srfi-test/r7rs-programs/13.scm"

build-srfi-13-chicken-interpreter-library-docker-head:
	

test-srfi-13-cyclone-compiler:
	 cyclone -I . srfi/13.sld 
	cyclone -I . srfi-test/r7rs-programs/13.scm && srfi-test/r7rs-programs/13 && rm srfi-test/r7rs-programs/13

build-srfi-13-cyclone-compiler-library:
	 cyclone -I . srfi/13.sld 

test-srfi-13-cyclone-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone-compiler:latest bash -c "cd workdir && cyclone -I . srfi/13.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi-test/r7rs-programs/13.scm && srfi-test/r7rs-programs/13 && rm srfi-test/r7rs-programs/13"

build-srfi-13-cyclone-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone-compiler:latest bash -c "cd workdir && cyclone -I . srfi/13.sld" 

test-srfi-13-cyclone-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone-compiler:head bash -c "cd workdir && cyclone -I . srfi/13.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi-test/r7rs-programs/13.scm && srfi-test/r7rs-programs/13 && rm srfi-test/r7rs-programs/13"

build-srfi-13-cyclone-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone-compiler:head bash -c "cd workdir && cyclone -I . srfi/13.sld" 

test-srfi-13-cyclone-interpreter:
	
	icyc -I . srfi-test/r7rs-programs/13.scm

build-srfi-13-cyclone-interpreter-library:
	

test-srfi-13-cyclone-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && icyc -I . srfi-test/r7rs-programs/13.scm"

build-srfi-13-cyclone-interpreter-library-docker:
	

test-srfi-13-cyclone-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && icyc -I . srfi-test/r7rs-programs/13.scm"

build-srfi-13-cyclone-interpreter-library-docker-head:
	

test-srfi-13-foment:
	
	foment -I . -I ./srfi srfi-test/r7rs-programs/13.scm

build-srfi-13-foment-library:
	

test-srfi-13-foment-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment:latest bash -c "cd workdir && foment -I . -I ./srfi srfi-test/r7rs-programs/13.scm"

build-srfi-13-foment-library-docker:
	

test-srfi-13-foment-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment:latest bash -c "cd workdir && foment -I . -I ./srfi srfi-test/r7rs-programs/13.scm"

build-srfi-13-foment-library-docker-head:
	

test-srfi-13-gambit-compiler:
	 gsc -:search=.,s -debug -warnings -obj srfi/13.sld 
	gsc -:search=.,s -debug -warnings -exe ./  -nopreload srfi-test/r7rs-programs/13.scm && srfi-test/r7rs-programs/13 && rm srfi-test/r7rs-programs/13

build-srfi-13-gambit-compiler-library:
	 gsc -:search=.,s -debug -warnings -obj srfi/13.sld 

test-srfi-13-gambit-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit-compiler:latest bash -c "cd workdir && gsc -:search=.,s -debug -warnings -obj srfi/13.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsc -:search=.,s -debug -warnings -exe ./  -nopreload srfi-test/r7rs-programs/13.scm && srfi-test/r7rs-programs/13 && rm srfi-test/r7rs-programs/13"

build-srfi-13-gambit-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit-compiler:latest bash -c "cd workdir && gsc -:search=.,s -debug -warnings -obj srfi/13.sld" 

test-srfi-13-gambit-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit-compiler:head bash -c "cd workdir && gsc -:search=.,s -debug -warnings -obj srfi/13.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsc -:search=.,s -debug -warnings -exe ./  -nopreload srfi-test/r7rs-programs/13.scm && srfi-test/r7rs-programs/13 && rm srfi-test/r7rs-programs/13"

build-srfi-13-gambit-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit-compiler:head bash -c "cd workdir && gsc -:search=.,s -debug -warnings -obj srfi/13.sld" 

test-srfi-13-gambit-interpreter:
	
	gsi -:s srfi-test/r7rs-programs/13.scm

build-srfi-13-gambit-interpreter-library:
	

test-srfi-13-gambit-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsi -:s srfi-test/r7rs-programs/13.scm"

build-srfi-13-gambit-interpreter-library-docker:
	

test-srfi-13-gambit-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsi -:s srfi-test/r7rs-programs/13.scm"

build-srfi-13-gambit-interpreter-library-docker-head:
	

test-srfi-13-gauche:
	
	gosh -r7 -I . srfi-test/r7rs-programs/13.scm

build-srfi-13-gauche-library:
	

test-srfi-13-gauche-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:latest bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/13.scm"

build-srfi-13-gauche-library-docker:
	

test-srfi-13-gauche-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:latest bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/13.scm"

build-srfi-13-gauche-library-docker-head:
	

test-srfi-13-gerbil-compiler:
	 gxc -O srfi/13.sld 
	gxc --lang r7rs srfi-test/r7rs-programs/13.scm && srfi-test/r7rs-programs/13 && rm srfi-test/r7rs-programs/13

build-srfi-13-gerbil-compiler-library:
	 gxc -O srfi/13.sld 

test-srfi-13-gerbil-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil-compiler:latest bash -c "cd workdir && gxc -O srfi/13.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc --lang r7rs srfi-test/r7rs-programs/13.scm && srfi-test/r7rs-programs/13 && rm srfi-test/r7rs-programs/13"

build-srfi-13-gerbil-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil-compiler:latest bash -c "cd workdir && gxc -O srfi/13.sld" 

test-srfi-13-gerbil-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil-compiler:head bash -c "cd workdir && gxc -O srfi/13.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc --lang r7rs srfi-test/r7rs-programs/13.scm && srfi-test/r7rs-programs/13 && rm srfi-test/r7rs-programs/13"

build-srfi-13-gerbil-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil-compiler:head bash -c "cd workdir && gxc -O srfi/13.sld" 

test-srfi-13-gerbil-interpreter:
	
	gxi --lang r7rs srfi-test/r7rs-programs/13.scm

build-srfi-13-gerbil-interpreter-library:
	

test-srfi-13-gerbil-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxi --lang r7rs srfi-test/r7rs-programs/13.scm"

build-srfi-13-gerbil-interpreter-library-docker:
	

test-srfi-13-gerbil-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxi --lang r7rs srfi-test/r7rs-programs/13.scm"

build-srfi-13-gerbil-interpreter-library-docker-head:
	

test-srfi-13-guile:
	
	guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/13.scm

build-srfi-13-guile-library:
	

test-srfi-13-guile-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:latest bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/13.scm"

build-srfi-13-guile-library-docker:
	

test-srfi-13-guile-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:latest bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/13.scm"

build-srfi-13-guile-library-docker-head:
	

test-srfi-13-kawa:
	
	kawa --r7rs -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/13.scm

build-srfi-13-kawa-library:
	

test-srfi-13-kawa-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:latest bash -c "cd workdir && kawa --r7rs -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/13.scm"

build-srfi-13-kawa-library-docker:
	

test-srfi-13-kawa-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:latest bash -c "cd workdir && kawa --r7rs -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/13.scm"

build-srfi-13-kawa-library-docker-head:
	

test-srfi-13-loko:
	 ls srfi/13.sld 
	loko -std=r7rs --compile srfi-test/r7rs-programs/13.scm && srfi-test/r7rs-programs/13 && rm srfi-test/r7rs-programs/13

build-srfi-13-loko-library:
	 ls srfi/13.sld 

test-srfi-13-loko-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && ls srfi/13.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/13.scm && srfi-test/r7rs-programs/13 && rm srfi-test/r7rs-programs/13"

build-srfi-13-loko-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && ls srfi/13.sld" 

test-srfi-13-loko-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:head bash -c "cd workdir && ls srfi/13.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/13.scm && srfi-test/r7rs-programs/13 && rm srfi-test/r7rs-programs/13"

build-srfi-13-loko-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:head bash -c "cd workdir && ls srfi/13.sld" 

test-srfi-13-mit-scheme:
	
	mit-scheme --batch-mode --load ./srfi/26.sld ./srfi/28.sld ./srfi/64.sld srfi-test/r7rs-programs/13.scm

build-srfi-13-mit-scheme-library:
	

test-srfi-13-mit-scheme-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --batch-mode --load ./srfi/26.sld ./srfi/28.sld ./srfi/64.sld srfi-test/r7rs-programs/13.scm"

build-srfi-13-mit-scheme-library-docker:
	

test-srfi-13-mit-scheme-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --batch-mode --load ./srfi/26.sld ./srfi/28.sld ./srfi/64.sld srfi-test/r7rs-programs/13.scm"

build-srfi-13-mit-scheme-library-docker-head:
	

test-srfi-13-mosh:
	
	mosh --loadpath=. srfi-test/r7rs-programs/13.scm

build-srfi-13-mosh-library:
	

test-srfi-13-mosh-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mosh:latest bash -c "cd workdir && mosh --loadpath=. srfi-test/r7rs-programs/13.scm"

build-srfi-13-mosh-library-docker:
	

test-srfi-13-mosh-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mosh:latest bash -c "cd workdir && mosh --loadpath=. srfi-test/r7rs-programs/13.scm"

build-srfi-13-mosh-library-docker-head:
	

test-srfi-13-racket:
	
	racket -I r7rs -S . --script srfi-test/r7rs-programs/13.scm

build-srfi-13-racket-library:
	

test-srfi-13-racket-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:latest bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/13.scm"

build-srfi-13-racket-library-docker:
	

test-srfi-13-racket-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:latest bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/13.scm"

build-srfi-13-racket-library-docker-head:
	

test-srfi-13-sagittarius:
	
	sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/13.scm

build-srfi-13-sagittarius-library:
	

test-srfi-13-sagittarius-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:latest bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/13.scm"

build-srfi-13-sagittarius-library-docker:
	

test-srfi-13-sagittarius-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:latest bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/13.scm"

build-srfi-13-sagittarius-library-docker-head:
	

test-srfi-13-stklos:
	
	stklos -I . -I ./srfi -f srfi-test/r7rs-programs/13.scm

build-srfi-13-stklos-library:
	

test-srfi-13-stklos-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:latest bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/13.scm"

build-srfi-13-stklos-library-docker:
	

test-srfi-13-stklos-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:latest bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/13.scm"

build-srfi-13-stklos-library-docker-head:
	

test-srfi-13-skint:
	
	skint -I ./ srfi-test/r7rs-programs/13.scm

build-srfi-13-skint-library:
	

test-srfi-13-skint-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:latest bash -c "cd workdir && skint -I ./ srfi-test/r7rs-programs/13.scm"

build-srfi-13-skint-library-docker:
	

test-srfi-13-skint-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:latest bash -c "cd workdir && skint -I ./ srfi-test/r7rs-programs/13.scm"

build-srfi-13-skint-library-docker-head:
	

test-srfi-13-tr7:
	
	tr7i srfi-test/r7rs-programs/13.scm

build-srfi-13-tr7-library:
	

test-srfi-13-tr7-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:latest bash -c "cd workdir && tr7i srfi-test/r7rs-programs/13.scm"

build-srfi-13-tr7-library-docker:
	

test-srfi-13-tr7-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:latest bash -c "cd workdir && tr7i srfi-test/r7rs-programs/13.scm"

build-srfi-13-tr7-library-docker-head:
	

test-srfi-13-ypsilon:
	
	ypsilon --r7rs --loadpath=. --loadpath=./srfi srfi-test/r7rs-programs/13.scm

build-srfi-13-ypsilon-library:
	

test-srfi-13-ypsilon-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/ypsilon:latest bash -c "cd workdir && ypsilon --r7rs --loadpath=. --loadpath=./srfi srfi-test/r7rs-programs/13.scm"

build-srfi-13-ypsilon-library-docker:
	

test-srfi-13-ypsilon-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/ypsilon:latest bash -c "cd workdir && ypsilon --r7rs --loadpath=. --loadpath=./srfi srfi-test/r7rs-programs/13.scm"

build-srfi-13-ypsilon-library-docker-head:
	

test-srfi-60-chibi:
	
	chibi-scheme -I . srfi-test/r7rs-programs/60.scm

build-srfi-60-chibi-library:
	

test-srfi-60-chibi-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:latest bash -c "cd workdir && chibi-scheme -I . srfi-test/r7rs-programs/60.scm"

build-srfi-60-chibi-library-docker:
	

test-srfi-60-chibi-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:latest bash -c "cd workdir && chibi-scheme -I . srfi-test/r7rs-programs/60.scm"

build-srfi-60-chibi-library-docker-head:
	

test-srfi-60-chicken-compiler:
	 csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi/60.sld 
	csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/60.scm && srfi-test/r7rs-programs/60 && rm srfi-test/r7rs-programs/60

build-srfi-60-chicken-compiler-library:
	 csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi/60.sld 

test-srfi-60-chicken-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken-compiler:latest bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi/60.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/60.scm && srfi-test/r7rs-programs/60 && rm srfi-test/r7rs-programs/60"

build-srfi-60-chicken-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken-compiler:latest bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi/60.sld" 

test-srfi-60-chicken-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken-compiler:head bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi/60.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/60.scm && srfi-test/r7rs-programs/60 && rm srfi-test/r7rs-programs/60"

build-srfi-60-chicken-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken-compiler:head bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi/60.sld" 

test-srfi-60-chicken-interpreter:
	
	csi srfi-test/r7rs-programs/60.scm

build-srfi-60-chicken-interpreter-library:
	

test-srfi-60-chicken-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csi srfi-test/r7rs-programs/60.scm"

build-srfi-60-chicken-interpreter-library-docker:
	

test-srfi-60-chicken-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csi srfi-test/r7rs-programs/60.scm"

build-srfi-60-chicken-interpreter-library-docker-head:
	

test-srfi-60-cyclone-compiler:
	 cyclone -I . srfi/60.sld 
	cyclone -I . srfi-test/r7rs-programs/60.scm && srfi-test/r7rs-programs/60 && rm srfi-test/r7rs-programs/60

build-srfi-60-cyclone-compiler-library:
	 cyclone -I . srfi/60.sld 

test-srfi-60-cyclone-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone-compiler:latest bash -c "cd workdir && cyclone -I . srfi/60.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi-test/r7rs-programs/60.scm && srfi-test/r7rs-programs/60 && rm srfi-test/r7rs-programs/60"

build-srfi-60-cyclone-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone-compiler:latest bash -c "cd workdir && cyclone -I . srfi/60.sld" 

test-srfi-60-cyclone-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone-compiler:head bash -c "cd workdir && cyclone -I . srfi/60.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi-test/r7rs-programs/60.scm && srfi-test/r7rs-programs/60 && rm srfi-test/r7rs-programs/60"

build-srfi-60-cyclone-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone-compiler:head bash -c "cd workdir && cyclone -I . srfi/60.sld" 

test-srfi-60-cyclone-interpreter:
	
	icyc -I . srfi-test/r7rs-programs/60.scm

build-srfi-60-cyclone-interpreter-library:
	

test-srfi-60-cyclone-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && icyc -I . srfi-test/r7rs-programs/60.scm"

build-srfi-60-cyclone-interpreter-library-docker:
	

test-srfi-60-cyclone-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && icyc -I . srfi-test/r7rs-programs/60.scm"

build-srfi-60-cyclone-interpreter-library-docker-head:
	

test-srfi-60-foment:
	
	foment -I . -I ./srfi srfi-test/r7rs-programs/60.scm

build-srfi-60-foment-library:
	

test-srfi-60-foment-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment:latest bash -c "cd workdir && foment -I . -I ./srfi srfi-test/r7rs-programs/60.scm"

build-srfi-60-foment-library-docker:
	

test-srfi-60-foment-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment:latest bash -c "cd workdir && foment -I . -I ./srfi srfi-test/r7rs-programs/60.scm"

build-srfi-60-foment-library-docker-head:
	

test-srfi-60-gambit-compiler:
	 gsc -:search=.,s -debug -warnings -obj srfi/60.sld 
	gsc -:search=.,s -debug -warnings -exe ./  -nopreload srfi-test/r7rs-programs/60.scm && srfi-test/r7rs-programs/60 && rm srfi-test/r7rs-programs/60

build-srfi-60-gambit-compiler-library:
	 gsc -:search=.,s -debug -warnings -obj srfi/60.sld 

test-srfi-60-gambit-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit-compiler:latest bash -c "cd workdir && gsc -:search=.,s -debug -warnings -obj srfi/60.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsc -:search=.,s -debug -warnings -exe ./  -nopreload srfi-test/r7rs-programs/60.scm && srfi-test/r7rs-programs/60 && rm srfi-test/r7rs-programs/60"

build-srfi-60-gambit-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit-compiler:latest bash -c "cd workdir && gsc -:search=.,s -debug -warnings -obj srfi/60.sld" 

test-srfi-60-gambit-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit-compiler:head bash -c "cd workdir && gsc -:search=.,s -debug -warnings -obj srfi/60.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsc -:search=.,s -debug -warnings -exe ./  -nopreload srfi-test/r7rs-programs/60.scm && srfi-test/r7rs-programs/60 && rm srfi-test/r7rs-programs/60"

build-srfi-60-gambit-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit-compiler:head bash -c "cd workdir && gsc -:search=.,s -debug -warnings -obj srfi/60.sld" 

test-srfi-60-gambit-interpreter:
	
	gsi -:s srfi-test/r7rs-programs/60.scm

build-srfi-60-gambit-interpreter-library:
	

test-srfi-60-gambit-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsi -:s srfi-test/r7rs-programs/60.scm"

build-srfi-60-gambit-interpreter-library-docker:
	

test-srfi-60-gambit-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsi -:s srfi-test/r7rs-programs/60.scm"

build-srfi-60-gambit-interpreter-library-docker-head:
	

test-srfi-60-gauche:
	
	gosh -r7 -I . srfi-test/r7rs-programs/60.scm

build-srfi-60-gauche-library:
	

test-srfi-60-gauche-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:latest bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/60.scm"

build-srfi-60-gauche-library-docker:
	

test-srfi-60-gauche-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:latest bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/60.scm"

build-srfi-60-gauche-library-docker-head:
	

test-srfi-60-gerbil-compiler:
	 gxc -O srfi/60.sld 
	gxc --lang r7rs srfi-test/r7rs-programs/60.scm && srfi-test/r7rs-programs/60 && rm srfi-test/r7rs-programs/60

build-srfi-60-gerbil-compiler-library:
	 gxc -O srfi/60.sld 

test-srfi-60-gerbil-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil-compiler:latest bash -c "cd workdir && gxc -O srfi/60.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc --lang r7rs srfi-test/r7rs-programs/60.scm && srfi-test/r7rs-programs/60 && rm srfi-test/r7rs-programs/60"

build-srfi-60-gerbil-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil-compiler:latest bash -c "cd workdir && gxc -O srfi/60.sld" 

test-srfi-60-gerbil-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil-compiler:head bash -c "cd workdir && gxc -O srfi/60.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc --lang r7rs srfi-test/r7rs-programs/60.scm && srfi-test/r7rs-programs/60 && rm srfi-test/r7rs-programs/60"

build-srfi-60-gerbil-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil-compiler:head bash -c "cd workdir && gxc -O srfi/60.sld" 

test-srfi-60-gerbil-interpreter:
	
	gxi --lang r7rs srfi-test/r7rs-programs/60.scm

build-srfi-60-gerbil-interpreter-library:
	

test-srfi-60-gerbil-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxi --lang r7rs srfi-test/r7rs-programs/60.scm"

build-srfi-60-gerbil-interpreter-library-docker:
	

test-srfi-60-gerbil-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxi --lang r7rs srfi-test/r7rs-programs/60.scm"

build-srfi-60-gerbil-interpreter-library-docker-head:
	

test-srfi-60-guile:
	
	guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/60.scm

build-srfi-60-guile-library:
	

test-srfi-60-guile-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:latest bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/60.scm"

build-srfi-60-guile-library-docker:
	

test-srfi-60-guile-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:latest bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/60.scm"

build-srfi-60-guile-library-docker-head:
	

test-srfi-60-kawa:
	
	kawa --r7rs -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/60.scm

build-srfi-60-kawa-library:
	

test-srfi-60-kawa-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:latest bash -c "cd workdir && kawa --r7rs -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/60.scm"

build-srfi-60-kawa-library-docker:
	

test-srfi-60-kawa-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:latest bash -c "cd workdir && kawa --r7rs -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/60.scm"

build-srfi-60-kawa-library-docker-head:
	

test-srfi-60-loko:
	 ls srfi/60.sld 
	loko -std=r7rs --compile srfi-test/r7rs-programs/60.scm && srfi-test/r7rs-programs/60 && rm srfi-test/r7rs-programs/60

build-srfi-60-loko-library:
	 ls srfi/60.sld 

test-srfi-60-loko-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && ls srfi/60.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/60.scm && srfi-test/r7rs-programs/60 && rm srfi-test/r7rs-programs/60"

build-srfi-60-loko-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && ls srfi/60.sld" 

test-srfi-60-loko-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:head bash -c "cd workdir && ls srfi/60.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/60.scm && srfi-test/r7rs-programs/60 && rm srfi-test/r7rs-programs/60"

build-srfi-60-loko-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:head bash -c "cd workdir && ls srfi/60.sld" 

test-srfi-60-mit-scheme:
	
	mit-scheme --batch-mode --load ./srfi/26.sld ./srfi/28.sld ./srfi/64.sld srfi-test/r7rs-programs/60.scm

build-srfi-60-mit-scheme-library:
	

test-srfi-60-mit-scheme-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --batch-mode --load ./srfi/26.sld ./srfi/28.sld ./srfi/64.sld srfi-test/r7rs-programs/60.scm"

build-srfi-60-mit-scheme-library-docker:
	

test-srfi-60-mit-scheme-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --batch-mode --load ./srfi/26.sld ./srfi/28.sld ./srfi/64.sld srfi-test/r7rs-programs/60.scm"

build-srfi-60-mit-scheme-library-docker-head:
	

test-srfi-60-mosh:
	
	mosh --loadpath=. srfi-test/r7rs-programs/60.scm

build-srfi-60-mosh-library:
	

test-srfi-60-mosh-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mosh:latest bash -c "cd workdir && mosh --loadpath=. srfi-test/r7rs-programs/60.scm"

build-srfi-60-mosh-library-docker:
	

test-srfi-60-mosh-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mosh:latest bash -c "cd workdir && mosh --loadpath=. srfi-test/r7rs-programs/60.scm"

build-srfi-60-mosh-library-docker-head:
	

test-srfi-60-racket:
	
	racket -I r7rs -S . --script srfi-test/r7rs-programs/60.scm

build-srfi-60-racket-library:
	

test-srfi-60-racket-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:latest bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/60.scm"

build-srfi-60-racket-library-docker:
	

test-srfi-60-racket-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:latest bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/60.scm"

build-srfi-60-racket-library-docker-head:
	

test-srfi-60-sagittarius:
	
	sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/60.scm

build-srfi-60-sagittarius-library:
	

test-srfi-60-sagittarius-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:latest bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/60.scm"

build-srfi-60-sagittarius-library-docker:
	

test-srfi-60-sagittarius-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:latest bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/60.scm"

build-srfi-60-sagittarius-library-docker-head:
	

test-srfi-60-stklos:
	
	stklos -I . -I ./srfi -f srfi-test/r7rs-programs/60.scm

build-srfi-60-stklos-library:
	

test-srfi-60-stklos-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:latest bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/60.scm"

build-srfi-60-stklos-library-docker:
	

test-srfi-60-stklos-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:latest bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/60.scm"

build-srfi-60-stklos-library-docker-head:
	

test-srfi-60-skint:
	
	skint -I ./ srfi-test/r7rs-programs/60.scm

build-srfi-60-skint-library:
	

test-srfi-60-skint-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:latest bash -c "cd workdir && skint -I ./ srfi-test/r7rs-programs/60.scm"

build-srfi-60-skint-library-docker:
	

test-srfi-60-skint-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:latest bash -c "cd workdir && skint -I ./ srfi-test/r7rs-programs/60.scm"

build-srfi-60-skint-library-docker-head:
	

test-srfi-60-tr7:
	
	tr7i srfi-test/r7rs-programs/60.scm

build-srfi-60-tr7-library:
	

test-srfi-60-tr7-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:latest bash -c "cd workdir && tr7i srfi-test/r7rs-programs/60.scm"

build-srfi-60-tr7-library-docker:
	

test-srfi-60-tr7-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:latest bash -c "cd workdir && tr7i srfi-test/r7rs-programs/60.scm"

build-srfi-60-tr7-library-docker-head:
	

test-srfi-60-ypsilon:
	
	ypsilon --r7rs --loadpath=. --loadpath=./srfi srfi-test/r7rs-programs/60.scm

build-srfi-60-ypsilon-library:
	

test-srfi-60-ypsilon-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/ypsilon:latest bash -c "cd workdir && ypsilon --r7rs --loadpath=. --loadpath=./srfi srfi-test/r7rs-programs/60.scm"

build-srfi-60-ypsilon-library-docker:
	

test-srfi-60-ypsilon-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/ypsilon:latest bash -c "cd workdir && ypsilon --r7rs --loadpath=. --loadpath=./srfi srfi-test/r7rs-programs/60.scm"

build-srfi-60-ypsilon-library-docker-head:
	

test-srfi-64-chibi:
	
	chibi-scheme -I . srfi-test/r7rs-programs/64.scm

build-srfi-64-chibi-library:
	

test-srfi-64-chibi-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:latest bash -c "cd workdir && chibi-scheme -I . srfi-test/r7rs-programs/64.scm"

build-srfi-64-chibi-library-docker:
	

test-srfi-64-chibi-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:latest bash -c "cd workdir && chibi-scheme -I . srfi-test/r7rs-programs/64.scm"

build-srfi-64-chibi-library-docker-head:
	

test-srfi-64-chicken-compiler:
	 csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi/64.sld 
	csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/64.scm && srfi-test/r7rs-programs/64 && rm srfi-test/r7rs-programs/64

build-srfi-64-chicken-compiler-library:
	 csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi/64.sld 

test-srfi-64-chicken-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken-compiler:latest bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi/64.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/64.scm && srfi-test/r7rs-programs/64 && rm srfi-test/r7rs-programs/64"

build-srfi-64-chicken-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken-compiler:latest bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi/64.sld" 

test-srfi-64-chicken-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken-compiler:head bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi/64.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/64.scm && srfi-test/r7rs-programs/64 && rm srfi-test/r7rs-programs/64"

build-srfi-64-chicken-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken-compiler:head bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi/64.sld" 

test-srfi-64-chicken-interpreter:
	
	csi srfi-test/r7rs-programs/64.scm

build-srfi-64-chicken-interpreter-library:
	

test-srfi-64-chicken-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csi srfi-test/r7rs-programs/64.scm"

build-srfi-64-chicken-interpreter-library-docker:
	

test-srfi-64-chicken-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csi srfi-test/r7rs-programs/64.scm"

build-srfi-64-chicken-interpreter-library-docker-head:
	

test-srfi-64-cyclone-compiler:
	 cyclone -I . srfi/64.sld 
	cyclone -I . srfi-test/r7rs-programs/64.scm && srfi-test/r7rs-programs/64 && rm srfi-test/r7rs-programs/64

build-srfi-64-cyclone-compiler-library:
	 cyclone -I . srfi/64.sld 

test-srfi-64-cyclone-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone-compiler:latest bash -c "cd workdir && cyclone -I . srfi/64.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi-test/r7rs-programs/64.scm && srfi-test/r7rs-programs/64 && rm srfi-test/r7rs-programs/64"

build-srfi-64-cyclone-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone-compiler:latest bash -c "cd workdir && cyclone -I . srfi/64.sld" 

test-srfi-64-cyclone-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone-compiler:head bash -c "cd workdir && cyclone -I . srfi/64.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi-test/r7rs-programs/64.scm && srfi-test/r7rs-programs/64 && rm srfi-test/r7rs-programs/64"

build-srfi-64-cyclone-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone-compiler:head bash -c "cd workdir && cyclone -I . srfi/64.sld" 

test-srfi-64-cyclone-interpreter:
	
	icyc -I . srfi-test/r7rs-programs/64.scm

build-srfi-64-cyclone-interpreter-library:
	

test-srfi-64-cyclone-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && icyc -I . srfi-test/r7rs-programs/64.scm"

build-srfi-64-cyclone-interpreter-library-docker:
	

test-srfi-64-cyclone-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && icyc -I . srfi-test/r7rs-programs/64.scm"

build-srfi-64-cyclone-interpreter-library-docker-head:
	

test-srfi-64-foment:
	
	foment -I . -I ./srfi srfi-test/r7rs-programs/64.scm

build-srfi-64-foment-library:
	

test-srfi-64-foment-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment:latest bash -c "cd workdir && foment -I . -I ./srfi srfi-test/r7rs-programs/64.scm"

build-srfi-64-foment-library-docker:
	

test-srfi-64-foment-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment:latest bash -c "cd workdir && foment -I . -I ./srfi srfi-test/r7rs-programs/64.scm"

build-srfi-64-foment-library-docker-head:
	

test-srfi-64-gambit-compiler:
	 gsc -:search=.,s -debug -warnings -obj srfi/64.sld 
	gsc -:search=.,s -debug -warnings -exe ./  -nopreload srfi-test/r7rs-programs/64.scm && srfi-test/r7rs-programs/64 && rm srfi-test/r7rs-programs/64

build-srfi-64-gambit-compiler-library:
	 gsc -:search=.,s -debug -warnings -obj srfi/64.sld 

test-srfi-64-gambit-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit-compiler:latest bash -c "cd workdir && gsc -:search=.,s -debug -warnings -obj srfi/64.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsc -:search=.,s -debug -warnings -exe ./  -nopreload srfi-test/r7rs-programs/64.scm && srfi-test/r7rs-programs/64 && rm srfi-test/r7rs-programs/64"

build-srfi-64-gambit-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit-compiler:latest bash -c "cd workdir && gsc -:search=.,s -debug -warnings -obj srfi/64.sld" 

test-srfi-64-gambit-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit-compiler:head bash -c "cd workdir && gsc -:search=.,s -debug -warnings -obj srfi/64.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsc -:search=.,s -debug -warnings -exe ./  -nopreload srfi-test/r7rs-programs/64.scm && srfi-test/r7rs-programs/64 && rm srfi-test/r7rs-programs/64"

build-srfi-64-gambit-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit-compiler:head bash -c "cd workdir && gsc -:search=.,s -debug -warnings -obj srfi/64.sld" 

test-srfi-64-gambit-interpreter:
	
	gsi -:s srfi-test/r7rs-programs/64.scm

build-srfi-64-gambit-interpreter-library:
	

test-srfi-64-gambit-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsi -:s srfi-test/r7rs-programs/64.scm"

build-srfi-64-gambit-interpreter-library-docker:
	

test-srfi-64-gambit-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsi -:s srfi-test/r7rs-programs/64.scm"

build-srfi-64-gambit-interpreter-library-docker-head:
	

test-srfi-64-gauche:
	
	gosh -r7 -I . srfi-test/r7rs-programs/64.scm

build-srfi-64-gauche-library:
	

test-srfi-64-gauche-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:latest bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/64.scm"

build-srfi-64-gauche-library-docker:
	

test-srfi-64-gauche-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:latest bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/64.scm"

build-srfi-64-gauche-library-docker-head:
	

test-srfi-64-gerbil-compiler:
	 gxc -O srfi/64.sld 
	gxc --lang r7rs srfi-test/r7rs-programs/64.scm && srfi-test/r7rs-programs/64 && rm srfi-test/r7rs-programs/64

build-srfi-64-gerbil-compiler-library:
	 gxc -O srfi/64.sld 

test-srfi-64-gerbil-compiler-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil-compiler:latest bash -c "cd workdir && gxc -O srfi/64.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc --lang r7rs srfi-test/r7rs-programs/64.scm && srfi-test/r7rs-programs/64 && rm srfi-test/r7rs-programs/64"

build-srfi-64-gerbil-compiler-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil-compiler:latest bash -c "cd workdir && gxc -O srfi/64.sld" 

test-srfi-64-gerbil-compiler-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil-compiler:head bash -c "cd workdir && gxc -O srfi/64.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxc --lang r7rs srfi-test/r7rs-programs/64.scm && srfi-test/r7rs-programs/64 && rm srfi-test/r7rs-programs/64"

build-srfi-64-gerbil-compiler-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil-compiler:head bash -c "cd workdir && gxc -O srfi/64.sld" 

test-srfi-64-gerbil-interpreter:
	
	gxi --lang r7rs srfi-test/r7rs-programs/64.scm

build-srfi-64-gerbil-interpreter-library:
	

test-srfi-64-gerbil-interpreter-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxi --lang r7rs srfi-test/r7rs-programs/64.scm"

build-srfi-64-gerbil-interpreter-library-docker:
	

test-srfi-64-gerbil-interpreter-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil bash -c "cd workdir && gxi --lang r7rs srfi-test/r7rs-programs/64.scm"

build-srfi-64-gerbil-interpreter-library-docker-head:
	

test-srfi-64-guile:
	
	guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/64.scm

build-srfi-64-guile-library:
	

test-srfi-64-guile-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:latest bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/64.scm"

build-srfi-64-guile-library-docker:
	

test-srfi-64-guile-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:latest bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/64.scm"

build-srfi-64-guile-library-docker-head:
	

test-srfi-64-kawa:
	
	kawa --r7rs -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/64.scm

build-srfi-64-kawa-library:
	

test-srfi-64-kawa-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:latest bash -c "cd workdir && kawa --r7rs -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/64.scm"

build-srfi-64-kawa-library-docker:
	

test-srfi-64-kawa-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:latest bash -c "cd workdir && kawa --r7rs -Dkawa.import.path=../../*.sld srfi-test/r7rs-programs/64.scm"

build-srfi-64-kawa-library-docker-head:
	

test-srfi-64-loko:
	 ls srfi/64.sld 
	loko -std=r7rs --compile srfi-test/r7rs-programs/64.scm && srfi-test/r7rs-programs/64 && rm srfi-test/r7rs-programs/64

build-srfi-64-loko-library:
	 ls srfi/64.sld 

test-srfi-64-loko-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && ls srfi/64.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/64.scm && srfi-test/r7rs-programs/64 && rm srfi-test/r7rs-programs/64"

build-srfi-64-loko-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && ls srfi/64.sld" 

test-srfi-64-loko-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:head bash -c "cd workdir && ls srfi/64.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/64.scm && srfi-test/r7rs-programs/64 && rm srfi-test/r7rs-programs/64"

build-srfi-64-loko-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:head bash -c "cd workdir && ls srfi/64.sld" 

test-srfi-64-mit-scheme:
	
	mit-scheme --batch-mode --load ./srfi/26.sld ./srfi/28.sld ./srfi/64.sld srfi-test/r7rs-programs/64.scm

build-srfi-64-mit-scheme-library:
	

test-srfi-64-mit-scheme-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --batch-mode --load ./srfi/26.sld ./srfi/28.sld ./srfi/64.sld srfi-test/r7rs-programs/64.scm"

build-srfi-64-mit-scheme-library-docker:
	

test-srfi-64-mit-scheme-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --batch-mode --load ./srfi/26.sld ./srfi/28.sld ./srfi/64.sld srfi-test/r7rs-programs/64.scm"

build-srfi-64-mit-scheme-library-docker-head:
	

test-srfi-64-mosh:
	
	mosh --loadpath=. srfi-test/r7rs-programs/64.scm

build-srfi-64-mosh-library:
	

test-srfi-64-mosh-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mosh:latest bash -c "cd workdir && mosh --loadpath=. srfi-test/r7rs-programs/64.scm"

build-srfi-64-mosh-library-docker:
	

test-srfi-64-mosh-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mosh:latest bash -c "cd workdir && mosh --loadpath=. srfi-test/r7rs-programs/64.scm"

build-srfi-64-mosh-library-docker-head:
	

test-srfi-64-racket:
	
	racket -I r7rs -S . --script srfi-test/r7rs-programs/64.scm

build-srfi-64-racket-library:
	

test-srfi-64-racket-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:latest bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/64.scm"

build-srfi-64-racket-library-docker:
	

test-srfi-64-racket-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:latest bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/64.scm"

build-srfi-64-racket-library-docker-head:
	

test-srfi-64-sagittarius:
	
	sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/64.scm

build-srfi-64-sagittarius-library:
	

test-srfi-64-sagittarius-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:latest bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/64.scm"

build-srfi-64-sagittarius-library-docker:
	

test-srfi-64-sagittarius-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:latest bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/64.scm"

build-srfi-64-sagittarius-library-docker-head:
	

test-srfi-64-stklos:
	
	stklos -I . -I ./srfi -f srfi-test/r7rs-programs/64.scm

build-srfi-64-stklos-library:
	

test-srfi-64-stklos-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:latest bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/64.scm"

build-srfi-64-stklos-library-docker:
	

test-srfi-64-stklos-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:latest bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/64.scm"

build-srfi-64-stklos-library-docker-head:
	

test-srfi-64-skint:
	
	skint -I ./ srfi-test/r7rs-programs/64.scm

build-srfi-64-skint-library:
	

test-srfi-64-skint-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:latest bash -c "cd workdir && skint -I ./ srfi-test/r7rs-programs/64.scm"

build-srfi-64-skint-library-docker:
	

test-srfi-64-skint-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:latest bash -c "cd workdir && skint -I ./ srfi-test/r7rs-programs/64.scm"

build-srfi-64-skint-library-docker-head:
	

test-srfi-64-tr7:
	
	tr7i srfi-test/r7rs-programs/64.scm

build-srfi-64-tr7-library:
	

test-srfi-64-tr7-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:latest bash -c "cd workdir && tr7i srfi-test/r7rs-programs/64.scm"

build-srfi-64-tr7-library-docker:
	

test-srfi-64-tr7-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:latest bash -c "cd workdir && tr7i srfi-test/r7rs-programs/64.scm"

build-srfi-64-tr7-library-docker-head:
	

test-srfi-64-ypsilon:
	
	ypsilon --r7rs --loadpath=. --loadpath=./srfi srfi-test/r7rs-programs/64.scm

build-srfi-64-ypsilon-library:
	

test-srfi-64-ypsilon-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/ypsilon:latest bash -c "cd workdir && ypsilon --r7rs --loadpath=. --loadpath=./srfi srfi-test/r7rs-programs/64.scm"

build-srfi-64-ypsilon-library-docker:
	

test-srfi-64-ypsilon-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/ypsilon:latest bash -c "cd workdir && ypsilon --r7rs --loadpath=. --loadpath=./srfi srfi-test/r7rs-programs/64.scm"

build-srfi-64-ypsilon-library-docker-head:
	


