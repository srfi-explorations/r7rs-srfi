SRFI=64
SCHEME=chibi
TMPDIR=tmp/${SCHEME}

test: ${TMPDIR} logs srfi-test
	cd ${TMPDIR} && timeout 60 compile-r7rs -I . -o test-${SRFI} srfi-test/r7rs-programs/${SRFI}.scm
	cd ${TMPDIR} && LD_LIBRARY_PATH=. printf "\n" | timeout 60 ./test-${SRFI}
	cp ${TMPDIR}/srfi-${SRFI}.log logs/${SCHEME}-srfi-${SRFI}.log

test-docker:
	docker build --build-arg SCHEME=${SCHEME} --tag=r7rs-srfi-test-${SCHEME} -f Dockerfile.test .
	docker run -v ${PWD}:/workdir -w /workdir -t r7rs-srfi-test-${SCHEME} sh -c "make clean SCHEME=${SCHEME} SRFI=${SRFI} test && chmod -R 755 logs && chmod -R 755 tmp"

test-docker-all:
	@for srfi in $(shell cat tmp/srfis.txt); \
		do \
		echo "Testing SRFI: $${srfi}"; \
		docker build --build-arg SCHEME=${SCHEME} --tag=r7rs-srfi-test-${SCHEME} -f Dockerfile.test .; \
		docker run -v ${PWD}:/workdir --workdir /workdir -t r7rs-srfi-test-${SCHEME} sh -c "make clean && sleep 5 && make SCHEME=${SCHEME} SRFI=$${srfi} test"; \
		done

report:
	sh scripts/report.sh > report.html

srfi-test:
	git clone https://github.com/srfi-explorations/srfi-test.git --depth=1
	cd srfi-test && chibi-scheme convert.scm

${TMPDIR}: srfi-test
	mkdir -p ${TMPDIR}
	mkdir -p ${TMPDIR}/srfi-test
	cat srfis.scm | sed 's/(//' | sed 's/)//' | awk 'BEGIN { RS = "\^\$$" } {print $0}' > ${TMPDIR}/srfis.txt
	cp -r srfi ${TMPDIR}
	cp -r srfi-test/* ${TMPDIR}/srfi-test/

logs:
	mkdir -p logs

clean:
	rm -rf ${TMPDIR}

clean-logs:
	rm -rf logs

clean-all:
	rm -rf tmp
