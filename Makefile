SRFI=64
VERSION=1.0.0

all: srfi-${SRFI}-${VERSION}.tgz

srfi-${SRFI}-${VERSION}.tgz:
	snow-chibi package \
		--version=${VERSION} \
		--authors="r7rs-srfi project" \
		--doc=README.md \
		--description="SRFI ${SRFI}" \
		srfi/${SRFI}.sld

install: srfi-${SRFI}-${VERSION}.tgz
	snow-chibi install --impls=${SCHEME} srfi-${SRFI}-${VERSION}.tgz

test: srfi-test copy-tmp logs
	cd tmp/${SCHEME} && COMPILE_R7RS=${SCHEME} compile-r7rs -I . -o test-${SRFI} srfi-test/r7rs-programs/${SRFI}.scm
	cd tmp/${SCHEME} && LD_LIBRARY_PATH=. ./test-${SRFI}
	cp tmp/${SCHEME}/srfi-${SRFI}.log logs/${SCHEME}-srfi-${SRFI}.log

test-docker: srfi-test copy-tmp logs
	docker build --build-arg SCHEME=${SCHEME} --tag=r7rs-srfi-test-${SCHEME} -f Dockerfile.test .
	docker run -v ${PWD}:/workdir -w /workdir -t r7rs-srfi-test-${SCHEME} sh -c "make all install SCHEME=${SCHEME} SRFI=${SRFI} test"

test-docker-all: srfi-test copy-tmp logs
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
	cd srfi-test && make

copy-tmp:
	mkdir -p tmp/${SCHEME}
	mkdir -p tmp/${SCHEME}/srfi-test
	cat srfis.scm | sed 's/(//' | sed 's/)//' | awk 'BEGIN { RS = "\^\$$" } {print $$0}' > tmp/${SCHEME}/srfis.txt
	cp -r srfi tmp/${SCHEME}/
	cp -r srfi-test/* tmp/${SCHEME}/srfi-test/

logs:
	mkdir -p logs

clean:
	rm -rf tmp

clean-logs:
	rm -rf logs

clean-all:
	rm -rf tmp
	rm -rf srfi-test
