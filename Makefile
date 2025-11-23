.PHONY: README.html
.SILENT: srfi-test build install test test-docker clean
SCHEME=chibi
DOCKERIMG=${SCHEME}:head
SRFI=64
VERSION=2025.08.27
CLEAN="*.o *.so *.a *.link"
TMPDIR=.tmp/${SCHEME}

ifeq "${SCHEME}" "chicken"
DOCKERIMG="chicken:5"
endif

all: package

build:
	echo "<pre>$$(cat README.md)</pre>" > README.html
	snow-chibi package \
		--version=${VERSION} \
		--maintainers="Retropikzel" \
		--doc=README.html \
		--description="SRFI-${SRFI}" \
	srfi/${SRFI}.sld

install:
	snow-chibi install --impls=${SCHEME} ${SNOW_CHIBI_ARGS} srfi-${SRFI}-${VERSION}.tgz

.akku:
	akku install chez-srfi akku-r7rs

test-r6rs: ${TMPDIR} .akku #srfi-test
	cp -r .akku/lib ${TMPDIR}/
	cp -r srfi ${TMPDIR}/
	cd ${TMPDIR} && akku install
	cp -r srfi-test/r6rs-programs/* ${TMPDIR}/
	cd ${TMPDIR} && COMPILE_R7RS=${SCHEME} compile-scheme -I .akku/lib -I . -o ${SRFI} ${SRFI}.sps
	cd ${TMPDIR} && printf "\n" | ./${SRFI} 2>&1 | tee test-output.txt
	VAR=$$(grep "# of failures" ${TMPDIR}/test-output.txt > /dev/null; echo $$?) ; if [ "$${VAR}" = "0" ]; then exit 1; fi

test-r6rs-docker: srfi-test
	docker build --build-arg IMAGE=${DOCKERIMG} --build-arg SCHEME=${SCHEME} --tag=r6rs-srfi-test-${SCHEME} -f Dockerfile.test .
	docker run -t r6rs-srfi-test-${SCHEME} sh -c "make SCHEME=${SCHEME} SRFI=${SRFI} test-r6rs"

test-r7rs: ${TMPDIR} srfi-test
	cp -r srfi-test/r7rs-programs/* ${TMPDIR}/
	cp -r srfi ${TMPDIR}/
	@if [ "${SCHEME}" = "chibi" ]; then rm -rf ${TMPDIR}/srfi/11.*; fi
	cd ${TMPDIR} && COMPILE_R7RS=${SCHEME} compile-scheme -I . -o ${SRFI} ${SRFI}.scm
	cd ${TMPDIR} && printf "\n" | ./${SRFI} 2>&1 | tee test-output.txt
	VAR=$$(grep "# of failures" ${TMPDIR}/test-output.txt > /dev/null; echo $$?) ; if [ "$${VAR}" = "0" ]; then exit 1; fi

test-r7rs-docker: srfi-test
	docker build --build-arg IMAGE=${DOCKERIMG} --build-arg SCHEME=${SCHEME} --tag=r7rs-srfi-test-${SCHEME} -f Dockerfile.test .
	docker run -t r7rs-srfi-test-${SCHEME} sh -c "make SCHEME=${SCHEME} SRFI=${SRFI} test-r7rs"

${TMPDIR}:
	mkdir -p ${TMPDIR}
	mkdir -p ${TMPDIR}/srfi

srfi-test:
	git clone https://github.com/srfi-explorations/srfi-test.git \
		--depth=1 \
		--branch=retropikzel-fixes
	cd srfi-test && gosh -r7 convert.scm

clean:
	git clean -X -f

