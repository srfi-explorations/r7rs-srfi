test-chibi-srfi-11:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi bash -c "cd workdir && (cd srfi-test && chibi-scheme -I . convert.scm) && chibi-scheme -I . srfi-test/chibi/11.scm"

test-chicken-srfi-11:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/11.sld srfi-11.sld ; csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-11.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-test/11"

test-cyclone-srfi-11:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/11.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi-test/11"

test-gambit-srfi-11:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsc srfi/11.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsc srfi-test/11"

test-gauche-srfi-11:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche bash -c "cd workdir && (cd srfi-test && gosh convert.scm) && gosh srfi-test/gauche/11.scm"

test-guile-srfi-11:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile bash -c "cd workdir && (cd srfi-test && guile --fresh-auto-compile --r7rs -L . convert.scm) && guile --fresh-auto-compile --r7rs -L . srfi-test/guile/11.scm"

test-kawa-srfi-11:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa bash -c "cd workdir && (cd srfi-test && kawa convert.scm) && kawa srfi-test/kawa/11.scm"

test-loko-srfi-11:
	
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && (cd srfi-test && loko -std=r7rs -feval --compile convert.scm) && loko -std=r7rs -feval --compile srfi-test/loko/11.scm"

test-mit-scheme-srfi-11:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme bash -c "cd workdir && (cd srfi-test && mit-scheme --load convert.scm) && mit-scheme --load srfi-test/mit-scheme/11.scm"

test-racket-srfi-11:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket bash -c "cd workdir && (cd srfi-test && racket -I r7rs --make -S . --script convert.scm) && racket -I r7rs --make -S . --script srfi-test/racket/11.scm"

test-sagittarius-srfi-11:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius bash -c "cd workdir && (cd srfi-test && sash convert.scm) && sash srfi-test/sagittarius/11.scm"

test-stklos-srfi-11:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos bash -c "cd workdir && (cd srfi-test && stklos -I . convert.scm) && stklos -I . srfi-test/stklos/11.scm"

test-tr7-srfi-11:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7 bash -c "cd workdir && (cd srfi-test && tr7i convert.scm) && tr7i srfi-test/tr7/11.scm"

test-chibi-srfi-64:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi bash -c "cd workdir && (cd srfi-test && chibi-scheme -I . convert.scm) && chibi-scheme -I . srfi-test/chibi/64.scm"

test-chicken-srfi-64:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/64.sld srfi-64.sld ; csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-64.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-test/64"

test-cyclone-srfi-64:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/64.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi-test/64"

test-gambit-srfi-64:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsc srfi/64.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsc srfi-test/64"

test-gauche-srfi-64:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche bash -c "cd workdir && (cd srfi-test && gosh convert.scm) && gosh srfi-test/gauche/64.scm"

test-guile-srfi-64:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile bash -c "cd workdir && (cd srfi-test && guile --fresh-auto-compile --r7rs -L . convert.scm) && guile --fresh-auto-compile --r7rs -L . srfi-test/guile/64.scm"

test-kawa-srfi-64:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa bash -c "cd workdir && (cd srfi-test && kawa convert.scm) && kawa srfi-test/kawa/64.scm"

test-loko-srfi-64:
	
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && (cd srfi-test && loko -std=r7rs -feval --compile convert.scm) && loko -std=r7rs -feval --compile srfi-test/loko/64.scm"

test-mit-scheme-srfi-64:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme bash -c "cd workdir && (cd srfi-test && mit-scheme --load convert.scm) && mit-scheme --load srfi-test/mit-scheme/64.scm"

test-racket-srfi-64:
	
	docker run -it -v ${PWD}:/workdir:z schemers/racket bash -c "cd workdir && (cd srfi-test && racket -I r7rs --make -S . --script convert.scm) && racket -I r7rs --make -S . --script srfi-test/racket/64.scm"

test-sagittarius-srfi-64:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius bash -c "cd workdir && (cd srfi-test && sash convert.scm) && sash srfi-test/sagittarius/64.scm"

test-stklos-srfi-64:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos bash -c "cd workdir && (cd srfi-test && stklos -I . convert.scm) && stklos -I . srfi-test/stklos/64.scm"

test-tr7-srfi-64:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7 bash -c "cd workdir && (cd srfi-test && tr7i convert.scm) && tr7i srfi-test/tr7/64.scm"

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

