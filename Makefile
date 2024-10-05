test-chibi-srfi-64:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi bash -c "cd workdir && chibi-scheme -I ./srfi srfi-test/r7rs-programs/64.scm"


test-chicken-srfi-64:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir &&  cp srfi/64.sld srfi-64.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-64.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/64.scm && srfi-test/r7rs-programs/64 && rm srfi-test/r7rs-programs/64"


test-cyclone-srfi-64:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -A . srfi/64.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -A . srfi-test/r7rs-programs/64.scm && srfi-test/r7rs-programs/64 && rm srfi-test/r7rs-programs/64"


test-gambit-srfi-64:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsc . srfi/64"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsc -exe . -nopreload srfi-test/r7rs-programs/64.scm && srfi-test/r7rs-programs/64 && rm srfi-test/r7rs-programs/64"


test-gauche-srfi-64:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche bash -c "cd workdir && gosh -r7 srfi-test/r7rs-programs/64.scm"


test-guile-srfi-64:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/64.scm"


test-kawa-srfi-64:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa bash -c "cd workdir && kawa --r7rs -Dkawa.import.path=..:*.sld srfi-test/r7rs-programs/64.scm"


test-loko-srfi-64:
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && ls srfi/64.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/64.scm && srfi-test/r7rs-programs/64 && rm srfi-test/r7rs-programs/64"


test-mit-scheme-srfi-64:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme bash -c "cd workdir && mit-scheme --load srfi-test/r7rs-programs/64.scm"


test-sagittarius-srfi-64:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius bash -c "cd workdir && sash -r7 -L ./srfi srfi-test/r7rs-programs/64.scm > srfi-64.log && cat srfi-64.log"


test-stklos-srfi-64:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos bash -c "cd workdir && stklos -I . srfi-test/r7rs-programs/64.scm"


test-skint-srfi-64:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint bash -c "cd workdir && skint --program srfi-test/r7rs-programs/64.scm"


test-tr7-srfi-64:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7 bash -c "cd workdir && tr7i srfi-test/r7rs-programs/64.scm"


test-chibi-srfi-8:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi bash -c "cd workdir && chibi-scheme -I ./srfi srfi-test/r7rs-programs/8.scm"


test-chicken-srfi-8:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir &&  cp srfi/8.sld srfi-8.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-8.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/8.scm && srfi-test/r7rs-programs/8 && rm srfi-test/r7rs-programs/8"


test-cyclone-srfi-8:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -A . srfi/8.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -A . srfi-test/r7rs-programs/8.scm && srfi-test/r7rs-programs/8 && rm srfi-test/r7rs-programs/8"


test-gambit-srfi-8:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsc . srfi/8"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsc -exe . -nopreload srfi-test/r7rs-programs/8.scm && srfi-test/r7rs-programs/8 && rm srfi-test/r7rs-programs/8"


test-gauche-srfi-8:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche bash -c "cd workdir && gosh -r7 srfi-test/r7rs-programs/8.scm"


test-guile-srfi-8:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/8.scm"


test-kawa-srfi-8:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa bash -c "cd workdir && kawa --r7rs -Dkawa.import.path=..:*.sld srfi-test/r7rs-programs/8.scm"


test-loko-srfi-8:
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && ls srfi/8.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/8.scm && srfi-test/r7rs-programs/8 && rm srfi-test/r7rs-programs/8"


test-mit-scheme-srfi-8:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme bash -c "cd workdir && mit-scheme --load srfi-test/r7rs-programs/8.scm"


test-sagittarius-srfi-8:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius bash -c "cd workdir && sash -r7 -L ./srfi srfi-test/r7rs-programs/8.scm > srfi-8.log && cat srfi-8.log"


test-stklos-srfi-8:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos bash -c "cd workdir && stklos -I . srfi-test/r7rs-programs/8.scm"


test-skint-srfi-8:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint bash -c "cd workdir && skint --program srfi-test/r7rs-programs/8.scm"


test-tr7-srfi-8:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7 bash -c "cd workdir && tr7i srfi-test/r7rs-programs/8.scm"


test-chibi-srfi-1:
	
	docker run -it -v ${PWD}:/workdir:z schemers/chibi bash -c "cd workdir && chibi-scheme -I ./srfi srfi-test/r7rs-programs/1.scm"


test-chicken-srfi-1:
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir &&  cp srfi/1.sld srfi-1.sld && csc -include-path ./srfi -X r7rs -R r7rs -s -J srfi-1.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/chicken bash -c "cd workdir && csc -include-path ./srfi -X r7rs -R r7rs srfi-test/r7rs-programs/1.scm && srfi-test/r7rs-programs/1 && rm srfi-test/r7rs-programs/1"


test-cyclone-srfi-1:
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -A . srfi/1.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/cyclone bash -c "cd workdir && cyclone -A . srfi-test/r7rs-programs/1.scm && srfi-test/r7rs-programs/1 && rm srfi-test/r7rs-programs/1"


test-gambit-srfi-1:
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsc . srfi/1"
	docker run -it -v ${PWD}:/workdir:z schemers/gambit bash -c "cd workdir && gsc -exe . -nopreload srfi-test/r7rs-programs/1.scm && srfi-test/r7rs-programs/1 && rm srfi-test/r7rs-programs/1"


test-gauche-srfi-1:
	
	docker run -it -v ${PWD}:/workdir:z schemers/gauche bash -c "cd workdir && gosh -r7 srfi-test/r7rs-programs/1.scm"


test-guile-srfi-1:
	
	docker run -it -v ${PWD}:/workdir:z schemers/guile bash -c "cd workdir && guile --fresh-auto-compile --r7rs -L . srfi-test/r7rs-programs/1.scm"


test-kawa-srfi-1:
	
	docker run -it -v ${PWD}:/workdir:z schemers/kawa bash -c "cd workdir && kawa --r7rs -Dkawa.import.path=..:*.sld srfi-test/r7rs-programs/1.scm"


test-loko-srfi-1:
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && ls srfi/1.sld"
	docker run -it -v ${PWD}:/workdir:z schemers/loko bash -c "cd workdir && loko -std=r7rs --compile srfi-test/r7rs-programs/1.scm && srfi-test/r7rs-programs/1 && rm srfi-test/r7rs-programs/1"


test-mit-scheme-srfi-1:
	
	docker run -it -v ${PWD}:/workdir:z schemers/mit-scheme bash -c "cd workdir && mit-scheme --load srfi-test/r7rs-programs/1.scm"


test-sagittarius-srfi-1:
	
	docker run -it -v ${PWD}:/workdir:z schemers/sagittarius bash -c "cd workdir && sash -r7 -L ./srfi srfi-test/r7rs-programs/1.scm > srfi-1.log && cat srfi-1.log"


test-stklos-srfi-1:
	
	docker run -it -v ${PWD}:/workdir:z schemers/stklos bash -c "cd workdir && stklos -I . srfi-test/r7rs-programs/1.scm"


test-skint-srfi-1:
	
	docker run -it -v ${PWD}:/workdir:z schemers/skint bash -c "cd workdir && skint --program srfi-test/r7rs-programs/1.scm"


test-tr7-srfi-1:
	
	docker run -it -v ${PWD}:/workdir:z schemers/tr7 bash -c "cd workdir && tr7i srfi-test/r7rs-programs/1.scm"


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

