TIMEOUT=120

test: srfi-test copy-tmp logs
	cd tmp && timeout --foreground ${TIMEOUT} compile-r7rs -I . -o test-${SRFI} srfi-test/r7rs-programs/${SRFI}.scm
	cd tmp && LD_LIBRARY_PATH=. printf "\n" | timeout --foreground ${TIMEOUT} ./test-${SRFI}
	mv tmp/srfi-${SRFI}.log logs/${SCHEME}-srfi-${SRFI}.log

test-docker: srfi-test copy-tmp logs
	docker build --build-arg SCHEME=${SCHEME} --tag=r7rs-srfi-test-${SCHEME} -f Dockerfile.test .
	docker run -v ${PWD}:/workdir -w /workdir -t r7rs-srfi-test-${SCHEME} sh -c "make SCHEME=${SCHEME} SRFI=${SRFI} test-compile-r7rs"

test-docker-all: srfi-test copy-tmp logs
	@for srfi in $(shell cat tmp/srfis.txt); \
		do \
		echo "Testing SRFI: $${srfi}"; \
		docker build --build-arg SCHEME=${SCHEME} --tag=r7rs-srfi-test-${SCHEME} -f Dockerfile.test .; \
		docker run -v ${PWD}:/workdir --workdir /workdir -t r7rs-srfi-test-${SCHEME} sh -c "make clean && sleep 5 && make SCHEME=${SCHEME} SRFI=$${srfi} test-compile-r7rs"; \
		done

report:
	sh scripts/report.sh > report.html

srfi-test:
	git clone https://github.com/srfi-explorations/srfi-test.git --depth=1
	cd srfi-test && make

copy-tmp:
	mkdir -p tmp
	mkdir -p tmp/srfi-test
	cat srfis.scm | sed 's/(//' | sed 's/)//' | awk 'BEGIN { RS = "\^\$$" } {print $0}' > tmp/srfis.txt
	cp -r srfi tmp/
	cp -r srfi-test/* tmp/srfi-test/

logs:
	mkdir -p logs

clean:
	rm -rf tmp

clean-logs:
	rm -rf logs

clean-all:
	rm -rf tmp
	rm -rf srfi-test
