test-srfi-8-chibi:
	
	chibi-scheme -I . srfi-test/r7rs-programs/8.scm

srfi-8-chibi-build-library:
	

test-srfi-8-chibi-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:latest bash -c "cd workdir && chibi-scheme -I . srfi-test/r7rs-programs/8.scm"

srfi-8-chibi-build-library-docker:
	

test-srfi-8-chibi-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:head bash -c "cd workdir && chibi-scheme -I . srfi-test/r7rs-programs/8.scm"

srfi-8-chibi-build-library-docker-head:
	

test-srfi-8-chicken:
	  cp srfi/8.sld srfi-8.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-8.sld 
	csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/8.scm && srfi-test/r7rs-programs/8 && rm srfi-test/r7rs-programs/8

srfi-8-chicken-build-library:
	  cp srfi/8.sld srfi-8.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-8.sld 

test-srfi-8-chicken-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:latest bash -c "cd workdir &&  cp srfi/8.sld srfi-8.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-8.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:latest bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/8.scm && srfi-test/r7rs-programs/8 && rm srfi-test/r7rs-programs/8"

srfi-8-chicken-build-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:latest bash -c "cd workdir &&  cp srfi/8.sld srfi-8.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-8.sld" 

test-srfi-8-chicken-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:head bash -c "cd workdir &&  cp srfi/8.sld srfi-8.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-8.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:head bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/8.scm && srfi-test/r7rs-programs/8 && rm srfi-test/r7rs-programs/8"

srfi-8-chicken-build-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:head bash -c "cd workdir &&  cp srfi/8.sld srfi-8.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-8.sld" 

test-srfi-8-cyclone:
	 cyclone -I . srfi/8.sld 
	cyclone -I . srfi-test/r7rs-programs/8.scm && srfi-test/r7rs-programs/8 && rm srfi-test/r7rs-programs/8

srfi-8-cyclone-build-library:
	 cyclone -I . srfi/8.sld 

test-srfi-8-cyclone-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:latest bash -c "cd workdir && cyclone -I . srfi/8.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:latest bash -c "cd workdir && cyclone -I . srfi-test/r7rs-programs/8.scm && srfi-test/r7rs-programs/8 && rm srfi-test/r7rs-programs/8"

srfi-8-cyclone-build-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:latest bash -c "cd workdir && cyclone -I . srfi/8.sld" 

test-srfi-8-cyclone-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:head bash -c "cd workdir && cyclone -I . srfi/8.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:head bash -c "cd workdir && cyclone -I . srfi-test/r7rs-programs/8.scm && srfi-test/r7rs-programs/8 && rm srfi-test/r7rs-programs/8"

srfi-8-cyclone-build-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:head bash -c "cd workdir && cyclone -I . srfi/8.sld" 

test-srfi-8-foment:
	
	foment -I . -I ./srfi srfi-test/r7rs-programs/8.scm

srfi-8-foment-build-library:
	

test-srfi-8-foment-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment:latest bash -c "cd workdir && foment -I . -I ./srfi srfi-test/r7rs-programs/8.scm"

srfi-8-foment-build-library-docker:
	

test-srfi-8-foment-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment:head bash -c "cd workdir && foment -I . -I ./srfi srfi-test/r7rs-programs/8.scm"

srfi-8-foment-build-library-docker-head:
	

test-srfi-8-gambit:
	 gsc -:search=. srfi/8 
	gsc -exe ./ -nopreload srfi-test/r7rs-programs/8.scm && srfi-test/r7rs-programs/8 -:search=. && rm srfi-test/r7rs-programs/8

srfi-8-gambit-build-library:
	 gsc -:search=. srfi/8 

test-srfi-8-gambit-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:latest bash -c "cd workdir && gsc -:search=. srfi/8"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:latest bash -c "cd workdir && gsc -exe ./ -nopreload srfi-test/r7rs-programs/8.scm && srfi-test/r7rs-programs/8 -:search=. && rm srfi-test/r7rs-programs/8"

srfi-8-gambit-build-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:latest bash -c "cd workdir && gsc -:search=. srfi/8" 

test-srfi-8-gambit-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:head bash -c "cd workdir && gsc -:search=. srfi/8"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:head bash -c "cd workdir && gsc -exe ./ -nopreload srfi-test/r7rs-programs/8.scm && srfi-test/r7rs-programs/8 -:search=. && rm srfi-test/r7rs-programs/8"

srfi-8-gambit-build-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:head bash -c "cd workdir && gsc -:search=. srfi/8" 

test-srfi-8-gauche:
	
	gosh -r7 -I . srfi-test/r7rs-programs/8.scm

srfi-8-gauche-build-library:
	

test-srfi-8-gauche-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:latest bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/8.scm"

srfi-8-gauche-build-library-docker:
	

test-srfi-8-gauche-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:head bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/8.scm"

srfi-8-gauche-build-library-docker-head:
	

test-srfi-8-gerbil:
	 gxc -O srfi/8.sld 
	gxi --lang r7rs srfi-test/r7rs-programs/8.scm && srfi-test/r7rs-programs/8 && rm srfi-test/r7rs-programs/8

srfi-8-gerbil-build-library:
	 gxc -O srfi/8.sld 

test-srfi-8-gerbil-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil:latest bash -c "cd workdir && gxc -O srfi/8.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil:latest bash -c "cd workdir && gxi --lang r7rs srfi-test/r7rs-programs/8.scm && srfi-test/r7rs-programs/8 && rm srfi-test/r7rs-programs/8"

srfi-8-gerbil-build-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil:latest bash -c "cd workdir && gxc -O srfi/8.sld" 

test-srfi-8-gerbil-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil:head bash -c "cd workdir && gxc -O srfi/8.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil:head bash -c "cd workdir && gxi --lang r7rs srfi-test/r7rs-programs/8.scm && srfi-test/r7rs-programs/8 && rm srfi-test/r7rs-programs/8"

srfi-8-gerbil-build-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil:head bash -c "cd workdir && gxc -O srfi/8.sld" 

test-srfi-8-guile:
	
	guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/8.scm

srfi-8-guile-build-library:
	

test-srfi-8-guile-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:latest bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/8.scm"

srfi-8-guile-build-library-docker:
	

test-srfi-8-guile-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:head bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/8.scm"

srfi-8-guile-build-library-docker-head:
	

test-srfi-8-kawa:
	
	kawa --r7rs -Dkawa.import.path=../.. srfi-test/r7rs-programs/8.scm

srfi-8-kawa-build-library:
	

test-srfi-8-kawa-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:latest bash -c "cd workdir && kawa --r7rs -Dkawa.import.path=../.. srfi-test/r7rs-programs/8.scm"

srfi-8-kawa-build-library-docker:
	

test-srfi-8-kawa-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:head bash -c "cd workdir && kawa --r7rs -Dkawa.import.path=../.. srfi-test/r7rs-programs/8.scm"

srfi-8-kawa-build-library-docker-head:
	

test-srfi-8-larceny:
	
	larceny -r7 -I . srfi-test/r7rs-programs/8.scm

srfi-8-larceny-build-library:
	

test-srfi-8-larceny-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/larceny:latest bash -c "cd workdir && larceny -r7 -I . srfi-test/r7rs-programs/8.scm"

srfi-8-larceny-build-library-docker:
	

test-srfi-8-larceny-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/larceny:head bash -c "cd workdir && larceny -r7 -I . srfi-test/r7rs-programs/8.scm"

srfi-8-larceny-build-library-docker-head:
	

test-srfi-8-loko:
	 ls srfi/8.sld 
	loko -std=r7rs --compile srfi-test/r7rs-programs/8.scm && srfi-test/r7rs-programs/8 && rm srfi-test/r7rs-programs/8

srfi-8-loko-build-library:
	 ls srfi/8.sld 

test-srfi-8-loko-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && ls srfi/8.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/8.scm && srfi-test/r7rs-programs/8 && rm srfi-test/r7rs-programs/8"

srfi-8-loko-build-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && ls srfi/8.sld" 

test-srfi-8-loko-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:head bash -c "cd workdir && ls srfi/8.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko:head bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/8.scm && srfi-test/r7rs-programs/8 && rm srfi-test/r7rs-programs/8"

srfi-8-loko-build-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:head bash -c "cd workdir && ls srfi/8.sld" 

test-srfi-8-mit-scheme:
	
	mit-scheme --batch-mode --load ./srfi/26.sld ./srfi/28.sld ./srfi/64.sld srfi-test/r7rs-programs/8.scm

srfi-8-mit-scheme-build-library:
	

test-srfi-8-mit-scheme-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --batch-mode --load ./srfi/26.sld ./srfi/28.sld ./srfi/64.sld srfi-test/r7rs-programs/8.scm"

srfi-8-mit-scheme-build-library-docker:
	

test-srfi-8-mit-scheme-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:head bash -c "cd workdir && mit-scheme --batch-mode --load ./srfi/26.sld ./srfi/28.sld ./srfi/64.sld srfi-test/r7rs-programs/8.scm"

srfi-8-mit-scheme-build-library-docker-head:
	

test-srfi-8-mosh:
	
	mosh --loadpath=. srfi-test/r7rs-programs/8.scm

srfi-8-mosh-build-library:
	

test-srfi-8-mosh-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mosh:latest bash -c "cd workdir && mosh --loadpath=. srfi-test/r7rs-programs/8.scm"

srfi-8-mosh-build-library-docker:
	

test-srfi-8-mosh-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mosh:head bash -c "cd workdir && mosh --loadpath=. srfi-test/r7rs-programs/8.scm"

srfi-8-mosh-build-library-docker-head:
	

test-srfi-8-racket:
	
	racket -I r7rs -S . --script srfi-test/r7rs-programs/8.scm

srfi-8-racket-build-library:
	

test-srfi-8-racket-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:latest bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/8.scm"

srfi-8-racket-build-library-docker:
	

test-srfi-8-racket-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:head bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/8.scm"

srfi-8-racket-build-library-docker-head:
	

test-srfi-8-sagittarius:
	
	sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/8.scm

srfi-8-sagittarius-build-library:
	

test-srfi-8-sagittarius-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:latest bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/8.scm"

srfi-8-sagittarius-build-library-docker:
	

test-srfi-8-sagittarius-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:head bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/8.scm"

srfi-8-sagittarius-build-library-docker-head:
	

test-srfi-8-stklos:
	
	stklos -I . -I ./srfi -f srfi-test/r7rs-programs/8.scm

srfi-8-stklos-build-library:
	

test-srfi-8-stklos-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:latest bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/8.scm"

srfi-8-stklos-build-library-docker:
	

test-srfi-8-stklos-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:head bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/8.scm"

srfi-8-stklos-build-library-docker-head:
	

test-srfi-8-skint:
	
	skint -I ./ srfi-test/r7rs-programs/8.scm

srfi-8-skint-build-library:
	

test-srfi-8-skint-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:latest bash -c "cd workdir && skint -I ./ srfi-test/r7rs-programs/8.scm"

srfi-8-skint-build-library-docker:
	

test-srfi-8-skint-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:head bash -c "cd workdir && skint -I ./ srfi-test/r7rs-programs/8.scm"

srfi-8-skint-build-library-docker-head:
	

test-srfi-8-tr7:
	
	tr7i srfi-test/r7rs-programs/8.scm

srfi-8-tr7-build-library:
	

test-srfi-8-tr7-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:latest bash -c "cd workdir && tr7i srfi-test/r7rs-programs/8.scm"

srfi-8-tr7-build-library-docker:
	

test-srfi-8-tr7-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:head bash -c "cd workdir && tr7i srfi-test/r7rs-programs/8.scm"

srfi-8-tr7-build-library-docker-head:
	

test-srfi-8-ypsilon:
	
	ypsilon --warning --verbose --clean-acc --acc=/tmp --r7rs --loadpath=. srfi-test/r7rs-programs/8.scm

srfi-8-ypsilon-build-library:
	

test-srfi-8-ypsilon-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/ypsilon:latest bash -c "cd workdir && ypsilon --warning --verbose --clean-acc --acc=/tmp --r7rs --loadpath=. srfi-test/r7rs-programs/8.scm"

srfi-8-ypsilon-build-library-docker:
	

test-srfi-8-ypsilon-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/ypsilon:head bash -c "cd workdir && ypsilon --warning --verbose --clean-acc --acc=/tmp --r7rs --loadpath=. srfi-test/r7rs-programs/8.scm"

srfi-8-ypsilon-build-library-docker-head:
	

test-srfi-1-chibi:
	
	chibi-scheme -I . srfi-test/r7rs-programs/1.scm

srfi-1-chibi-build-library:
	

test-srfi-1-chibi-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:latest bash -c "cd workdir && chibi-scheme -I . srfi-test/r7rs-programs/1.scm"

srfi-1-chibi-build-library-docker:
	

test-srfi-1-chibi-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:head bash -c "cd workdir && chibi-scheme -I . srfi-test/r7rs-programs/1.scm"

srfi-1-chibi-build-library-docker-head:
	

test-srfi-1-chicken:
	  cp srfi/1.sld srfi-1.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-1.sld 
	csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/1.scm && srfi-test/r7rs-programs/1 && rm srfi-test/r7rs-programs/1

srfi-1-chicken-build-library:
	  cp srfi/1.sld srfi-1.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-1.sld 

test-srfi-1-chicken-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:latest bash -c "cd workdir &&  cp srfi/1.sld srfi-1.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-1.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:latest bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/1.scm && srfi-test/r7rs-programs/1 && rm srfi-test/r7rs-programs/1"

srfi-1-chicken-build-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:latest bash -c "cd workdir &&  cp srfi/1.sld srfi-1.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-1.sld" 

test-srfi-1-chicken-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:head bash -c "cd workdir &&  cp srfi/1.sld srfi-1.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-1.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:head bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/1.scm && srfi-test/r7rs-programs/1 && rm srfi-test/r7rs-programs/1"

srfi-1-chicken-build-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:head bash -c "cd workdir &&  cp srfi/1.sld srfi-1.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-1.sld" 

test-srfi-1-cyclone:
	 cyclone -I . srfi/1.sld 
	cyclone -I . srfi-test/r7rs-programs/1.scm && srfi-test/r7rs-programs/1 && rm srfi-test/r7rs-programs/1

srfi-1-cyclone-build-library:
	 cyclone -I . srfi/1.sld 

test-srfi-1-cyclone-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:latest bash -c "cd workdir && cyclone -I . srfi/1.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:latest bash -c "cd workdir && cyclone -I . srfi-test/r7rs-programs/1.scm && srfi-test/r7rs-programs/1 && rm srfi-test/r7rs-programs/1"

srfi-1-cyclone-build-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:latest bash -c "cd workdir && cyclone -I . srfi/1.sld" 

test-srfi-1-cyclone-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:head bash -c "cd workdir && cyclone -I . srfi/1.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:head bash -c "cd workdir && cyclone -I . srfi-test/r7rs-programs/1.scm && srfi-test/r7rs-programs/1 && rm srfi-test/r7rs-programs/1"

srfi-1-cyclone-build-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:head bash -c "cd workdir && cyclone -I . srfi/1.sld" 

test-srfi-1-foment:
	
	foment -I . -I ./srfi srfi-test/r7rs-programs/1.scm

srfi-1-foment-build-library:
	

test-srfi-1-foment-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment:latest bash -c "cd workdir && foment -I . -I ./srfi srfi-test/r7rs-programs/1.scm"

srfi-1-foment-build-library-docker:
	

test-srfi-1-foment-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment:head bash -c "cd workdir && foment -I . -I ./srfi srfi-test/r7rs-programs/1.scm"

srfi-1-foment-build-library-docker-head:
	

test-srfi-1-gambit:
	 gsc -:search=. srfi/1 
	gsc -exe ./ -nopreload srfi-test/r7rs-programs/1.scm && srfi-test/r7rs-programs/1 -:search=. && rm srfi-test/r7rs-programs/1

srfi-1-gambit-build-library:
	 gsc -:search=. srfi/1 

test-srfi-1-gambit-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:latest bash -c "cd workdir && gsc -:search=. srfi/1"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:latest bash -c "cd workdir && gsc -exe ./ -nopreload srfi-test/r7rs-programs/1.scm && srfi-test/r7rs-programs/1 -:search=. && rm srfi-test/r7rs-programs/1"

srfi-1-gambit-build-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:latest bash -c "cd workdir && gsc -:search=. srfi/1" 

test-srfi-1-gambit-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:head bash -c "cd workdir && gsc -:search=. srfi/1"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:head bash -c "cd workdir && gsc -exe ./ -nopreload srfi-test/r7rs-programs/1.scm && srfi-test/r7rs-programs/1 -:search=. && rm srfi-test/r7rs-programs/1"

srfi-1-gambit-build-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:head bash -c "cd workdir && gsc -:search=. srfi/1" 

test-srfi-1-gauche:
	
	gosh -r7 -I . srfi-test/r7rs-programs/1.scm

srfi-1-gauche-build-library:
	

test-srfi-1-gauche-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:latest bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/1.scm"

srfi-1-gauche-build-library-docker:
	

test-srfi-1-gauche-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:head bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/1.scm"

srfi-1-gauche-build-library-docker-head:
	

test-srfi-1-gerbil:
	 gxc -O srfi/1.sld 
	gxi --lang r7rs srfi-test/r7rs-programs/1.scm && srfi-test/r7rs-programs/1 && rm srfi-test/r7rs-programs/1

srfi-1-gerbil-build-library:
	 gxc -O srfi/1.sld 

test-srfi-1-gerbil-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil:latest bash -c "cd workdir && gxc -O srfi/1.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil:latest bash -c "cd workdir && gxi --lang r7rs srfi-test/r7rs-programs/1.scm && srfi-test/r7rs-programs/1 && rm srfi-test/r7rs-programs/1"

srfi-1-gerbil-build-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil:latest bash -c "cd workdir && gxc -O srfi/1.sld" 

test-srfi-1-gerbil-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil:head bash -c "cd workdir && gxc -O srfi/1.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil:head bash -c "cd workdir && gxi --lang r7rs srfi-test/r7rs-programs/1.scm && srfi-test/r7rs-programs/1 && rm srfi-test/r7rs-programs/1"

srfi-1-gerbil-build-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil:head bash -c "cd workdir && gxc -O srfi/1.sld" 

test-srfi-1-guile:
	
	guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/1.scm

srfi-1-guile-build-library:
	

test-srfi-1-guile-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:latest bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/1.scm"

srfi-1-guile-build-library-docker:
	

test-srfi-1-guile-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:head bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/1.scm"

srfi-1-guile-build-library-docker-head:
	

test-srfi-1-kawa:
	
	kawa --r7rs -Dkawa.import.path=../.. srfi-test/r7rs-programs/1.scm

srfi-1-kawa-build-library:
	

test-srfi-1-kawa-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:latest bash -c "cd workdir && kawa --r7rs -Dkawa.import.path=../.. srfi-test/r7rs-programs/1.scm"

srfi-1-kawa-build-library-docker:
	

test-srfi-1-kawa-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:head bash -c "cd workdir && kawa --r7rs -Dkawa.import.path=../.. srfi-test/r7rs-programs/1.scm"

srfi-1-kawa-build-library-docker-head:
	

test-srfi-1-larceny:
	
	larceny -r7 -I . srfi-test/r7rs-programs/1.scm

srfi-1-larceny-build-library:
	

test-srfi-1-larceny-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/larceny:latest bash -c "cd workdir && larceny -r7 -I . srfi-test/r7rs-programs/1.scm"

srfi-1-larceny-build-library-docker:
	

test-srfi-1-larceny-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/larceny:head bash -c "cd workdir && larceny -r7 -I . srfi-test/r7rs-programs/1.scm"

srfi-1-larceny-build-library-docker-head:
	

test-srfi-1-loko:
	 ls srfi/1.sld 
	loko -std=r7rs --compile srfi-test/r7rs-programs/1.scm && srfi-test/r7rs-programs/1 && rm srfi-test/r7rs-programs/1

srfi-1-loko-build-library:
	 ls srfi/1.sld 

test-srfi-1-loko-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && ls srfi/1.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/1.scm && srfi-test/r7rs-programs/1 && rm srfi-test/r7rs-programs/1"

srfi-1-loko-build-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && ls srfi/1.sld" 

test-srfi-1-loko-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:head bash -c "cd workdir && ls srfi/1.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko:head bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/1.scm && srfi-test/r7rs-programs/1 && rm srfi-test/r7rs-programs/1"

srfi-1-loko-build-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:head bash -c "cd workdir && ls srfi/1.sld" 

test-srfi-1-mit-scheme:
	
	mit-scheme --batch-mode --load ./srfi/26.sld ./srfi/28.sld ./srfi/64.sld srfi-test/r7rs-programs/1.scm

srfi-1-mit-scheme-build-library:
	

test-srfi-1-mit-scheme-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --batch-mode --load ./srfi/26.sld ./srfi/28.sld ./srfi/64.sld srfi-test/r7rs-programs/1.scm"

srfi-1-mit-scheme-build-library-docker:
	

test-srfi-1-mit-scheme-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:head bash -c "cd workdir && mit-scheme --batch-mode --load ./srfi/26.sld ./srfi/28.sld ./srfi/64.sld srfi-test/r7rs-programs/1.scm"

srfi-1-mit-scheme-build-library-docker-head:
	

test-srfi-1-mosh:
	
	mosh --loadpath=. srfi-test/r7rs-programs/1.scm

srfi-1-mosh-build-library:
	

test-srfi-1-mosh-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mosh:latest bash -c "cd workdir && mosh --loadpath=. srfi-test/r7rs-programs/1.scm"

srfi-1-mosh-build-library-docker:
	

test-srfi-1-mosh-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mosh:head bash -c "cd workdir && mosh --loadpath=. srfi-test/r7rs-programs/1.scm"

srfi-1-mosh-build-library-docker-head:
	

test-srfi-1-racket:
	
	racket -I r7rs -S . --script srfi-test/r7rs-programs/1.scm

srfi-1-racket-build-library:
	

test-srfi-1-racket-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:latest bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/1.scm"

srfi-1-racket-build-library-docker:
	

test-srfi-1-racket-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:head bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/1.scm"

srfi-1-racket-build-library-docker-head:
	

test-srfi-1-sagittarius:
	
	sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/1.scm

srfi-1-sagittarius-build-library:
	

test-srfi-1-sagittarius-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:latest bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/1.scm"

srfi-1-sagittarius-build-library-docker:
	

test-srfi-1-sagittarius-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:head bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/1.scm"

srfi-1-sagittarius-build-library-docker-head:
	

test-srfi-1-stklos:
	
	stklos -I . -I ./srfi -f srfi-test/r7rs-programs/1.scm

srfi-1-stklos-build-library:
	

test-srfi-1-stklos-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:latest bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/1.scm"

srfi-1-stklos-build-library-docker:
	

test-srfi-1-stklos-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:head bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/1.scm"

srfi-1-stklos-build-library-docker-head:
	

test-srfi-1-skint:
	
	skint -I ./ srfi-test/r7rs-programs/1.scm

srfi-1-skint-build-library:
	

test-srfi-1-skint-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:latest bash -c "cd workdir && skint -I ./ srfi-test/r7rs-programs/1.scm"

srfi-1-skint-build-library-docker:
	

test-srfi-1-skint-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:head bash -c "cd workdir && skint -I ./ srfi-test/r7rs-programs/1.scm"

srfi-1-skint-build-library-docker-head:
	

test-srfi-1-tr7:
	
	tr7i srfi-test/r7rs-programs/1.scm

srfi-1-tr7-build-library:
	

test-srfi-1-tr7-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:latest bash -c "cd workdir && tr7i srfi-test/r7rs-programs/1.scm"

srfi-1-tr7-build-library-docker:
	

test-srfi-1-tr7-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:head bash -c "cd workdir && tr7i srfi-test/r7rs-programs/1.scm"

srfi-1-tr7-build-library-docker-head:
	

test-srfi-1-ypsilon:
	
	ypsilon --warning --verbose --clean-acc --acc=/tmp --r7rs --loadpath=. srfi-test/r7rs-programs/1.scm

srfi-1-ypsilon-build-library:
	

test-srfi-1-ypsilon-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/ypsilon:latest bash -c "cd workdir && ypsilon --warning --verbose --clean-acc --acc=/tmp --r7rs --loadpath=. srfi-test/r7rs-programs/1.scm"

srfi-1-ypsilon-build-library-docker:
	

test-srfi-1-ypsilon-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/ypsilon:head bash -c "cd workdir && ypsilon --warning --verbose --clean-acc --acc=/tmp --r7rs --loadpath=. srfi-test/r7rs-programs/1.scm"

srfi-1-ypsilon-build-library-docker-head:
	

test-srfi-14-chibi:
	
	chibi-scheme -I . srfi-test/r7rs-programs/14.scm

srfi-14-chibi-build-library:
	

test-srfi-14-chibi-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:latest bash -c "cd workdir && chibi-scheme -I . srfi-test/r7rs-programs/14.scm"

srfi-14-chibi-build-library-docker:
	

test-srfi-14-chibi-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:head bash -c "cd workdir && chibi-scheme -I . srfi-test/r7rs-programs/14.scm"

srfi-14-chibi-build-library-docker-head:
	

test-srfi-14-chicken:
	  cp srfi/14.sld srfi-14.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-14.sld 
	csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/14.scm && srfi-test/r7rs-programs/14 && rm srfi-test/r7rs-programs/14

srfi-14-chicken-build-library:
	  cp srfi/14.sld srfi-14.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-14.sld 

test-srfi-14-chicken-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:latest bash -c "cd workdir &&  cp srfi/14.sld srfi-14.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-14.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:latest bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/14.scm && srfi-test/r7rs-programs/14 && rm srfi-test/r7rs-programs/14"

srfi-14-chicken-build-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:latest bash -c "cd workdir &&  cp srfi/14.sld srfi-14.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-14.sld" 

test-srfi-14-chicken-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:head bash -c "cd workdir &&  cp srfi/14.sld srfi-14.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-14.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:head bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/14.scm && srfi-test/r7rs-programs/14 && rm srfi-test/r7rs-programs/14"

srfi-14-chicken-build-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:head bash -c "cd workdir &&  cp srfi/14.sld srfi-14.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-14.sld" 

test-srfi-14-cyclone:
	 cyclone -I . srfi/14.sld 
	cyclone -I . srfi-test/r7rs-programs/14.scm && srfi-test/r7rs-programs/14 && rm srfi-test/r7rs-programs/14

srfi-14-cyclone-build-library:
	 cyclone -I . srfi/14.sld 

test-srfi-14-cyclone-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:latest bash -c "cd workdir && cyclone -I . srfi/14.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:latest bash -c "cd workdir && cyclone -I . srfi-test/r7rs-programs/14.scm && srfi-test/r7rs-programs/14 && rm srfi-test/r7rs-programs/14"

srfi-14-cyclone-build-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:latest bash -c "cd workdir && cyclone -I . srfi/14.sld" 

test-srfi-14-cyclone-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:head bash -c "cd workdir && cyclone -I . srfi/14.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:head bash -c "cd workdir && cyclone -I . srfi-test/r7rs-programs/14.scm && srfi-test/r7rs-programs/14 && rm srfi-test/r7rs-programs/14"

srfi-14-cyclone-build-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:head bash -c "cd workdir && cyclone -I . srfi/14.sld" 

test-srfi-14-foment:
	
	foment -I --load srfi-test/r7rs-programs/14.scm

srfi-14-foment-build-library:
	

test-srfi-14-foment-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment:latest bash -c "cd workdir && foment -I --load srfi-test/r7rs-programs/14.scm"

srfi-14-foment-build-library-docker:
	

test-srfi-14-foment-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment:head bash -c "cd workdir && foment -I --load srfi-test/r7rs-programs/14.scm"

srfi-14-foment-build-library-docker-head:
	

test-srfi-14-gambit:
	 gsc -:search=. srfi/14 
	gsc -exe ./ -nopreload srfi-test/r7rs-programs/14.scm && srfi-test/r7rs-programs/14 -:search=. && rm srfi-test/r7rs-programs/14

srfi-14-gambit-build-library:
	 gsc -:search=. srfi/14 

test-srfi-14-gambit-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:latest bash -c "cd workdir && gsc -:search=. srfi/14"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:latest bash -c "cd workdir && gsc -exe ./ -nopreload srfi-test/r7rs-programs/14.scm && srfi-test/r7rs-programs/14 -:search=. && rm srfi-test/r7rs-programs/14"

srfi-14-gambit-build-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:latest bash -c "cd workdir && gsc -:search=. srfi/14" 

test-srfi-14-gambit-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:head bash -c "cd workdir && gsc -:search=. srfi/14"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:head bash -c "cd workdir && gsc -exe ./ -nopreload srfi-test/r7rs-programs/14.scm && srfi-test/r7rs-programs/14 -:search=. && rm srfi-test/r7rs-programs/14"

srfi-14-gambit-build-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:head bash -c "cd workdir && gsc -:search=. srfi/14" 

test-srfi-14-gauche:
	
	gosh -r7 -I . srfi-test/r7rs-programs/14.scm

srfi-14-gauche-build-library:
	

test-srfi-14-gauche-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:latest bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/14.scm"

srfi-14-gauche-build-library-docker:
	

test-srfi-14-gauche-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:head bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/14.scm"

srfi-14-gauche-build-library-docker-head:
	

test-srfi-14-gerbil:
	 gxc -O srfi/14.sld 
	gxi --lang r7rs srfi-test/r7rs-programs/14.scm && srfi-test/r7rs-programs/14 && rm srfi-test/r7rs-programs/14

srfi-14-gerbil-build-library:
	 gxc -O srfi/14.sld 

test-srfi-14-gerbil-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil:latest bash -c "cd workdir && gxc -O srfi/14.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil:latest bash -c "cd workdir && gxi --lang r7rs srfi-test/r7rs-programs/14.scm && srfi-test/r7rs-programs/14 && rm srfi-test/r7rs-programs/14"

srfi-14-gerbil-build-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil:latest bash -c "cd workdir && gxc -O srfi/14.sld" 

test-srfi-14-gerbil-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil:head bash -c "cd workdir && gxc -O srfi/14.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil:head bash -c "cd workdir && gxi --lang r7rs srfi-test/r7rs-programs/14.scm && srfi-test/r7rs-programs/14 && rm srfi-test/r7rs-programs/14"

srfi-14-gerbil-build-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil:head bash -c "cd workdir && gxc -O srfi/14.sld" 

test-srfi-14-guile:
	
	guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/14.scm

srfi-14-guile-build-library:
	

test-srfi-14-guile-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:latest bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/14.scm"

srfi-14-guile-build-library-docker:
	

test-srfi-14-guile-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:head bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/14.scm"

srfi-14-guile-build-library-docker-head:
	

test-srfi-14-kawa:
	
	kawa --r7rs -Dkawa.import.path=../.. srfi-test/r7rs-programs/14.scm

srfi-14-kawa-build-library:
	

test-srfi-14-kawa-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:latest bash -c "cd workdir && kawa --r7rs -Dkawa.import.path=../.. srfi-test/r7rs-programs/14.scm"

srfi-14-kawa-build-library-docker:
	

test-srfi-14-kawa-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:head bash -c "cd workdir && kawa --r7rs -Dkawa.import.path=../.. srfi-test/r7rs-programs/14.scm"

srfi-14-kawa-build-library-docker-head:
	

test-srfi-14-larceny:
	
	larceny -r7 -I . srfi-test/r7rs-programs/14.scm

srfi-14-larceny-build-library:
	

test-srfi-14-larceny-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/larceny:latest bash -c "cd workdir && larceny -r7 -I . srfi-test/r7rs-programs/14.scm"

srfi-14-larceny-build-library-docker:
	

test-srfi-14-larceny-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/larceny:head bash -c "cd workdir && larceny -r7 -I . srfi-test/r7rs-programs/14.scm"

srfi-14-larceny-build-library-docker-head:
	

test-srfi-14-loko:
	 ls srfi/14.sld 
	loko -std=r7rs --compile srfi-test/r7rs-programs/14.scm && srfi-test/r7rs-programs/14 && rm srfi-test/r7rs-programs/14

srfi-14-loko-build-library:
	 ls srfi/14.sld 

test-srfi-14-loko-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && ls srfi/14.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/14.scm && srfi-test/r7rs-programs/14 && rm srfi-test/r7rs-programs/14"

srfi-14-loko-build-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && ls srfi/14.sld" 

test-srfi-14-loko-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:head bash -c "cd workdir && ls srfi/14.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko:head bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/14.scm && srfi-test/r7rs-programs/14 && rm srfi-test/r7rs-programs/14"

srfi-14-loko-build-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:head bash -c "cd workdir && ls srfi/14.sld" 

test-srfi-14-mit-scheme:
	
	mit-scheme --load srfi-test/r7rs-programs/14.scm

srfi-14-mit-scheme-build-library:
	

test-srfi-14-mit-scheme-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --load srfi-test/r7rs-programs/14.scm"

srfi-14-mit-scheme-build-library-docker:
	

test-srfi-14-mit-scheme-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:head bash -c "cd workdir && mit-scheme --load srfi-test/r7rs-programs/14.scm"

srfi-14-mit-scheme-build-library-docker-head:
	

test-srfi-14-mosh:
	
	mosh --loadpath=. srfi-test/r7rs-programs/14.scm

srfi-14-mosh-build-library:
	

test-srfi-14-mosh-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mosh:latest bash -c "cd workdir && mosh --loadpath=. srfi-test/r7rs-programs/14.scm"

srfi-14-mosh-build-library-docker:
	

test-srfi-14-mosh-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mosh:head bash -c "cd workdir && mosh --loadpath=. srfi-test/r7rs-programs/14.scm"

srfi-14-mosh-build-library-docker-head:
	

test-srfi-14-racket:
	
	racket -I r7rs -S . --script srfi-test/r7rs-programs/14.scm

srfi-14-racket-build-library:
	

test-srfi-14-racket-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:latest bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/14.scm"

srfi-14-racket-build-library-docker:
	

test-srfi-14-racket-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:head bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/14.scm"

srfi-14-racket-build-library-docker-head:
	

test-srfi-14-sagittarius:
	
	sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/14.scm

srfi-14-sagittarius-build-library:
	

test-srfi-14-sagittarius-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:latest bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/14.scm"

srfi-14-sagittarius-build-library-docker:
	

test-srfi-14-sagittarius-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:head bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/14.scm"

srfi-14-sagittarius-build-library-docker-head:
	

test-srfi-14-stklos:
	
	stklos -I . -I ./srfi -f srfi-test/r7rs-programs/14.scm

srfi-14-stklos-build-library:
	

test-srfi-14-stklos-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:latest bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/14.scm"

srfi-14-stklos-build-library-docker:
	

test-srfi-14-stklos-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:head bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/14.scm"

srfi-14-stklos-build-library-docker-head:
	

test-srfi-14-skint:
	
	skint -I ./ srfi-test/r7rs-programs/14.scm

srfi-14-skint-build-library:
	

test-srfi-14-skint-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:latest bash -c "cd workdir && skint -I ./ srfi-test/r7rs-programs/14.scm"

srfi-14-skint-build-library-docker:
	

test-srfi-14-skint-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:head bash -c "cd workdir && skint -I ./ srfi-test/r7rs-programs/14.scm"

srfi-14-skint-build-library-docker-head:
	

test-srfi-14-tr7:
	
	tr7i srfi-test/r7rs-programs/14.scm

srfi-14-tr7-build-library:
	

test-srfi-14-tr7-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:latest bash -c "cd workdir && tr7i srfi-test/r7rs-programs/14.scm"

srfi-14-tr7-build-library-docker:
	

test-srfi-14-tr7-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:head bash -c "cd workdir && tr7i srfi-test/r7rs-programs/14.scm"

srfi-14-tr7-build-library-docker-head:
	

test-srfi-14-ypsilon:
	
	ypsilon --warning --verbose --clean-acc --acc=/tmp --r7rs --loadpath=. srfi-test/r7rs-programs/14.scm

srfi-14-ypsilon-build-library:
	

test-srfi-14-ypsilon-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/ypsilon:latest bash -c "cd workdir && ypsilon --warning --verbose --clean-acc --acc=/tmp --r7rs --loadpath=. srfi-test/r7rs-programs/14.scm"

srfi-14-ypsilon-build-library-docker:
	

test-srfi-14-ypsilon-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/ypsilon:head bash -c "cd workdir && ypsilon --warning --verbose --clean-acc --acc=/tmp --r7rs --loadpath=. srfi-test/r7rs-programs/14.scm"

srfi-14-ypsilon-build-library-docker-head:
	

test-srfi-26-chibi:
	
	chibi-scheme -I . srfi-test/r7rs-programs/26.scm

srfi-26-chibi-build-library:
	

test-srfi-26-chibi-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:latest bash -c "cd workdir && chibi-scheme -I . srfi-test/r7rs-programs/26.scm"

srfi-26-chibi-build-library-docker:
	

test-srfi-26-chibi-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:head bash -c "cd workdir && chibi-scheme -I . srfi-test/r7rs-programs/26.scm"

srfi-26-chibi-build-library-docker-head:
	

test-srfi-26-chicken:
	  cp srfi/26.sld srfi-26.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-26.sld 
	csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/26.scm && srfi-test/r7rs-programs/26 && rm srfi-test/r7rs-programs/26

srfi-26-chicken-build-library:
	  cp srfi/26.sld srfi-26.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-26.sld 

test-srfi-26-chicken-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:latest bash -c "cd workdir &&  cp srfi/26.sld srfi-26.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-26.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:latest bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/26.scm && srfi-test/r7rs-programs/26 && rm srfi-test/r7rs-programs/26"

srfi-26-chicken-build-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:latest bash -c "cd workdir &&  cp srfi/26.sld srfi-26.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-26.sld" 

test-srfi-26-chicken-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:head bash -c "cd workdir &&  cp srfi/26.sld srfi-26.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-26.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:head bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/26.scm && srfi-test/r7rs-programs/26 && rm srfi-test/r7rs-programs/26"

srfi-26-chicken-build-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:head bash -c "cd workdir &&  cp srfi/26.sld srfi-26.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-26.sld" 

test-srfi-26-cyclone:
	 cyclone -I . srfi/26.sld 
	cyclone -I . srfi-test/r7rs-programs/26.scm && srfi-test/r7rs-programs/26 && rm srfi-test/r7rs-programs/26

srfi-26-cyclone-build-library:
	 cyclone -I . srfi/26.sld 

test-srfi-26-cyclone-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:latest bash -c "cd workdir && cyclone -I . srfi/26.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:latest bash -c "cd workdir && cyclone -I . srfi-test/r7rs-programs/26.scm && srfi-test/r7rs-programs/26 && rm srfi-test/r7rs-programs/26"

srfi-26-cyclone-build-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:latest bash -c "cd workdir && cyclone -I . srfi/26.sld" 

test-srfi-26-cyclone-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:head bash -c "cd workdir && cyclone -I . srfi/26.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:head bash -c "cd workdir && cyclone -I . srfi-test/r7rs-programs/26.scm && srfi-test/r7rs-programs/26 && rm srfi-test/r7rs-programs/26"

srfi-26-cyclone-build-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:head bash -c "cd workdir && cyclone -I . srfi/26.sld" 

test-srfi-26-foment:
	
	foment -I . -I ./srfi srfi-test/r7rs-programs/26.scm

srfi-26-foment-build-library:
	

test-srfi-26-foment-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment:latest bash -c "cd workdir && foment -I . -I ./srfi srfi-test/r7rs-programs/26.scm"

srfi-26-foment-build-library-docker:
	

test-srfi-26-foment-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment:head bash -c "cd workdir && foment -I . -I ./srfi srfi-test/r7rs-programs/26.scm"

srfi-26-foment-build-library-docker-head:
	

test-srfi-26-gambit:
	 gsc -:search=. srfi/26 
	gsc -exe ./ -nopreload srfi-test/r7rs-programs/26.scm && srfi-test/r7rs-programs/26 -:search=. && rm srfi-test/r7rs-programs/26

srfi-26-gambit-build-library:
	 gsc -:search=. srfi/26 

test-srfi-26-gambit-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:latest bash -c "cd workdir && gsc -:search=. srfi/26"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:latest bash -c "cd workdir && gsc -exe ./ -nopreload srfi-test/r7rs-programs/26.scm && srfi-test/r7rs-programs/26 -:search=. && rm srfi-test/r7rs-programs/26"

srfi-26-gambit-build-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:latest bash -c "cd workdir && gsc -:search=. srfi/26" 

test-srfi-26-gambit-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:head bash -c "cd workdir && gsc -:search=. srfi/26"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:head bash -c "cd workdir && gsc -exe ./ -nopreload srfi-test/r7rs-programs/26.scm && srfi-test/r7rs-programs/26 -:search=. && rm srfi-test/r7rs-programs/26"

srfi-26-gambit-build-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:head bash -c "cd workdir && gsc -:search=. srfi/26" 

test-srfi-26-gauche:
	
	gosh -r7 -I . srfi-test/r7rs-programs/26.scm

srfi-26-gauche-build-library:
	

test-srfi-26-gauche-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:latest bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/26.scm"

srfi-26-gauche-build-library-docker:
	

test-srfi-26-gauche-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:head bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/26.scm"

srfi-26-gauche-build-library-docker-head:
	

test-srfi-26-gerbil:
	 gxc -O srfi/26.sld 
	gxi --lang r7rs srfi-test/r7rs-programs/26.scm && srfi-test/r7rs-programs/26 && rm srfi-test/r7rs-programs/26

srfi-26-gerbil-build-library:
	 gxc -O srfi/26.sld 

test-srfi-26-gerbil-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil:latest bash -c "cd workdir && gxc -O srfi/26.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil:latest bash -c "cd workdir && gxi --lang r7rs srfi-test/r7rs-programs/26.scm && srfi-test/r7rs-programs/26 && rm srfi-test/r7rs-programs/26"

srfi-26-gerbil-build-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil:latest bash -c "cd workdir && gxc -O srfi/26.sld" 

test-srfi-26-gerbil-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil:head bash -c "cd workdir && gxc -O srfi/26.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil:head bash -c "cd workdir && gxi --lang r7rs srfi-test/r7rs-programs/26.scm && srfi-test/r7rs-programs/26 && rm srfi-test/r7rs-programs/26"

srfi-26-gerbil-build-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil:head bash -c "cd workdir && gxc -O srfi/26.sld" 

test-srfi-26-guile:
	
	guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/26.scm

srfi-26-guile-build-library:
	

test-srfi-26-guile-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:latest bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/26.scm"

srfi-26-guile-build-library-docker:
	

test-srfi-26-guile-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:head bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/26.scm"

srfi-26-guile-build-library-docker-head:
	

test-srfi-26-kawa:
	
	kawa --r7rs -Dkawa.import.path=../.. srfi-test/r7rs-programs/26.scm

srfi-26-kawa-build-library:
	

test-srfi-26-kawa-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:latest bash -c "cd workdir && kawa --r7rs -Dkawa.import.path=../.. srfi-test/r7rs-programs/26.scm"

srfi-26-kawa-build-library-docker:
	

test-srfi-26-kawa-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:head bash -c "cd workdir && kawa --r7rs -Dkawa.import.path=../.. srfi-test/r7rs-programs/26.scm"

srfi-26-kawa-build-library-docker-head:
	

test-srfi-26-larceny:
	
	larceny -r7 -I . srfi-test/r7rs-programs/26.scm

srfi-26-larceny-build-library:
	

test-srfi-26-larceny-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/larceny:latest bash -c "cd workdir && larceny -r7 -I . srfi-test/r7rs-programs/26.scm"

srfi-26-larceny-build-library-docker:
	

test-srfi-26-larceny-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/larceny:head bash -c "cd workdir && larceny -r7 -I . srfi-test/r7rs-programs/26.scm"

srfi-26-larceny-build-library-docker-head:
	

test-srfi-26-loko:
	 ls srfi/26.sld 
	loko -std=r7rs --compile srfi-test/r7rs-programs/26.scm && srfi-test/r7rs-programs/26 && rm srfi-test/r7rs-programs/26

srfi-26-loko-build-library:
	 ls srfi/26.sld 

test-srfi-26-loko-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && ls srfi/26.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/26.scm && srfi-test/r7rs-programs/26 && rm srfi-test/r7rs-programs/26"

srfi-26-loko-build-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && ls srfi/26.sld" 

test-srfi-26-loko-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:head bash -c "cd workdir && ls srfi/26.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko:head bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/26.scm && srfi-test/r7rs-programs/26 && rm srfi-test/r7rs-programs/26"

srfi-26-loko-build-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:head bash -c "cd workdir && ls srfi/26.sld" 

test-srfi-26-mit-scheme:
	
	mit-scheme --batch-mode --load ./srfi/26.sld ./srfi/28.sld ./srfi/64.sld srfi-test/r7rs-programs/26.scm

srfi-26-mit-scheme-build-library:
	

test-srfi-26-mit-scheme-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --batch-mode --load ./srfi/26.sld ./srfi/28.sld ./srfi/64.sld srfi-test/r7rs-programs/26.scm"

srfi-26-mit-scheme-build-library-docker:
	

test-srfi-26-mit-scheme-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:head bash -c "cd workdir && mit-scheme --batch-mode --load ./srfi/26.sld ./srfi/28.sld ./srfi/64.sld srfi-test/r7rs-programs/26.scm"

srfi-26-mit-scheme-build-library-docker-head:
	

test-srfi-26-mosh:
	
	mosh --loadpath=. srfi-test/r7rs-programs/26.scm

srfi-26-mosh-build-library:
	

test-srfi-26-mosh-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mosh:latest bash -c "cd workdir && mosh --loadpath=. srfi-test/r7rs-programs/26.scm"

srfi-26-mosh-build-library-docker:
	

test-srfi-26-mosh-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mosh:head bash -c "cd workdir && mosh --loadpath=. srfi-test/r7rs-programs/26.scm"

srfi-26-mosh-build-library-docker-head:
	

test-srfi-26-racket:
	
	racket -I r7rs -S . --script srfi-test/r7rs-programs/26.scm

srfi-26-racket-build-library:
	

test-srfi-26-racket-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:latest bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/26.scm"

srfi-26-racket-build-library-docker:
	

test-srfi-26-racket-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:head bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/26.scm"

srfi-26-racket-build-library-docker-head:
	

test-srfi-26-sagittarius:
	
	sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/26.scm

srfi-26-sagittarius-build-library:
	

test-srfi-26-sagittarius-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:latest bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/26.scm"

srfi-26-sagittarius-build-library-docker:
	

test-srfi-26-sagittarius-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:head bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/26.scm"

srfi-26-sagittarius-build-library-docker-head:
	

test-srfi-26-stklos:
	
	stklos -I . -I ./srfi -f srfi-test/r7rs-programs/26.scm

srfi-26-stklos-build-library:
	

test-srfi-26-stklos-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:latest bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/26.scm"

srfi-26-stklos-build-library-docker:
	

test-srfi-26-stklos-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:head bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/26.scm"

srfi-26-stklos-build-library-docker-head:
	

test-srfi-26-skint:
	
	skint -I ./ srfi-test/r7rs-programs/26.scm

srfi-26-skint-build-library:
	

test-srfi-26-skint-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:latest bash -c "cd workdir && skint -I ./ srfi-test/r7rs-programs/26.scm"

srfi-26-skint-build-library-docker:
	

test-srfi-26-skint-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:head bash -c "cd workdir && skint -I ./ srfi-test/r7rs-programs/26.scm"

srfi-26-skint-build-library-docker-head:
	

test-srfi-26-tr7:
	
	tr7i srfi-test/r7rs-programs/26.scm

srfi-26-tr7-build-library:
	

test-srfi-26-tr7-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:latest bash -c "cd workdir && tr7i srfi-test/r7rs-programs/26.scm"

srfi-26-tr7-build-library-docker:
	

test-srfi-26-tr7-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:head bash -c "cd workdir && tr7i srfi-test/r7rs-programs/26.scm"

srfi-26-tr7-build-library-docker-head:
	

test-srfi-26-ypsilon:
	
	ypsilon --warning --verbose --clean-acc --acc=/tmp --r7rs --loadpath=. srfi-test/r7rs-programs/26.scm

srfi-26-ypsilon-build-library:
	

test-srfi-26-ypsilon-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/ypsilon:latest bash -c "cd workdir && ypsilon --warning --verbose --clean-acc --acc=/tmp --r7rs --loadpath=. srfi-test/r7rs-programs/26.scm"

srfi-26-ypsilon-build-library-docker:
	

test-srfi-26-ypsilon-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/ypsilon:head bash -c "cd workdir && ypsilon --warning --verbose --clean-acc --acc=/tmp --r7rs --loadpath=. srfi-test/r7rs-programs/26.scm"

srfi-26-ypsilon-build-library-docker-head:
	

test-srfi-28-chibi:
	
	chibi-scheme -I . srfi-test/r7rs-programs/28.scm

srfi-28-chibi-build-library:
	

test-srfi-28-chibi-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:latest bash -c "cd workdir && chibi-scheme -I . srfi-test/r7rs-programs/28.scm"

srfi-28-chibi-build-library-docker:
	

test-srfi-28-chibi-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:head bash -c "cd workdir && chibi-scheme -I . srfi-test/r7rs-programs/28.scm"

srfi-28-chibi-build-library-docker-head:
	

test-srfi-28-chicken:
	  cp srfi/28.sld srfi-28.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-28.sld 
	csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/28.scm && srfi-test/r7rs-programs/28 && rm srfi-test/r7rs-programs/28

srfi-28-chicken-build-library:
	  cp srfi/28.sld srfi-28.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-28.sld 

test-srfi-28-chicken-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:latest bash -c "cd workdir &&  cp srfi/28.sld srfi-28.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-28.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:latest bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/28.scm && srfi-test/r7rs-programs/28 && rm srfi-test/r7rs-programs/28"

srfi-28-chicken-build-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:latest bash -c "cd workdir &&  cp srfi/28.sld srfi-28.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-28.sld" 

test-srfi-28-chicken-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:head bash -c "cd workdir &&  cp srfi/28.sld srfi-28.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-28.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:head bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/28.scm && srfi-test/r7rs-programs/28 && rm srfi-test/r7rs-programs/28"

srfi-28-chicken-build-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:head bash -c "cd workdir &&  cp srfi/28.sld srfi-28.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-28.sld" 

test-srfi-28-cyclone:
	 cyclone -I . srfi/28.sld 
	cyclone -I . srfi-test/r7rs-programs/28.scm && srfi-test/r7rs-programs/28 && rm srfi-test/r7rs-programs/28

srfi-28-cyclone-build-library:
	 cyclone -I . srfi/28.sld 

test-srfi-28-cyclone-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:latest bash -c "cd workdir && cyclone -I . srfi/28.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:latest bash -c "cd workdir && cyclone -I . srfi-test/r7rs-programs/28.scm && srfi-test/r7rs-programs/28 && rm srfi-test/r7rs-programs/28"

srfi-28-cyclone-build-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:latest bash -c "cd workdir && cyclone -I . srfi/28.sld" 

test-srfi-28-cyclone-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:head bash -c "cd workdir && cyclone -I . srfi/28.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:head bash -c "cd workdir && cyclone -I . srfi-test/r7rs-programs/28.scm && srfi-test/r7rs-programs/28 && rm srfi-test/r7rs-programs/28"

srfi-28-cyclone-build-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:head bash -c "cd workdir && cyclone -I . srfi/28.sld" 

test-srfi-28-foment:
	
	foment -I . -I ./srfi srfi-test/r7rs-programs/28.scm

srfi-28-foment-build-library:
	

test-srfi-28-foment-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment:latest bash -c "cd workdir && foment -I . -I ./srfi srfi-test/r7rs-programs/28.scm"

srfi-28-foment-build-library-docker:
	

test-srfi-28-foment-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment:head bash -c "cd workdir && foment -I . -I ./srfi srfi-test/r7rs-programs/28.scm"

srfi-28-foment-build-library-docker-head:
	

test-srfi-28-gambit:
	 gsc -:search=. srfi/28 
	gsc -exe ./ -nopreload srfi-test/r7rs-programs/28.scm && srfi-test/r7rs-programs/28 -:search=. && rm srfi-test/r7rs-programs/28

srfi-28-gambit-build-library:
	 gsc -:search=. srfi/28 

test-srfi-28-gambit-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:latest bash -c "cd workdir && gsc -:search=. srfi/28"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:latest bash -c "cd workdir && gsc -exe ./ -nopreload srfi-test/r7rs-programs/28.scm && srfi-test/r7rs-programs/28 -:search=. && rm srfi-test/r7rs-programs/28"

srfi-28-gambit-build-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:latest bash -c "cd workdir && gsc -:search=. srfi/28" 

test-srfi-28-gambit-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:head bash -c "cd workdir && gsc -:search=. srfi/28"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:head bash -c "cd workdir && gsc -exe ./ -nopreload srfi-test/r7rs-programs/28.scm && srfi-test/r7rs-programs/28 -:search=. && rm srfi-test/r7rs-programs/28"

srfi-28-gambit-build-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:head bash -c "cd workdir && gsc -:search=. srfi/28" 

test-srfi-28-gauche:
	
	gosh -r7 -I . srfi-test/r7rs-programs/28.scm

srfi-28-gauche-build-library:
	

test-srfi-28-gauche-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:latest bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/28.scm"

srfi-28-gauche-build-library-docker:
	

test-srfi-28-gauche-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:head bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/28.scm"

srfi-28-gauche-build-library-docker-head:
	

test-srfi-28-gerbil:
	 gxc -O srfi/28.sld 
	gxi --lang r7rs srfi-test/r7rs-programs/28.scm && srfi-test/r7rs-programs/28 && rm srfi-test/r7rs-programs/28

srfi-28-gerbil-build-library:
	 gxc -O srfi/28.sld 

test-srfi-28-gerbil-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil:latest bash -c "cd workdir && gxc -O srfi/28.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil:latest bash -c "cd workdir && gxi --lang r7rs srfi-test/r7rs-programs/28.scm && srfi-test/r7rs-programs/28 && rm srfi-test/r7rs-programs/28"

srfi-28-gerbil-build-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil:latest bash -c "cd workdir && gxc -O srfi/28.sld" 

test-srfi-28-gerbil-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil:head bash -c "cd workdir && gxc -O srfi/28.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil:head bash -c "cd workdir && gxi --lang r7rs srfi-test/r7rs-programs/28.scm && srfi-test/r7rs-programs/28 && rm srfi-test/r7rs-programs/28"

srfi-28-gerbil-build-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil:head bash -c "cd workdir && gxc -O srfi/28.sld" 

test-srfi-28-guile:
	
	guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/28.scm

srfi-28-guile-build-library:
	

test-srfi-28-guile-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:latest bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/28.scm"

srfi-28-guile-build-library-docker:
	

test-srfi-28-guile-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:head bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/28.scm"

srfi-28-guile-build-library-docker-head:
	

test-srfi-28-kawa:
	
	kawa --r7rs -Dkawa.import.path=../.. srfi-test/r7rs-programs/28.scm

srfi-28-kawa-build-library:
	

test-srfi-28-kawa-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:latest bash -c "cd workdir && kawa --r7rs -Dkawa.import.path=../.. srfi-test/r7rs-programs/28.scm"

srfi-28-kawa-build-library-docker:
	

test-srfi-28-kawa-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:head bash -c "cd workdir && kawa --r7rs -Dkawa.import.path=../.. srfi-test/r7rs-programs/28.scm"

srfi-28-kawa-build-library-docker-head:
	

test-srfi-28-larceny:
	
	larceny -r7 -I . srfi-test/r7rs-programs/28.scm

srfi-28-larceny-build-library:
	

test-srfi-28-larceny-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/larceny:latest bash -c "cd workdir && larceny -r7 -I . srfi-test/r7rs-programs/28.scm"

srfi-28-larceny-build-library-docker:
	

test-srfi-28-larceny-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/larceny:head bash -c "cd workdir && larceny -r7 -I . srfi-test/r7rs-programs/28.scm"

srfi-28-larceny-build-library-docker-head:
	

test-srfi-28-loko:
	 ls srfi/28.sld 
	loko -std=r7rs --compile srfi-test/r7rs-programs/28.scm && srfi-test/r7rs-programs/28 && rm srfi-test/r7rs-programs/28

srfi-28-loko-build-library:
	 ls srfi/28.sld 

test-srfi-28-loko-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && ls srfi/28.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/28.scm && srfi-test/r7rs-programs/28 && rm srfi-test/r7rs-programs/28"

srfi-28-loko-build-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && ls srfi/28.sld" 

test-srfi-28-loko-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:head bash -c "cd workdir && ls srfi/28.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko:head bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/28.scm && srfi-test/r7rs-programs/28 && rm srfi-test/r7rs-programs/28"

srfi-28-loko-build-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:head bash -c "cd workdir && ls srfi/28.sld" 

test-srfi-28-mit-scheme:
	
	mit-scheme --batch-mode --load ./srfi/26.sld ./srfi/28.sld ./srfi/64.sld srfi-test/r7rs-programs/28.scm

srfi-28-mit-scheme-build-library:
	

test-srfi-28-mit-scheme-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --batch-mode --load ./srfi/26.sld ./srfi/28.sld ./srfi/64.sld srfi-test/r7rs-programs/28.scm"

srfi-28-mit-scheme-build-library-docker:
	

test-srfi-28-mit-scheme-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:head bash -c "cd workdir && mit-scheme --batch-mode --load ./srfi/26.sld ./srfi/28.sld ./srfi/64.sld srfi-test/r7rs-programs/28.scm"

srfi-28-mit-scheme-build-library-docker-head:
	

test-srfi-28-mosh:
	
	mosh --loadpath=. srfi-test/r7rs-programs/28.scm

srfi-28-mosh-build-library:
	

test-srfi-28-mosh-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mosh:latest bash -c "cd workdir && mosh --loadpath=. srfi-test/r7rs-programs/28.scm"

srfi-28-mosh-build-library-docker:
	

test-srfi-28-mosh-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mosh:head bash -c "cd workdir && mosh --loadpath=. srfi-test/r7rs-programs/28.scm"

srfi-28-mosh-build-library-docker-head:
	

test-srfi-28-racket:
	
	racket -I r7rs -S . --script srfi-test/r7rs-programs/28.scm

srfi-28-racket-build-library:
	

test-srfi-28-racket-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:latest bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/28.scm"

srfi-28-racket-build-library-docker:
	

test-srfi-28-racket-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:head bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/28.scm"

srfi-28-racket-build-library-docker-head:
	

test-srfi-28-sagittarius:
	
	sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/28.scm

srfi-28-sagittarius-build-library:
	

test-srfi-28-sagittarius-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:latest bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/28.scm"

srfi-28-sagittarius-build-library-docker:
	

test-srfi-28-sagittarius-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:head bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/28.scm"

srfi-28-sagittarius-build-library-docker-head:
	

test-srfi-28-stklos:
	
	stklos -I . -I ./srfi -f srfi-test/r7rs-programs/28.scm

srfi-28-stklos-build-library:
	

test-srfi-28-stklos-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:latest bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/28.scm"

srfi-28-stklos-build-library-docker:
	

test-srfi-28-stklos-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:head bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/28.scm"

srfi-28-stklos-build-library-docker-head:
	

test-srfi-28-skint:
	
	skint -I ./ srfi-test/r7rs-programs/28.scm

srfi-28-skint-build-library:
	

test-srfi-28-skint-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:latest bash -c "cd workdir && skint -I ./ srfi-test/r7rs-programs/28.scm"

srfi-28-skint-build-library-docker:
	

test-srfi-28-skint-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:head bash -c "cd workdir && skint -I ./ srfi-test/r7rs-programs/28.scm"

srfi-28-skint-build-library-docker-head:
	

test-srfi-28-tr7:
	
	tr7i srfi-test/r7rs-programs/28.scm

srfi-28-tr7-build-library:
	

test-srfi-28-tr7-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:latest bash -c "cd workdir && tr7i srfi-test/r7rs-programs/28.scm"

srfi-28-tr7-build-library-docker:
	

test-srfi-28-tr7-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:head bash -c "cd workdir && tr7i srfi-test/r7rs-programs/28.scm"

srfi-28-tr7-build-library-docker-head:
	

test-srfi-28-ypsilon:
	
	ypsilon --warning --verbose --clean-acc --acc=/tmp --r7rs --loadpath=. srfi-test/r7rs-programs/28.scm

srfi-28-ypsilon-build-library:
	

test-srfi-28-ypsilon-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/ypsilon:latest bash -c "cd workdir && ypsilon --warning --verbose --clean-acc --acc=/tmp --r7rs --loadpath=. srfi-test/r7rs-programs/28.scm"

srfi-28-ypsilon-build-library-docker:
	

test-srfi-28-ypsilon-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/ypsilon:head bash -c "cd workdir && ypsilon --warning --verbose --clean-acc --acc=/tmp --r7rs --loadpath=. srfi-test/r7rs-programs/28.scm"

srfi-28-ypsilon-build-library-docker-head:
	

test-srfi-33-chibi:
	
	chibi-scheme -I . srfi-test/r7rs-programs/33.scm

srfi-33-chibi-build-library:
	

test-srfi-33-chibi-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:latest bash -c "cd workdir && chibi-scheme -I . srfi-test/r7rs-programs/33.scm"

srfi-33-chibi-build-library-docker:
	

test-srfi-33-chibi-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:head bash -c "cd workdir && chibi-scheme -I . srfi-test/r7rs-programs/33.scm"

srfi-33-chibi-build-library-docker-head:
	

test-srfi-33-chicken:
	  cp srfi/33.sld srfi-33.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-33.sld 
	csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/33.scm && srfi-test/r7rs-programs/33 && rm srfi-test/r7rs-programs/33

srfi-33-chicken-build-library:
	  cp srfi/33.sld srfi-33.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-33.sld 

test-srfi-33-chicken-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:latest bash -c "cd workdir &&  cp srfi/33.sld srfi-33.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-33.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:latest bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/33.scm && srfi-test/r7rs-programs/33 && rm srfi-test/r7rs-programs/33"

srfi-33-chicken-build-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:latest bash -c "cd workdir &&  cp srfi/33.sld srfi-33.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-33.sld" 

test-srfi-33-chicken-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:head bash -c "cd workdir &&  cp srfi/33.sld srfi-33.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-33.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:head bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/33.scm && srfi-test/r7rs-programs/33 && rm srfi-test/r7rs-programs/33"

srfi-33-chicken-build-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:head bash -c "cd workdir &&  cp srfi/33.sld srfi-33.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-33.sld" 

test-srfi-33-cyclone:
	 cyclone -I . srfi/33.sld 
	cyclone -I . srfi-test/r7rs-programs/33.scm && srfi-test/r7rs-programs/33 && rm srfi-test/r7rs-programs/33

srfi-33-cyclone-build-library:
	 cyclone -I . srfi/33.sld 

test-srfi-33-cyclone-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:latest bash -c "cd workdir && cyclone -I . srfi/33.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:latest bash -c "cd workdir && cyclone -I . srfi-test/r7rs-programs/33.scm && srfi-test/r7rs-programs/33 && rm srfi-test/r7rs-programs/33"

srfi-33-cyclone-build-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:latest bash -c "cd workdir && cyclone -I . srfi/33.sld" 

test-srfi-33-cyclone-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:head bash -c "cd workdir && cyclone -I . srfi/33.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:head bash -c "cd workdir && cyclone -I . srfi-test/r7rs-programs/33.scm && srfi-test/r7rs-programs/33 && rm srfi-test/r7rs-programs/33"

srfi-33-cyclone-build-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:head bash -c "cd workdir && cyclone -I . srfi/33.sld" 

test-srfi-33-foment:
	
	foment -I --load srfi-test/r7rs-programs/33.scm

srfi-33-foment-build-library:
	

test-srfi-33-foment-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment:latest bash -c "cd workdir && foment -I --load srfi-test/r7rs-programs/33.scm"

srfi-33-foment-build-library-docker:
	

test-srfi-33-foment-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment:head bash -c "cd workdir && foment -I --load srfi-test/r7rs-programs/33.scm"

srfi-33-foment-build-library-docker-head:
	

test-srfi-33-gambit:
	 gsc -:search=. srfi/33 
	gsc -exe ./ -nopreload srfi-test/r7rs-programs/33.scm && srfi-test/r7rs-programs/33 -:search=. && rm srfi-test/r7rs-programs/33

srfi-33-gambit-build-library:
	 gsc -:search=. srfi/33 

test-srfi-33-gambit-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:latest bash -c "cd workdir && gsc -:search=. srfi/33"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:latest bash -c "cd workdir && gsc -exe ./ -nopreload srfi-test/r7rs-programs/33.scm && srfi-test/r7rs-programs/33 -:search=. && rm srfi-test/r7rs-programs/33"

srfi-33-gambit-build-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:latest bash -c "cd workdir && gsc -:search=. srfi/33" 

test-srfi-33-gambit-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:head bash -c "cd workdir && gsc -:search=. srfi/33"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:head bash -c "cd workdir && gsc -exe ./ -nopreload srfi-test/r7rs-programs/33.scm && srfi-test/r7rs-programs/33 -:search=. && rm srfi-test/r7rs-programs/33"

srfi-33-gambit-build-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:head bash -c "cd workdir && gsc -:search=. srfi/33" 

test-srfi-33-gauche:
	
	gosh -r7 -I . srfi-test/r7rs-programs/33.scm

srfi-33-gauche-build-library:
	

test-srfi-33-gauche-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:latest bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/33.scm"

srfi-33-gauche-build-library-docker:
	

test-srfi-33-gauche-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:head bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/33.scm"

srfi-33-gauche-build-library-docker-head:
	

test-srfi-33-gerbil:
	 gxc -O srfi/33.sld 
	gxi --lang r7rs srfi-test/r7rs-programs/33.scm && srfi-test/r7rs-programs/33 && rm srfi-test/r7rs-programs/33

srfi-33-gerbil-build-library:
	 gxc -O srfi/33.sld 

test-srfi-33-gerbil-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil:latest bash -c "cd workdir && gxc -O srfi/33.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil:latest bash -c "cd workdir && gxi --lang r7rs srfi-test/r7rs-programs/33.scm && srfi-test/r7rs-programs/33 && rm srfi-test/r7rs-programs/33"

srfi-33-gerbil-build-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil:latest bash -c "cd workdir && gxc -O srfi/33.sld" 

test-srfi-33-gerbil-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil:head bash -c "cd workdir && gxc -O srfi/33.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil:head bash -c "cd workdir && gxi --lang r7rs srfi-test/r7rs-programs/33.scm && srfi-test/r7rs-programs/33 && rm srfi-test/r7rs-programs/33"

srfi-33-gerbil-build-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil:head bash -c "cd workdir && gxc -O srfi/33.sld" 

test-srfi-33-guile:
	
	guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/33.scm

srfi-33-guile-build-library:
	

test-srfi-33-guile-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:latest bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/33.scm"

srfi-33-guile-build-library-docker:
	

test-srfi-33-guile-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:head bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/33.scm"

srfi-33-guile-build-library-docker-head:
	

test-srfi-33-kawa:
	
	kawa --r7rs -Dkawa.import.path=../.. srfi-test/r7rs-programs/33.scm

srfi-33-kawa-build-library:
	

test-srfi-33-kawa-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:latest bash -c "cd workdir && kawa --r7rs -Dkawa.import.path=../.. srfi-test/r7rs-programs/33.scm"

srfi-33-kawa-build-library-docker:
	

test-srfi-33-kawa-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:head bash -c "cd workdir && kawa --r7rs -Dkawa.import.path=../.. srfi-test/r7rs-programs/33.scm"

srfi-33-kawa-build-library-docker-head:
	

test-srfi-33-larceny:
	
	larceny -r7 -I . srfi-test/r7rs-programs/33.scm

srfi-33-larceny-build-library:
	

test-srfi-33-larceny-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/larceny:latest bash -c "cd workdir && larceny -r7 -I . srfi-test/r7rs-programs/33.scm"

srfi-33-larceny-build-library-docker:
	

test-srfi-33-larceny-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/larceny:head bash -c "cd workdir && larceny -r7 -I . srfi-test/r7rs-programs/33.scm"

srfi-33-larceny-build-library-docker-head:
	

test-srfi-33-loko:
	 ls srfi/33.sld 
	loko -std=r7rs --compile srfi-test/r7rs-programs/33.scm && srfi-test/r7rs-programs/33 && rm srfi-test/r7rs-programs/33

srfi-33-loko-build-library:
	 ls srfi/33.sld 

test-srfi-33-loko-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && ls srfi/33.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/33.scm && srfi-test/r7rs-programs/33 && rm srfi-test/r7rs-programs/33"

srfi-33-loko-build-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && ls srfi/33.sld" 

test-srfi-33-loko-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:head bash -c "cd workdir && ls srfi/33.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko:head bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/33.scm && srfi-test/r7rs-programs/33 && rm srfi-test/r7rs-programs/33"

srfi-33-loko-build-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:head bash -c "cd workdir && ls srfi/33.sld" 

test-srfi-33-mit-scheme:
	
	mit-scheme --load srfi-test/r7rs-programs/33.scm

srfi-33-mit-scheme-build-library:
	

test-srfi-33-mit-scheme-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --load srfi-test/r7rs-programs/33.scm"

srfi-33-mit-scheme-build-library-docker:
	

test-srfi-33-mit-scheme-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:head bash -c "cd workdir && mit-scheme --load srfi-test/r7rs-programs/33.scm"

srfi-33-mit-scheme-build-library-docker-head:
	

test-srfi-33-mosh:
	
	mosh --loadpath=. srfi-test/r7rs-programs/33.scm

srfi-33-mosh-build-library:
	

test-srfi-33-mosh-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mosh:latest bash -c "cd workdir && mosh --loadpath=. srfi-test/r7rs-programs/33.scm"

srfi-33-mosh-build-library-docker:
	

test-srfi-33-mosh-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mosh:head bash -c "cd workdir && mosh --loadpath=. srfi-test/r7rs-programs/33.scm"

srfi-33-mosh-build-library-docker-head:
	

test-srfi-33-racket:
	
	racket -I r7rs -S . --script srfi-test/r7rs-programs/33.scm

srfi-33-racket-build-library:
	

test-srfi-33-racket-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:latest bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/33.scm"

srfi-33-racket-build-library-docker:
	

test-srfi-33-racket-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:head bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/33.scm"

srfi-33-racket-build-library-docker-head:
	

test-srfi-33-sagittarius:
	
	sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/33.scm

srfi-33-sagittarius-build-library:
	

test-srfi-33-sagittarius-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:latest bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/33.scm"

srfi-33-sagittarius-build-library-docker:
	

test-srfi-33-sagittarius-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:head bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/33.scm"

srfi-33-sagittarius-build-library-docker-head:
	

test-srfi-33-stklos:
	
	stklos -I . -I ./srfi -f srfi-test/r7rs-programs/33.scm

srfi-33-stklos-build-library:
	

test-srfi-33-stklos-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:latest bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/33.scm"

srfi-33-stklos-build-library-docker:
	

test-srfi-33-stklos-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:head bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/33.scm"

srfi-33-stklos-build-library-docker-head:
	

test-srfi-33-skint:
	
	skint -I ./ srfi-test/r7rs-programs/33.scm

srfi-33-skint-build-library:
	

test-srfi-33-skint-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:latest bash -c "cd workdir && skint -I ./ srfi-test/r7rs-programs/33.scm"

srfi-33-skint-build-library-docker:
	

test-srfi-33-skint-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:head bash -c "cd workdir && skint -I ./ srfi-test/r7rs-programs/33.scm"

srfi-33-skint-build-library-docker-head:
	

test-srfi-33-tr7:
	
	tr7i srfi-test/r7rs-programs/33.scm

srfi-33-tr7-build-library:
	

test-srfi-33-tr7-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:latest bash -c "cd workdir && tr7i srfi-test/r7rs-programs/33.scm"

srfi-33-tr7-build-library-docker:
	

test-srfi-33-tr7-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:head bash -c "cd workdir && tr7i srfi-test/r7rs-programs/33.scm"

srfi-33-tr7-build-library-docker-head:
	

test-srfi-33-ypsilon:
	
	ypsilon --warning --verbose --clean-acc --acc=/tmp --r7rs --loadpath=. srfi-test/r7rs-programs/33.scm

srfi-33-ypsilon-build-library:
	

test-srfi-33-ypsilon-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/ypsilon:latest bash -c "cd workdir && ypsilon --warning --verbose --clean-acc --acc=/tmp --r7rs --loadpath=. srfi-test/r7rs-programs/33.scm"

srfi-33-ypsilon-build-library-docker:
	

test-srfi-33-ypsilon-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/ypsilon:head bash -c "cd workdir && ypsilon --warning --verbose --clean-acc --acc=/tmp --r7rs --loadpath=. srfi-test/r7rs-programs/33.scm"

srfi-33-ypsilon-build-library-docker-head:
	

test-srfi-13-chibi:
	
	chibi-scheme -I . srfi-test/r7rs-programs/13.scm

srfi-13-chibi-build-library:
	

test-srfi-13-chibi-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:latest bash -c "cd workdir && chibi-scheme -I . srfi-test/r7rs-programs/13.scm"

srfi-13-chibi-build-library-docker:
	

test-srfi-13-chibi-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:head bash -c "cd workdir && chibi-scheme -I . srfi-test/r7rs-programs/13.scm"

srfi-13-chibi-build-library-docker-head:
	

test-srfi-13-chicken:
	  cp srfi/13.sld srfi-13.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-13.sld 
	csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/13.scm && srfi-test/r7rs-programs/13 && rm srfi-test/r7rs-programs/13

srfi-13-chicken-build-library:
	  cp srfi/13.sld srfi-13.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-13.sld 

test-srfi-13-chicken-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:latest bash -c "cd workdir &&  cp srfi/13.sld srfi-13.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-13.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:latest bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/13.scm && srfi-test/r7rs-programs/13 && rm srfi-test/r7rs-programs/13"

srfi-13-chicken-build-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:latest bash -c "cd workdir &&  cp srfi/13.sld srfi-13.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-13.sld" 

test-srfi-13-chicken-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:head bash -c "cd workdir &&  cp srfi/13.sld srfi-13.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-13.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:head bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/13.scm && srfi-test/r7rs-programs/13 && rm srfi-test/r7rs-programs/13"

srfi-13-chicken-build-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:head bash -c "cd workdir &&  cp srfi/13.sld srfi-13.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-13.sld" 

test-srfi-13-cyclone:
	 cyclone -I . srfi/13.sld 
	cyclone -I . srfi-test/r7rs-programs/13.scm && srfi-test/r7rs-programs/13 && rm srfi-test/r7rs-programs/13

srfi-13-cyclone-build-library:
	 cyclone -I . srfi/13.sld 

test-srfi-13-cyclone-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:latest bash -c "cd workdir && cyclone -I . srfi/13.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:latest bash -c "cd workdir && cyclone -I . srfi-test/r7rs-programs/13.scm && srfi-test/r7rs-programs/13 && rm srfi-test/r7rs-programs/13"

srfi-13-cyclone-build-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:latest bash -c "cd workdir && cyclone -I . srfi/13.sld" 

test-srfi-13-cyclone-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:head bash -c "cd workdir && cyclone -I . srfi/13.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:head bash -c "cd workdir && cyclone -I . srfi-test/r7rs-programs/13.scm && srfi-test/r7rs-programs/13 && rm srfi-test/r7rs-programs/13"

srfi-13-cyclone-build-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:head bash -c "cd workdir && cyclone -I . srfi/13.sld" 

test-srfi-13-foment:
	
	foment -I --load srfi-test/r7rs-programs/13.scm

srfi-13-foment-build-library:
	

test-srfi-13-foment-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment:latest bash -c "cd workdir && foment -I --load srfi-test/r7rs-programs/13.scm"

srfi-13-foment-build-library-docker:
	

test-srfi-13-foment-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment:head bash -c "cd workdir && foment -I --load srfi-test/r7rs-programs/13.scm"

srfi-13-foment-build-library-docker-head:
	

test-srfi-13-gambit:
	 gsc -:search=. srfi/13 
	gsc -exe ./ -nopreload srfi-test/r7rs-programs/13.scm && srfi-test/r7rs-programs/13 -:search=. && rm srfi-test/r7rs-programs/13

srfi-13-gambit-build-library:
	 gsc -:search=. srfi/13 

test-srfi-13-gambit-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:latest bash -c "cd workdir && gsc -:search=. srfi/13"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:latest bash -c "cd workdir && gsc -exe ./ -nopreload srfi-test/r7rs-programs/13.scm && srfi-test/r7rs-programs/13 -:search=. && rm srfi-test/r7rs-programs/13"

srfi-13-gambit-build-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:latest bash -c "cd workdir && gsc -:search=. srfi/13" 

test-srfi-13-gambit-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:head bash -c "cd workdir && gsc -:search=. srfi/13"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:head bash -c "cd workdir && gsc -exe ./ -nopreload srfi-test/r7rs-programs/13.scm && srfi-test/r7rs-programs/13 -:search=. && rm srfi-test/r7rs-programs/13"

srfi-13-gambit-build-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:head bash -c "cd workdir && gsc -:search=. srfi/13" 

test-srfi-13-gauche:
	
	gosh -r7 -I . srfi-test/r7rs-programs/13.scm

srfi-13-gauche-build-library:
	

test-srfi-13-gauche-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:latest bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/13.scm"

srfi-13-gauche-build-library-docker:
	

test-srfi-13-gauche-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:head bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/13.scm"

srfi-13-gauche-build-library-docker-head:
	

test-srfi-13-gerbil:
	 gxc -O srfi/13.sld 
	gxi --lang r7rs srfi-test/r7rs-programs/13.scm && srfi-test/r7rs-programs/13 && rm srfi-test/r7rs-programs/13

srfi-13-gerbil-build-library:
	 gxc -O srfi/13.sld 

test-srfi-13-gerbil-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil:latest bash -c "cd workdir && gxc -O srfi/13.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil:latest bash -c "cd workdir && gxi --lang r7rs srfi-test/r7rs-programs/13.scm && srfi-test/r7rs-programs/13 && rm srfi-test/r7rs-programs/13"

srfi-13-gerbil-build-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil:latest bash -c "cd workdir && gxc -O srfi/13.sld" 

test-srfi-13-gerbil-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil:head bash -c "cd workdir && gxc -O srfi/13.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil:head bash -c "cd workdir && gxi --lang r7rs srfi-test/r7rs-programs/13.scm && srfi-test/r7rs-programs/13 && rm srfi-test/r7rs-programs/13"

srfi-13-gerbil-build-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil:head bash -c "cd workdir && gxc -O srfi/13.sld" 

test-srfi-13-guile:
	
	guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/13.scm

srfi-13-guile-build-library:
	

test-srfi-13-guile-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:latest bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/13.scm"

srfi-13-guile-build-library-docker:
	

test-srfi-13-guile-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:head bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/13.scm"

srfi-13-guile-build-library-docker-head:
	

test-srfi-13-kawa:
	
	kawa --r7rs -Dkawa.import.path=../.. srfi-test/r7rs-programs/13.scm

srfi-13-kawa-build-library:
	

test-srfi-13-kawa-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:latest bash -c "cd workdir && kawa --r7rs -Dkawa.import.path=../.. srfi-test/r7rs-programs/13.scm"

srfi-13-kawa-build-library-docker:
	

test-srfi-13-kawa-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:head bash -c "cd workdir && kawa --r7rs -Dkawa.import.path=../.. srfi-test/r7rs-programs/13.scm"

srfi-13-kawa-build-library-docker-head:
	

test-srfi-13-larceny:
	
	larceny -r7 -I . srfi-test/r7rs-programs/13.scm

srfi-13-larceny-build-library:
	

test-srfi-13-larceny-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/larceny:latest bash -c "cd workdir && larceny -r7 -I . srfi-test/r7rs-programs/13.scm"

srfi-13-larceny-build-library-docker:
	

test-srfi-13-larceny-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/larceny:head bash -c "cd workdir && larceny -r7 -I . srfi-test/r7rs-programs/13.scm"

srfi-13-larceny-build-library-docker-head:
	

test-srfi-13-loko:
	 ls srfi/13.sld 
	loko -std=r7rs --compile srfi-test/r7rs-programs/13.scm && srfi-test/r7rs-programs/13 && rm srfi-test/r7rs-programs/13

srfi-13-loko-build-library:
	 ls srfi/13.sld 

test-srfi-13-loko-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && ls srfi/13.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/13.scm && srfi-test/r7rs-programs/13 && rm srfi-test/r7rs-programs/13"

srfi-13-loko-build-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && ls srfi/13.sld" 

test-srfi-13-loko-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:head bash -c "cd workdir && ls srfi/13.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko:head bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/13.scm && srfi-test/r7rs-programs/13 && rm srfi-test/r7rs-programs/13"

srfi-13-loko-build-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:head bash -c "cd workdir && ls srfi/13.sld" 

test-srfi-13-mit-scheme:
	
	mit-scheme --load srfi-test/r7rs-programs/13.scm

srfi-13-mit-scheme-build-library:
	

test-srfi-13-mit-scheme-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --load srfi-test/r7rs-programs/13.scm"

srfi-13-mit-scheme-build-library-docker:
	

test-srfi-13-mit-scheme-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:head bash -c "cd workdir && mit-scheme --load srfi-test/r7rs-programs/13.scm"

srfi-13-mit-scheme-build-library-docker-head:
	

test-srfi-13-mosh:
	
	mosh --loadpath=. srfi-test/r7rs-programs/13.scm

srfi-13-mosh-build-library:
	

test-srfi-13-mosh-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mosh:latest bash -c "cd workdir && mosh --loadpath=. srfi-test/r7rs-programs/13.scm"

srfi-13-mosh-build-library-docker:
	

test-srfi-13-mosh-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mosh:head bash -c "cd workdir && mosh --loadpath=. srfi-test/r7rs-programs/13.scm"

srfi-13-mosh-build-library-docker-head:
	

test-srfi-13-racket:
	
	racket -I r7rs -S . --script srfi-test/r7rs-programs/13.scm

srfi-13-racket-build-library:
	

test-srfi-13-racket-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:latest bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/13.scm"

srfi-13-racket-build-library-docker:
	

test-srfi-13-racket-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:head bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/13.scm"

srfi-13-racket-build-library-docker-head:
	

test-srfi-13-sagittarius:
	
	sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/13.scm

srfi-13-sagittarius-build-library:
	

test-srfi-13-sagittarius-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:latest bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/13.scm"

srfi-13-sagittarius-build-library-docker:
	

test-srfi-13-sagittarius-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:head bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/13.scm"

srfi-13-sagittarius-build-library-docker-head:
	

test-srfi-13-stklos:
	
	stklos -I . -I ./srfi -f srfi-test/r7rs-programs/13.scm

srfi-13-stklos-build-library:
	

test-srfi-13-stklos-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:latest bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/13.scm"

srfi-13-stklos-build-library-docker:
	

test-srfi-13-stklos-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:head bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/13.scm"

srfi-13-stklos-build-library-docker-head:
	

test-srfi-13-skint:
	
	skint -I ./ srfi-test/r7rs-programs/13.scm

srfi-13-skint-build-library:
	

test-srfi-13-skint-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:latest bash -c "cd workdir && skint -I ./ srfi-test/r7rs-programs/13.scm"

srfi-13-skint-build-library-docker:
	

test-srfi-13-skint-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:head bash -c "cd workdir && skint -I ./ srfi-test/r7rs-programs/13.scm"

srfi-13-skint-build-library-docker-head:
	

test-srfi-13-tr7:
	
	tr7i srfi-test/r7rs-programs/13.scm

srfi-13-tr7-build-library:
	

test-srfi-13-tr7-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:latest bash -c "cd workdir && tr7i srfi-test/r7rs-programs/13.scm"

srfi-13-tr7-build-library-docker:
	

test-srfi-13-tr7-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:head bash -c "cd workdir && tr7i srfi-test/r7rs-programs/13.scm"

srfi-13-tr7-build-library-docker-head:
	

test-srfi-13-ypsilon:
	
	ypsilon --warning --verbose --clean-acc --acc=/tmp --r7rs --loadpath=. srfi-test/r7rs-programs/13.scm

srfi-13-ypsilon-build-library:
	

test-srfi-13-ypsilon-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/ypsilon:latest bash -c "cd workdir && ypsilon --warning --verbose --clean-acc --acc=/tmp --r7rs --loadpath=. srfi-test/r7rs-programs/13.scm"

srfi-13-ypsilon-build-library-docker:
	

test-srfi-13-ypsilon-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/ypsilon:head bash -c "cd workdir && ypsilon --warning --verbose --clean-acc --acc=/tmp --r7rs --loadpath=. srfi-test/r7rs-programs/13.scm"

srfi-13-ypsilon-build-library-docker-head:
	

test-srfi-64-chibi:
	
	chibi-scheme -I . srfi-test/r7rs-programs/64.scm

srfi-64-chibi-build-library:
	

test-srfi-64-chibi-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:latest bash -c "cd workdir && chibi-scheme -I . srfi-test/r7rs-programs/64.scm"

srfi-64-chibi-build-library-docker:
	

test-srfi-64-chibi-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:head bash -c "cd workdir && chibi-scheme -I . srfi-test/r7rs-programs/64.scm"

srfi-64-chibi-build-library-docker-head:
	

test-srfi-64-chicken:
	  cp srfi/64.sld srfi-64.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-64.sld 
	csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/64.scm && srfi-test/r7rs-programs/64 && rm srfi-test/r7rs-programs/64

srfi-64-chicken-build-library:
	  cp srfi/64.sld srfi-64.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-64.sld 

test-srfi-64-chicken-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:latest bash -c "cd workdir &&  cp srfi/64.sld srfi-64.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-64.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:latest bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/64.scm && srfi-test/r7rs-programs/64 && rm srfi-test/r7rs-programs/64"

srfi-64-chicken-build-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:latest bash -c "cd workdir &&  cp srfi/64.sld srfi-64.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-64.sld" 

test-srfi-64-chicken-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:head bash -c "cd workdir &&  cp srfi/64.sld srfi-64.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-64.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:head bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/64.scm && srfi-test/r7rs-programs/64 && rm srfi-test/r7rs-programs/64"

srfi-64-chicken-build-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:head bash -c "cd workdir &&  cp srfi/64.sld srfi-64.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-64.sld" 

test-srfi-64-cyclone:
	 cyclone -I . srfi/64.sld 
	cyclone -I . srfi-test/r7rs-programs/64.scm && srfi-test/r7rs-programs/64 && rm srfi-test/r7rs-programs/64

srfi-64-cyclone-build-library:
	 cyclone -I . srfi/64.sld 

test-srfi-64-cyclone-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:latest bash -c "cd workdir && cyclone -I . srfi/64.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:latest bash -c "cd workdir && cyclone -I . srfi-test/r7rs-programs/64.scm && srfi-test/r7rs-programs/64 && rm srfi-test/r7rs-programs/64"

srfi-64-cyclone-build-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:latest bash -c "cd workdir && cyclone -I . srfi/64.sld" 

test-srfi-64-cyclone-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:head bash -c "cd workdir && cyclone -I . srfi/64.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:head bash -c "cd workdir && cyclone -I . srfi-test/r7rs-programs/64.scm && srfi-test/r7rs-programs/64 && rm srfi-test/r7rs-programs/64"

srfi-64-cyclone-build-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:head bash -c "cd workdir && cyclone -I . srfi/64.sld" 

test-srfi-64-foment:
	
	foment -I --load srfi-test/r7rs-programs/64.scm

srfi-64-foment-build-library:
	

test-srfi-64-foment-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment:latest bash -c "cd workdir && foment -I --load srfi-test/r7rs-programs/64.scm"

srfi-64-foment-build-library-docker:
	

test-srfi-64-foment-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment:head bash -c "cd workdir && foment -I --load srfi-test/r7rs-programs/64.scm"

srfi-64-foment-build-library-docker-head:
	

test-srfi-64-gambit:
	 gsc -:search=. srfi/64 
	gsc -exe ./ -nopreload srfi-test/r7rs-programs/64.scm && srfi-test/r7rs-programs/64 -:search=. && rm srfi-test/r7rs-programs/64

srfi-64-gambit-build-library:
	 gsc -:search=. srfi/64 

test-srfi-64-gambit-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:latest bash -c "cd workdir && gsc -:search=. srfi/64"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:latest bash -c "cd workdir && gsc -exe ./ -nopreload srfi-test/r7rs-programs/64.scm && srfi-test/r7rs-programs/64 -:search=. && rm srfi-test/r7rs-programs/64"

srfi-64-gambit-build-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:latest bash -c "cd workdir && gsc -:search=. srfi/64" 

test-srfi-64-gambit-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:head bash -c "cd workdir && gsc -:search=. srfi/64"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:head bash -c "cd workdir && gsc -exe ./ -nopreload srfi-test/r7rs-programs/64.scm && srfi-test/r7rs-programs/64 -:search=. && rm srfi-test/r7rs-programs/64"

srfi-64-gambit-build-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:head bash -c "cd workdir && gsc -:search=. srfi/64" 

test-srfi-64-gauche:
	
	gosh -r7 -I . srfi-test/r7rs-programs/64.scm

srfi-64-gauche-build-library:
	

test-srfi-64-gauche-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:latest bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/64.scm"

srfi-64-gauche-build-library-docker:
	

test-srfi-64-gauche-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:head bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/64.scm"

srfi-64-gauche-build-library-docker-head:
	

test-srfi-64-gerbil:
	 gxc -O srfi/64.sld 
	gxi --lang r7rs srfi-test/r7rs-programs/64.scm && srfi-test/r7rs-programs/64 && rm srfi-test/r7rs-programs/64

srfi-64-gerbil-build-library:
	 gxc -O srfi/64.sld 

test-srfi-64-gerbil-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil:latest bash -c "cd workdir && gxc -O srfi/64.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil:latest bash -c "cd workdir && gxi --lang r7rs srfi-test/r7rs-programs/64.scm && srfi-test/r7rs-programs/64 && rm srfi-test/r7rs-programs/64"

srfi-64-gerbil-build-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil:latest bash -c "cd workdir && gxc -O srfi/64.sld" 

test-srfi-64-gerbil-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil:head bash -c "cd workdir && gxc -O srfi/64.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil:head bash -c "cd workdir && gxi --lang r7rs srfi-test/r7rs-programs/64.scm && srfi-test/r7rs-programs/64 && rm srfi-test/r7rs-programs/64"

srfi-64-gerbil-build-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil:head bash -c "cd workdir && gxc -O srfi/64.sld" 

test-srfi-64-guile:
	
	guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/64.scm

srfi-64-guile-build-library:
	

test-srfi-64-guile-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:latest bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/64.scm"

srfi-64-guile-build-library-docker:
	

test-srfi-64-guile-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:head bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/64.scm"

srfi-64-guile-build-library-docker-head:
	

test-srfi-64-kawa:
	
	kawa --r7rs -Dkawa.import.path=../.. srfi-test/r7rs-programs/64.scm

srfi-64-kawa-build-library:
	

test-srfi-64-kawa-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:latest bash -c "cd workdir && kawa --r7rs -Dkawa.import.path=../.. srfi-test/r7rs-programs/64.scm"

srfi-64-kawa-build-library-docker:
	

test-srfi-64-kawa-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:head bash -c "cd workdir && kawa --r7rs -Dkawa.import.path=../.. srfi-test/r7rs-programs/64.scm"

srfi-64-kawa-build-library-docker-head:
	

test-srfi-64-larceny:
	
	larceny -r7 -I . srfi-test/r7rs-programs/64.scm

srfi-64-larceny-build-library:
	

test-srfi-64-larceny-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/larceny:latest bash -c "cd workdir && larceny -r7 -I . srfi-test/r7rs-programs/64.scm"

srfi-64-larceny-build-library-docker:
	

test-srfi-64-larceny-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/larceny:head bash -c "cd workdir && larceny -r7 -I . srfi-test/r7rs-programs/64.scm"

srfi-64-larceny-build-library-docker-head:
	

test-srfi-64-loko:
	 ls srfi/64.sld 
	loko -std=r7rs --compile srfi-test/r7rs-programs/64.scm && srfi-test/r7rs-programs/64 && rm srfi-test/r7rs-programs/64

srfi-64-loko-build-library:
	 ls srfi/64.sld 

test-srfi-64-loko-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && ls srfi/64.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/64.scm && srfi-test/r7rs-programs/64 && rm srfi-test/r7rs-programs/64"

srfi-64-loko-build-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && ls srfi/64.sld" 

test-srfi-64-loko-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:head bash -c "cd workdir && ls srfi/64.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko:head bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/64.scm && srfi-test/r7rs-programs/64 && rm srfi-test/r7rs-programs/64"

srfi-64-loko-build-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:head bash -c "cd workdir && ls srfi/64.sld" 

test-srfi-64-mit-scheme:
	
	mit-scheme --load srfi-test/r7rs-programs/64.scm

srfi-64-mit-scheme-build-library:
	

test-srfi-64-mit-scheme-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --load srfi-test/r7rs-programs/64.scm"

srfi-64-mit-scheme-build-library-docker:
	

test-srfi-64-mit-scheme-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:head bash -c "cd workdir && mit-scheme --load srfi-test/r7rs-programs/64.scm"

srfi-64-mit-scheme-build-library-docker-head:
	

test-srfi-64-mosh:
	
	mosh --loadpath=. srfi-test/r7rs-programs/64.scm

srfi-64-mosh-build-library:
	

test-srfi-64-mosh-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mosh:latest bash -c "cd workdir && mosh --loadpath=. srfi-test/r7rs-programs/64.scm"

srfi-64-mosh-build-library-docker:
	

test-srfi-64-mosh-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mosh:head bash -c "cd workdir && mosh --loadpath=. srfi-test/r7rs-programs/64.scm"

srfi-64-mosh-build-library-docker-head:
	

test-srfi-64-racket:
	
	racket -I r7rs -S . --script srfi-test/r7rs-programs/64.scm

srfi-64-racket-build-library:
	

test-srfi-64-racket-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:latest bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/64.scm"

srfi-64-racket-build-library-docker:
	

test-srfi-64-racket-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:head bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/64.scm"

srfi-64-racket-build-library-docker-head:
	

test-srfi-64-sagittarius:
	
	sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/64.scm

srfi-64-sagittarius-build-library:
	

test-srfi-64-sagittarius-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:latest bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/64.scm"

srfi-64-sagittarius-build-library-docker:
	

test-srfi-64-sagittarius-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:head bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/64.scm"

srfi-64-sagittarius-build-library-docker-head:
	

test-srfi-64-stklos:
	
	stklos -I . -I ./srfi -f srfi-test/r7rs-programs/64.scm

srfi-64-stklos-build-library:
	

test-srfi-64-stklos-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:latest bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/64.scm"

srfi-64-stklos-build-library-docker:
	

test-srfi-64-stklos-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:head bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/64.scm"

srfi-64-stklos-build-library-docker-head:
	

test-srfi-64-skint:
	
	skint -I ./ srfi-test/r7rs-programs/64.scm

srfi-64-skint-build-library:
	

test-srfi-64-skint-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:latest bash -c "cd workdir && skint -I ./ srfi-test/r7rs-programs/64.scm"

srfi-64-skint-build-library-docker:
	

test-srfi-64-skint-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:head bash -c "cd workdir && skint -I ./ srfi-test/r7rs-programs/64.scm"

srfi-64-skint-build-library-docker-head:
	

test-srfi-64-tr7:
	
	tr7i srfi-test/r7rs-programs/64.scm

srfi-64-tr7-build-library:
	

test-srfi-64-tr7-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:latest bash -c "cd workdir && tr7i srfi-test/r7rs-programs/64.scm"

srfi-64-tr7-build-library-docker:
	

test-srfi-64-tr7-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:head bash -c "cd workdir && tr7i srfi-test/r7rs-programs/64.scm"

srfi-64-tr7-build-library-docker-head:
	

test-srfi-64-ypsilon:
	
	ypsilon --warning --verbose --clean-acc --acc=/tmp --r7rs --loadpath=. srfi-test/r7rs-programs/64.scm

srfi-64-ypsilon-build-library:
	

test-srfi-64-ypsilon-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/ypsilon:latest bash -c "cd workdir && ypsilon --warning --verbose --clean-acc --acc=/tmp --r7rs --loadpath=. srfi-test/r7rs-programs/64.scm"

srfi-64-ypsilon-build-library-docker:
	

test-srfi-64-ypsilon-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/ypsilon:head bash -c "cd workdir && ypsilon --warning --verbose --clean-acc --acc=/tmp --r7rs --loadpath=. srfi-test/r7rs-programs/64.scm"

srfi-64-ypsilon-build-library-docker-head:
	

test-srfi-151-chibi:
	
	chibi-scheme -I . srfi-test/r7rs-programs/151.scm

srfi-151-chibi-build-library:
	

test-srfi-151-chibi-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:latest bash -c "cd workdir && chibi-scheme -I . srfi-test/r7rs-programs/151.scm"

srfi-151-chibi-build-library-docker:
	

test-srfi-151-chibi-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:head bash -c "cd workdir && chibi-scheme -I . srfi-test/r7rs-programs/151.scm"

srfi-151-chibi-build-library-docker-head:
	

test-srfi-151-chicken:
	  cp srfi/151.sld srfi-151.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-151.sld 
	csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/151.scm && srfi-test/r7rs-programs/151 && rm srfi-test/r7rs-programs/151

srfi-151-chicken-build-library:
	  cp srfi/151.sld srfi-151.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-151.sld 

test-srfi-151-chicken-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:latest bash -c "cd workdir &&  cp srfi/151.sld srfi-151.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-151.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:latest bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/151.scm && srfi-test/r7rs-programs/151 && rm srfi-test/r7rs-programs/151"

srfi-151-chicken-build-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:latest bash -c "cd workdir &&  cp srfi/151.sld srfi-151.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-151.sld" 

test-srfi-151-chicken-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:head bash -c "cd workdir &&  cp srfi/151.sld srfi-151.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-151.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:head bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/151.scm && srfi-test/r7rs-programs/151 && rm srfi-test/r7rs-programs/151"

srfi-151-chicken-build-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:head bash -c "cd workdir &&  cp srfi/151.sld srfi-151.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-151.sld" 

test-srfi-151-cyclone:
	 cyclone -I . srfi/151.sld 
	cyclone -I . srfi-test/r7rs-programs/151.scm && srfi-test/r7rs-programs/151 && rm srfi-test/r7rs-programs/151

srfi-151-cyclone-build-library:
	 cyclone -I . srfi/151.sld 

test-srfi-151-cyclone-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:latest bash -c "cd workdir && cyclone -I . srfi/151.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:latest bash -c "cd workdir && cyclone -I . srfi-test/r7rs-programs/151.scm && srfi-test/r7rs-programs/151 && rm srfi-test/r7rs-programs/151"

srfi-151-cyclone-build-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:latest bash -c "cd workdir && cyclone -I . srfi/151.sld" 

test-srfi-151-cyclone-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:head bash -c "cd workdir && cyclone -I . srfi/151.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:head bash -c "cd workdir && cyclone -I . srfi-test/r7rs-programs/151.scm && srfi-test/r7rs-programs/151 && rm srfi-test/r7rs-programs/151"

srfi-151-cyclone-build-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:head bash -c "cd workdir && cyclone -I . srfi/151.sld" 

test-srfi-151-foment:
	
	foment -I --load srfi-test/r7rs-programs/151.scm

srfi-151-foment-build-library:
	

test-srfi-151-foment-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment:latest bash -c "cd workdir && foment -I --load srfi-test/r7rs-programs/151.scm"

srfi-151-foment-build-library-docker:
	

test-srfi-151-foment-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/foment:head bash -c "cd workdir && foment -I --load srfi-test/r7rs-programs/151.scm"

srfi-151-foment-build-library-docker-head:
	

test-srfi-151-gambit:
	 gsc -:search=. srfi/151 
	gsc -exe ./ -nopreload srfi-test/r7rs-programs/151.scm && srfi-test/r7rs-programs/151 -:search=. && rm srfi-test/r7rs-programs/151

srfi-151-gambit-build-library:
	 gsc -:search=. srfi/151 

test-srfi-151-gambit-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:latest bash -c "cd workdir && gsc -:search=. srfi/151"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:latest bash -c "cd workdir && gsc -exe ./ -nopreload srfi-test/r7rs-programs/151.scm && srfi-test/r7rs-programs/151 -:search=. && rm srfi-test/r7rs-programs/151"

srfi-151-gambit-build-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:latest bash -c "cd workdir && gsc -:search=. srfi/151" 

test-srfi-151-gambit-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:head bash -c "cd workdir && gsc -:search=. srfi/151"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:head bash -c "cd workdir && gsc -exe ./ -nopreload srfi-test/r7rs-programs/151.scm && srfi-test/r7rs-programs/151 -:search=. && rm srfi-test/r7rs-programs/151"

srfi-151-gambit-build-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:head bash -c "cd workdir && gsc -:search=. srfi/151" 

test-srfi-151-gauche:
	
	gosh -r7 -I . srfi-test/r7rs-programs/151.scm

srfi-151-gauche-build-library:
	

test-srfi-151-gauche-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:latest bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/151.scm"

srfi-151-gauche-build-library-docker:
	

test-srfi-151-gauche-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:head bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/151.scm"

srfi-151-gauche-build-library-docker-head:
	

test-srfi-151-gerbil:
	 gxc -O srfi/151.sld 
	gxi --lang r7rs srfi-test/r7rs-programs/151.scm && srfi-test/r7rs-programs/151 && rm srfi-test/r7rs-programs/151

srfi-151-gerbil-build-library:
	 gxc -O srfi/151.sld 

test-srfi-151-gerbil-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil:latest bash -c "cd workdir && gxc -O srfi/151.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil:latest bash -c "cd workdir && gxi --lang r7rs srfi-test/r7rs-programs/151.scm && srfi-test/r7rs-programs/151 && rm srfi-test/r7rs-programs/151"

srfi-151-gerbil-build-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil:latest bash -c "cd workdir && gxc -O srfi/151.sld" 

test-srfi-151-gerbil-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil:head bash -c "cd workdir && gxc -O srfi/151.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil:head bash -c "cd workdir && gxi --lang r7rs srfi-test/r7rs-programs/151.scm && srfi-test/r7rs-programs/151 && rm srfi-test/r7rs-programs/151"

srfi-151-gerbil-build-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/gerbil:head bash -c "cd workdir && gxc -O srfi/151.sld" 

test-srfi-151-guile:
	
	guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/151.scm

srfi-151-guile-build-library:
	

test-srfi-151-guile-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:latest bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/151.scm"

srfi-151-guile-build-library-docker:
	

test-srfi-151-guile-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:head bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/151.scm"

srfi-151-guile-build-library-docker-head:
	

test-srfi-151-kawa:
	
	kawa --r7rs -Dkawa.import.path=../.. srfi-test/r7rs-programs/151.scm

srfi-151-kawa-build-library:
	

test-srfi-151-kawa-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:latest bash -c "cd workdir && kawa --r7rs -Dkawa.import.path=../.. srfi-test/r7rs-programs/151.scm"

srfi-151-kawa-build-library-docker:
	

test-srfi-151-kawa-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:head bash -c "cd workdir && kawa --r7rs -Dkawa.import.path=../.. srfi-test/r7rs-programs/151.scm"

srfi-151-kawa-build-library-docker-head:
	

test-srfi-151-larceny:
	
	larceny -r7 -I . srfi-test/r7rs-programs/151.scm

srfi-151-larceny-build-library:
	

test-srfi-151-larceny-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/larceny:latest bash -c "cd workdir && larceny -r7 -I . srfi-test/r7rs-programs/151.scm"

srfi-151-larceny-build-library-docker:
	

test-srfi-151-larceny-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/larceny:head bash -c "cd workdir && larceny -r7 -I . srfi-test/r7rs-programs/151.scm"

srfi-151-larceny-build-library-docker-head:
	

test-srfi-151-loko:
	 ls srfi/151.sld 
	loko -std=r7rs --compile srfi-test/r7rs-programs/151.scm && srfi-test/r7rs-programs/151 && rm srfi-test/r7rs-programs/151

srfi-151-loko-build-library:
	 ls srfi/151.sld 

test-srfi-151-loko-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && ls srfi/151.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/151.scm && srfi-test/r7rs-programs/151 && rm srfi-test/r7rs-programs/151"

srfi-151-loko-build-library-docker:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && ls srfi/151.sld" 

test-srfi-151-loko-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:head bash -c "cd workdir && ls srfi/151.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko:head bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/151.scm && srfi-test/r7rs-programs/151 && rm srfi-test/r7rs-programs/151"

srfi-151-loko-build-library-docker-head:
	docker run -it -v ${PWD}:/workdir:z schemers/loko:head bash -c "cd workdir && ls srfi/151.sld" 

test-srfi-151-mit-scheme:
	
	mit-scheme --load srfi-test/r7rs-programs/151.scm

srfi-151-mit-scheme-build-library:
	

test-srfi-151-mit-scheme-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --load srfi-test/r7rs-programs/151.scm"

srfi-151-mit-scheme-build-library-docker:
	

test-srfi-151-mit-scheme-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:head bash -c "cd workdir && mit-scheme --load srfi-test/r7rs-programs/151.scm"

srfi-151-mit-scheme-build-library-docker-head:
	

test-srfi-151-mosh:
	
	mosh --loadpath=. srfi-test/r7rs-programs/151.scm

srfi-151-mosh-build-library:
	

test-srfi-151-mosh-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mosh:latest bash -c "cd workdir && mosh --loadpath=. srfi-test/r7rs-programs/151.scm"

srfi-151-mosh-build-library-docker:
	

test-srfi-151-mosh-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mosh:head bash -c "cd workdir && mosh --loadpath=. srfi-test/r7rs-programs/151.scm"

srfi-151-mosh-build-library-docker-head:
	

test-srfi-151-racket:
	
	racket -I r7rs -S . --script srfi-test/r7rs-programs/151.scm

srfi-151-racket-build-library:
	

test-srfi-151-racket-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:latest bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/151.scm"

srfi-151-racket-build-library-docker:
	

test-srfi-151-racket-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:head bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/151.scm"

srfi-151-racket-build-library-docker-head:
	

test-srfi-151-sagittarius:
	
	sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/151.scm

srfi-151-sagittarius-build-library:
	

test-srfi-151-sagittarius-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:latest bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/151.scm"

srfi-151-sagittarius-build-library-docker:
	

test-srfi-151-sagittarius-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:head bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/151.scm"

srfi-151-sagittarius-build-library-docker-head:
	

test-srfi-151-stklos:
	
	stklos -I . -I ./srfi -f srfi-test/r7rs-programs/151.scm

srfi-151-stklos-build-library:
	

test-srfi-151-stklos-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:latest bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/151.scm"

srfi-151-stklos-build-library-docker:
	

test-srfi-151-stklos-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:head bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/151.scm"

srfi-151-stklos-build-library-docker-head:
	

test-srfi-151-skint:
	
	skint -I ./ srfi-test/r7rs-programs/151.scm

srfi-151-skint-build-library:
	

test-srfi-151-skint-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:latest bash -c "cd workdir && skint -I ./ srfi-test/r7rs-programs/151.scm"

srfi-151-skint-build-library-docker:
	

test-srfi-151-skint-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:head bash -c "cd workdir && skint -I ./ srfi-test/r7rs-programs/151.scm"

srfi-151-skint-build-library-docker-head:
	

test-srfi-151-tr7:
	
	tr7i srfi-test/r7rs-programs/151.scm

srfi-151-tr7-build-library:
	

test-srfi-151-tr7-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:latest bash -c "cd workdir && tr7i srfi-test/r7rs-programs/151.scm"

srfi-151-tr7-build-library-docker:
	

test-srfi-151-tr7-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:head bash -c "cd workdir && tr7i srfi-test/r7rs-programs/151.scm"

srfi-151-tr7-build-library-docker-head:
	

test-srfi-151-ypsilon:
	
	ypsilon --warning --verbose --clean-acc --acc=/tmp --r7rs --loadpath=. srfi-test/r7rs-programs/151.scm

srfi-151-ypsilon-build-library:
	

test-srfi-151-ypsilon-docker:
	
	docker run -it -v ${PWD}:/workdir:z schemers/ypsilon:latest bash -c "cd workdir && ypsilon --warning --verbose --clean-acc --acc=/tmp --r7rs --loadpath=. srfi-test/r7rs-programs/151.scm"

srfi-151-ypsilon-build-library-docker:
	

test-srfi-151-ypsilon-docker-head:
	
	docker run -it -v ${PWD}:/workdir:z schemers/ypsilon:head bash -c "cd workdir && ypsilon --warning --verbose --clean-acc --acc=/tmp --r7rs --loadpath=. srfi-test/r7rs-programs/151.scm"

srfi-151-ypsilon-build-library-docker-head:
	


