test-chibi-srfi-8:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi bash -c "cd workdir && chibi-scheme -I ./srfi srfi-test/r7rs-programs/8.scm"


test-chicken-srfi-8:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/64.sld srfi-64.sld &amp;&amp; csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-64.sld  &amp;&amp; cp srfi/8.sld srfi-8.sld &amp;&amp; csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-8.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/8.scm &amp;&amp; srfi-test/r7rs-programs/8 &amp;&amp; rm srfi-test/r7rs-programs/8"


test-cyclone-srfi-8:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/64.sld  &amp;&amp; cyclone -I . srfi/8.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi-test/r7rs-programs/8.scm &amp;&amp; srfi-test/r7rs-programs/8 &amp;&amp; rm srfi-test/r7rs-programs/8"


test-gambit-srfi-8:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsc -:r7rs -dynamic srfi/64.sld  &amp;&amp; gsc -:r7rs -dynamic srfi/8.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsi -:r7rs8 srfi-test/r7rs-programs/8.scm &amp;&amp; srfi-test/r7rs-programs/8 &amp;&amp; rm srfi-test/r7rs-programs/8"


test-gauche-srfi-8:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche bash -c "cd workdir && gosh srfi-test/r7rs-programs/8.scm"


test-guile-srfi-8:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/8.scm"


test-kawa-srfi-8:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa bash -c "cd workdir && kawa --r7rs -Dkawa.import.path=..:*.sld srfi-test/r7rs-programs/8.scm"


test-loko-srfi-8:
	
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && loko -std=r7rs -feval --compile srfi-test/r7rs-programs/8.scm"


test-mit-scheme-srfi-8:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme bash -c "cd workdir && mit-scheme --load srfi-test/r7rs-programs/8.scm"


test-sagittarius-srfi-8:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius bash -c "cd workdir && sash -r7 -I  ./srfi srfi-test/r7rs-programs/8.scm"


test-stklos-srfi-8:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos bash -c "cd workdir && stklos -I . srfi-test/r7rs-programs/8.scm"


test-skint-srfi-8:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint bash -c "cd workdir && skint --program srfi-test/r7rs-programs/8.scm"


test-tr7-srfi-8:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7 bash -c "cd workdir && tr7i srfi-test/r7rs-programs/8.scm"


test-chibi-srfi-64:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi bash -c "cd workdir && chibi-scheme -I ./srfi srfi-test/r7rs-programs/64.scm"


test-chicken-srfi-64:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && cp srfi/64.sld srfi-64.sld &amp;&amp; csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-64.sld  &amp;&amp; cp srfi/64.sld srfi-64.sld &amp;&amp; csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-64.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/64.scm &amp;&amp; srfi-test/r7rs-programs/64 &amp;&amp; rm srfi-test/r7rs-programs/64"


test-cyclone-srfi-64:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi/64.sld  &amp;&amp; cyclone -I . srfi/64.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -I . srfi-test/r7rs-programs/64.scm &amp;&amp; srfi-test/r7rs-programs/64 &amp;&amp; rm srfi-test/r7rs-programs/64"


test-gambit-srfi-64:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsc -:r7rs -dynamic srfi/64.sld  &amp;&amp; gsc -:r7rs -dynamic srfi/64.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsi -:r7rs64 srfi-test/r7rs-programs/64.scm &amp;&amp; srfi-test/r7rs-programs/64 &amp;&amp; rm srfi-test/r7rs-programs/64"


test-gauche-srfi-64:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche bash -c "cd workdir && gosh srfi-test/r7rs-programs/64.scm"


test-guile-srfi-64:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/64.scm"


test-kawa-srfi-64:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa bash -c "cd workdir && kawa --r7rs -Dkawa.import.path=..:*.sld srfi-test/r7rs-programs/64.scm"


test-loko-srfi-64:
	
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && loko -std=r7rs -feval --compile srfi-test/r7rs-programs/64.scm"


test-mit-scheme-srfi-64:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme bash -c "cd workdir && mit-scheme --load srfi-test/r7rs-programs/64.scm"


test-sagittarius-srfi-64:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius bash -c "cd workdir && sash -r7 -I  ./srfi srfi-test/r7rs-programs/64.scm"


test-stklos-srfi-64:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos bash -c "cd workdir && stklos -I . srfi-test/r7rs-programs/64.scm"


test-skint-srfi-64:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint bash -c "cd workdir && skint --program srfi-test/r7rs-programs/64.scm"


test-tr7-srfi-64:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7 bash -c "cd workdir && tr7i srfi-test/r7rs-programs/64.scm"


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

