test-compile-r7rs: srfi-test copy-tmp
	cd tmp && compile-r7rs -I . -o test-${SRFI} srfi-test/r7rs-programs/${SRFI}.scm
	cd tmp && LD_LIBRARY_PATH=. ./test-${SRFI}
	mv tmp/srfi-${SRFI}.log tmp/${COMPILE_R7RS}-srfi-${SRFI}.log

test-compile-r7rs-docker: srfi-test copy-tmp
	docker build --build-arg COMPILE_R7RS=${COMPILE_R7RS} --tag=r7rs-srfi-test-${COMPILE_R7RS} -f Dockerfile.test .
	docker run -v ${PWD}:/workdir -w /workdir -t r7rs-srfi-test-${COMPILE_R7RS} sh -c "make COMPILE_R7RS=${COMPILE_R7RS} SRFI=${SRFI} test-compile-r7rs"

test-compile-r7rs-docker-all: srfi-test copy-tmp
	echo "HERE: tree ${PWD}"
	@for srfi in $(shell cat tmp/srfis.txt); \
		do \
		echo "Testing SRFI: $${srfi}"; \
		docker build --build-arg COMPILE_R7RS=${COMPILE_R7RS} --tag=r7rs-srfi-test-${COMPILE_R7RS} -f Dockerfile.test .; \
		pwd; \
		docker run -v ${PWD}:/workdir --workdir /workdir -t r7rs-srfi-test-${COMPILE_R7RS} sh -c "pwd && tree && make COMPILE_R7RS=${COMPILE_R7RS} SRFI=$${srfi} test-compile-r7rs"; \
		done

srfi-test:
	git clone https://github.com/srfi-explorations/srfi-test.git --depth=1
	cd srfi-test && make

copy-tmp:
	mkdir -p tmp
	mkdir -p tmp/srfi-test
	cat srfis.scm | sed 's/(//' | sed 's/)//' | awk 'BEGIN { RS = "\^\$$" } {print $0}' > tmp/srfis.txt
	cp -r srfi tmp/
	cp -r srfi-test/* tmp/srfi-test/

clean:
	rm -rf tmp
