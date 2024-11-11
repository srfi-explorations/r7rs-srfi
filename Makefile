build:
	gosh -r7 -I . -I ./snow build.scm
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
