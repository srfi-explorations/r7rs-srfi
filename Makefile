VERSION=1.0.0
SRFI=64
SCHEME=chibi

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

install-jenkins: srfi-${SRFI}-${VERSION}.tgz
	snow-chibi install --impls=${SCHEME} --always-yes srfi-${SRFI}-${VERSION}.tgz

test: srfi-test copy-tmp logs
	cd tmp/${SCHEME} && COMPILE_R7RS=${SCHEME} compile-r7rs -I . -o test-${SRFI} srfi-test/r7rs-programs/${SRFI}.scm
	cd tmp/${SCHEME} && LD_LIBRARY_PATH=. printf "\n" | ./test-${SRFI}
	cp tmp/${SCHEME}/srfi-${SRFI}.log logs/${SCHEME}-srfi-${SRFI}.log

test-docker: srfi-test copy-tmp logs
	docker build --build-arg SCHEME=${SCHEME} --tag=r7rs-srfi-test-${SCHEME} -f Dockerfile.test .
	docker run -v ${PWD}:/workdir -w /workdir -t r7rs-srfi-test-${SCHEME} sh -c "make all install SCHEME=${SCHEME} SRFI=${SRFI} test"

report:
	sh scripts/report.sh > report.html

srfi-test:
	git clone https://github.com/srfi-explorations/srfi-test.git --depth=1
	cd srfi-test && make

copy-tmp: srfi-test
	mkdir -p tmp/${SCHEME}
	mkdir -p tmp/${SCHEME}/srfi-test
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
