.PHONY: README.html tmpdir
.SILENT: srfi-test build install test test-docker clean test-r6rs \
	test-r6rs-docker test-r7rs test-r7rs-docker tmpdir srfi-install-list
SCHEME=chibi
DOCKERIMG=${SCHEME}:head
SRFI=64
VERSION=2025.12.11
CLEAN="*.o *.so *.a *.link"
TMPDIR=.tmp/${SCHEME}

ifeq "${SCHEME}" "chicken"
DOCKERIMG="chicken:5"
endif

ifeq "${SCHEME}" "racket"
DOCKERIMG="racket:latest"
endif

all: build

build:
	echo "<pre>$$(cat README.md)</pre>" > README.html
	snow-chibi package \
		--version=${VERSION} \
		--maintainers="Retropikzel" \
		--doc=README.html \
		--description="SRFI-${SRFI}" \
	srfi/${SRFI}.sld

# If implementation complains about missing SRFI dependency
# put it on this list
srfi-install-list:
	echo "27 60 63 39 64 128 $$(cat srfis.scm | tr -d '()')"

install:
	snow-chibi install --impls=${SCHEME} ${SNOW_CHIBI_ARGS} srfi-${SRFI}-${VERSION}.tgz

test-r6rs: tmpdir srfi-test
	cp -r srfi/63.* ${TMPDIR}/srfi/
	cp -r srfi/69.* ${TMPDIR}/srfi/
	cp -r srfi/95.* ${TMPDIR}/srfi/
	cp -r srfi/111.* ${TMPDIR}/srfi/
	cp -r srfi/113.* ${TMPDIR}/srfi/
	cp -r srfi/116.* ${TMPDIR}/srfi/
	cp -r srfi/145.* ${TMPDIR}/srfi/
	cp -r srfi/180.* ${TMPDIR}/srfi/
	cp -r srfi/srfi-63.* ${TMPDIR}/srfi/
	cp -r srfi/srfi-69.* ${TMPDIR}/srfi/
	cp -r srfi/srfi-95.* ${TMPDIR}/srfi/
	cp -r srfi/srfi-111.* ${TMPDIR}/srfi/
	cp -r srfi/srfi-113.* ${TMPDIR}/srfi/
	cp -r srfi/srfi-116.* ${TMPDIR}/srfi/
	cp -r srfi/srfi-145.* ${TMPDIR}/srfi/
	cp -r srfi/srfi-180.* ${TMPDIR}/srfi/
	cp -r srfi-test/r6rs-programs/* ${TMPDIR}/
	cd ${TMPDIR} && akku install chez-srfi akku-r7rs
	@if [ "${SCHEME}" = "mosh" ]; then rm -rf ${TMPDIR}/.akku && cd ${TMPDIR} && akku install; fi
	@if [ "${SCHEME}" = "ypsilon" ]; then rm -rf ${TMPDIR}/.akku && cd ${TMPDIR} && akku install; fi
	cd ${TMPDIR} && timeout 60 COMPILE_R7RS=${SCHEME} compile-scheme -I .akku/lib -o ${SRFI} --debug ${SRFI}.sps
	cd ${TMPDIR} && printf "\n" | timeout 60 ./${SRFI}

test-r6rs-docker: srfi-test
	docker build --build-arg IMAGE=${DOCKERIMG} --build-arg SCHEME=${SCHEME} --tag=r6rs-srfi-test-${SCHEME} -f Dockerfile.test .
	docker run -v /tmp/akku-cache:/root/.cache/akku -t r6rs-srfi-test-${SCHEME} sh -c "make SCHEME=${SCHEME} SRFI=${SRFI} test-r6rs"

test-r7rs: tmpdir srfi-test
	cp -r srfi-test/r7rs-programs/* ${TMPDIR}/
	cd ${TMPDIR} && COMPILE_R7RS=${SCHEME} timeout 60 compile-scheme -o ${SRFI} --debug ${SRFI}.scm
	cd ${TMPDIR} && timeout 60 ./${SRFI}

test-r7rs-docker: srfi-test
	docker build --build-arg IMAGE=${DOCKERIMG} --build-arg SCHEME=${SCHEME} --tag=r7rs-srfi-test-${SCHEME} -f Dockerfile.test .
	docker run -v /tmp/akku-cache:/root/.cache/akku -t r7rs-srfi-test-${SCHEME} sh -c "make SCHEME=${SCHEME} SRFI=${SRFI} test-r7rs"

tmpdir:
	rm -rf ${TMPDIR}
	mkdir -p ${TMPDIR}
	mkdir -p ${TMPDIR}/srfi
	mkdir -p ${TMPDIR}/libs
	mkdir -p ${TMPDIR}/libs/srfi

local-srfi-test:
	cp ../srfi-test/*.scm srfi-test/
	cd srfi-test && gosh -r7 convert.scm

srfi-test:
	git clone https://github.com/srfi-explorations/srfi-test.git \
		--depth=1 \
		--branch=retropikzel-fixes
	cd srfi-test && gosh -r7 convert.scm

clean:
	git clean -X -f

