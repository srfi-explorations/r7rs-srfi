test-64-chibi:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:latest bash -c "cd workdir && chibi-scheme -I ./srfi srfi-test/r7rs-programs/64.scm"

test-64-chibi-head:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:head bash -c "cd workdir && chibi-scheme -I ./srfi srfi-test/r7rs-programs/64.scm"

test-64-chicken:
	make clean
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:latest bash -c "cd workdir &&  cp srfi/64.sld srfi-64.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-64.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:latest bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/64.scm && srfi-test/r7rs-programs/64 && rm srfi-test/r7rs-programs/64"

test-64-chicken-head:
	make clean
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:head bash -c "cd workdir &&  cp srfi/64.sld srfi-64.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-64.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:head bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/64.scm && srfi-test/r7rs-programs/64 && rm srfi-test/r7rs-programs/64"

test-64-cyclone:
	make clean
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:latest bash -c "cd workdir && cyclone -A . srfi/64.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:latest bash -c "cd workdir && cyclone -A . srfi-test/r7rs-programs/64.scm && srfi-test/r7rs-programs/64 && rm srfi-test/r7rs-programs/64"

test-64-cyclone-head:
	make clean
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:head bash -c "cd workdir && cyclone -A . srfi/64.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:head bash -c "cd workdir && cyclone -A . srfi-test/r7rs-programs/64.scm && srfi-test/r7rs-programs/64 && rm srfi-test/r7rs-programs/64"

test-64-gambit:
	make clean
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:latest bash -c "cd workdir && gsc . srfi/64"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:latest bash -c "cd workdir && gsc -:r7rs -exe . -nopreload srfi-test/r7rs-programs/64.scm && srfi-test/r7rs-programs/64 && rm srfi-test/r7rs-programs/64"

test-64-gambit-head:
	make clean
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:head bash -c "cd workdir && gsc . srfi/64"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:head bash -c "cd workdir && gsc -:r7rs -exe . -nopreload srfi-test/r7rs-programs/64.scm && srfi-test/r7rs-programs/64 && rm srfi-test/r7rs-programs/64"

test-64-gauche:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:latest bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/64.scm"

test-64-gauche-head:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:head bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/64.scm"

test-64-guile:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:latest bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/64.scm"

test-64-guile-head:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:head bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/64.scm"

test-64-kawa:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:latest bash -c "cd workdir && kawa --r7rs -Dkawa.import.path=.:./srfi/*.sld:..:../srfi/*.sld srfi-test/r7rs-programs/64.scm"

test-64-kawa-head:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:head bash -c "cd workdir && kawa --r7rs -Dkawa.import.path=.:./srfi/*.sld:..:../srfi/*.sld srfi-test/r7rs-programs/64.scm"

test-64-loko:
	make clean
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && ls srfi/64.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/64.scm && srfi-test/r7rs-programs/64 && rm srfi-test/r7rs-programs/64"

test-64-loko-head:
	make clean
	docker run -it -v ${PWD}:/workdir:z schemers/loko:head bash -c "cd workdir && ls srfi/64.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko:head bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/64.scm && srfi-test/r7rs-programs/64 && rm srfi-test/r7rs-programs/64"

test-64-mit-scheme:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --load srfi-test/r7rs-programs/64.scm"

test-64-mit-scheme-head:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:head bash -c "cd workdir && mit-scheme --load srfi-test/r7rs-programs/64.scm"

test-64-racket:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:latest bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/64.scm"

test-64-racket-head:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:head bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/64.scm"

test-64-sagittarius:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:latest bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/64.scm"

test-64-sagittarius-head:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:head bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/64.scm"

test-64-stklos:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:latest bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/64.scm"

test-64-stklos-head:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:head bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/64.scm"

test-64-skint:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:latest bash -c "cd workdir && skint --program srfi-test/r7rs-programs/64.scm"

test-64-skint-head:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:head bash -c "cd workdir && skint --program srfi-test/r7rs-programs/64.scm"

test-64-tr7:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:latest bash -c "cd workdir && tr7i srfi-test/r7rs-programs/64.scm"

test-64-tr7-head:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:head bash -c "cd workdir && tr7i srfi-test/r7rs-programs/64.scm"

test-8-chibi:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:latest bash -c "cd workdir && chibi-scheme -I ./srfi srfi-test/r7rs-programs/8.scm"

test-8-chibi-head:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:head bash -c "cd workdir && chibi-scheme -I ./srfi srfi-test/r7rs-programs/8.scm"

test-8-chicken:
	make clean
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:latest bash -c "cd workdir &&  cp srfi/8.sld srfi-8.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-8.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:latest bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/8.scm && srfi-test/r7rs-programs/8 && rm srfi-test/r7rs-programs/8"

test-8-chicken-head:
	make clean
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:head bash -c "cd workdir &&  cp srfi/8.sld srfi-8.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-8.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:head bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/8.scm && srfi-test/r7rs-programs/8 && rm srfi-test/r7rs-programs/8"

test-8-cyclone:
	make clean
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:latest bash -c "cd workdir && cyclone -A . srfi/8.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:latest bash -c "cd workdir && cyclone -A . srfi-test/r7rs-programs/8.scm && srfi-test/r7rs-programs/8 && rm srfi-test/r7rs-programs/8"

test-8-cyclone-head:
	make clean
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:head bash -c "cd workdir && cyclone -A . srfi/8.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:head bash -c "cd workdir && cyclone -A . srfi-test/r7rs-programs/8.scm && srfi-test/r7rs-programs/8 && rm srfi-test/r7rs-programs/8"

test-8-gambit:
	make clean
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:latest bash -c "cd workdir && gsc . srfi/8"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:latest bash -c "cd workdir && gsc -:r7rs -exe . -nopreload srfi-test/r7rs-programs/8.scm && srfi-test/r7rs-programs/8 && rm srfi-test/r7rs-programs/8"

test-8-gambit-head:
	make clean
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:head bash -c "cd workdir && gsc . srfi/8"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:head bash -c "cd workdir && gsc -:r7rs -exe . -nopreload srfi-test/r7rs-programs/8.scm && srfi-test/r7rs-programs/8 && rm srfi-test/r7rs-programs/8"

test-8-gauche:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:latest bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/8.scm"

test-8-gauche-head:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:head bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/8.scm"

test-8-guile:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:latest bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/8.scm"

test-8-guile-head:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:head bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/8.scm"

test-8-kawa:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:latest bash -c "cd workdir && kawa --r7rs -Dkawa.import.path=.:./srfi/*.sld:..:../srfi/*.sld srfi-test/r7rs-programs/8.scm"

test-8-kawa-head:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:head bash -c "cd workdir && kawa --r7rs -Dkawa.import.path=.:./srfi/*.sld:..:../srfi/*.sld srfi-test/r7rs-programs/8.scm"

test-8-loko:
	make clean
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && ls srfi/8.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/8.scm && srfi-test/r7rs-programs/8 && rm srfi-test/r7rs-programs/8"

test-8-loko-head:
	make clean
	docker run -it -v ${PWD}:/workdir:z schemers/loko:head bash -c "cd workdir && ls srfi/8.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko:head bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/8.scm && srfi-test/r7rs-programs/8 && rm srfi-test/r7rs-programs/8"

test-8-mit-scheme:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --load srfi-test/r7rs-programs/8.scm"

test-8-mit-scheme-head:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:head bash -c "cd workdir && mit-scheme --load srfi-test/r7rs-programs/8.scm"

test-8-racket:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:latest bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/8.scm"

test-8-racket-head:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:head bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/8.scm"

test-8-sagittarius:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:latest bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/8.scm"

test-8-sagittarius-head:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:head bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/8.scm"

test-8-stklos:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:latest bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/8.scm"

test-8-stklos-head:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:head bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/8.scm"

test-8-skint:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:latest bash -c "cd workdir && skint --program srfi-test/r7rs-programs/8.scm"

test-8-skint-head:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:head bash -c "cd workdir && skint --program srfi-test/r7rs-programs/8.scm"

test-8-tr7:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:latest bash -c "cd workdir && tr7i srfi-test/r7rs-programs/8.scm"

test-8-tr7-head:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:head bash -c "cd workdir && tr7i srfi-test/r7rs-programs/8.scm"

test-1-chibi:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:latest bash -c "cd workdir && chibi-scheme -I ./srfi srfi-test/r7rs-programs/1.scm"

test-1-chibi-head:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi:head bash -c "cd workdir && chibi-scheme -I ./srfi srfi-test/r7rs-programs/1.scm"

test-1-chicken:
	make clean
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:latest bash -c "cd workdir &&  cp srfi/1.sld srfi-1.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-1.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:latest bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/1.scm && srfi-test/r7rs-programs/1 && rm srfi-test/r7rs-programs/1"

test-1-chicken-head:
	make clean
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:head bash -c "cd workdir &&  cp srfi/1.sld srfi-1.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-1.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken:head bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/1.scm && srfi-test/r7rs-programs/1 && rm srfi-test/r7rs-programs/1"

test-1-cyclone:
	make clean
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:latest bash -c "cd workdir && cyclone -A . srfi/1.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:latest bash -c "cd workdir && cyclone -A . srfi-test/r7rs-programs/1.scm && srfi-test/r7rs-programs/1 && rm srfi-test/r7rs-programs/1"

test-1-cyclone-head:
	make clean
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:head bash -c "cd workdir && cyclone -A . srfi/1.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone:head bash -c "cd workdir && cyclone -A . srfi-test/r7rs-programs/1.scm && srfi-test/r7rs-programs/1 && rm srfi-test/r7rs-programs/1"

test-1-gambit:
	make clean
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:latest bash -c "cd workdir && gsc . srfi/1"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:latest bash -c "cd workdir && gsc -:r7rs -exe . -nopreload srfi-test/r7rs-programs/1.scm && srfi-test/r7rs-programs/1 && rm srfi-test/r7rs-programs/1"

test-1-gambit-head:
	make clean
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:head bash -c "cd workdir && gsc . srfi/1"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit:head bash -c "cd workdir && gsc -:r7rs -exe . -nopreload srfi-test/r7rs-programs/1.scm && srfi-test/r7rs-programs/1 && rm srfi-test/r7rs-programs/1"

test-1-gauche:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:latest bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/1.scm"

test-1-gauche-head:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche:head bash -c "cd workdir && gosh -r7 -I . srfi-test/r7rs-programs/1.scm"

test-1-guile:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:latest bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/1.scm"

test-1-guile-head:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile:head bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/1.scm"

test-1-kawa:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:latest bash -c "cd workdir && kawa --r7rs -Dkawa.import.path=.:./srfi/*.sld:..:../srfi/*.sld srfi-test/r7rs-programs/1.scm"

test-1-kawa-head:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa:head bash -c "cd workdir && kawa --r7rs -Dkawa.import.path=.:./srfi/*.sld:..:../srfi/*.sld srfi-test/r7rs-programs/1.scm"

test-1-loko:
	make clean
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && ls srfi/1.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko:latest bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/1.scm && srfi-test/r7rs-programs/1 && rm srfi-test/r7rs-programs/1"

test-1-loko-head:
	make clean
	docker run -it -v ${PWD}:/workdir:z schemers/loko:head bash -c "cd workdir && ls srfi/1.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko:head bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/1.scm && srfi-test/r7rs-programs/1 && rm srfi-test/r7rs-programs/1"

test-1-mit-scheme:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:latest bash -c "cd workdir && mit-scheme --load srfi-test/r7rs-programs/1.scm"

test-1-mit-scheme-head:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme:head bash -c "cd workdir && mit-scheme --load srfi-test/r7rs-programs/1.scm"

test-1-racket:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:latest bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/1.scm"

test-1-racket-head:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket:head bash -c "cd workdir && racket -I r7rs -S . --script srfi-test/r7rs-programs/1.scm"

test-1-sagittarius:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:latest bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/1.scm"

test-1-sagittarius-head:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius:head bash -c "cd workdir && sash -r7 -L . -L ./srfi srfi-test/r7rs-programs/1.scm"

test-1-stklos:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:latest bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/1.scm"

test-1-stklos-head:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos:head bash -c "cd workdir && stklos -I . -I ./srfi -f srfi-test/r7rs-programs/1.scm"

test-1-skint:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:latest bash -c "cd workdir && skint --program srfi-test/r7rs-programs/1.scm"

test-1-skint-head:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint:head bash -c "cd workdir && skint --program srfi-test/r7rs-programs/1.scm"

test-1-tr7:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:latest bash -c "cd workdir && tr7i srfi-test/r7rs-programs/1.scm"

test-1-tr7-head:
	make clean
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7:head bash -c "cd workdir && tr7i srfi-test/r7rs-programs/1.scm"

clean:
	find . -name "*.so" -delete
	find . -name "*.c" -delete
	find . -name "*.o*" -delete
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

