.PHONY: README.html
.SILENT: build install test test-docker
SCHEME=chibi
DOCKERIMG=${SCHEME}:head
SRFI=64
VERSION=2025.08.27
CLEAN="*.o *.so *.a *.link"
TMPDIR=tmp/${SCHEME}

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

test: srfi-test logs/${SCHEME}
	rm -rf ${TMPDIR}
	cp -r srfi-test/r7rs-programs ${TMPDIR}
	cp -r srfi ${TMPDIR}/
	@if [ "${SCHEME}" = "chibi" ]; then rm -rf ${TMPDIR}/srfi/11.*; fi
	@if [ "${SCHEME}" = "chibi" ]; then rm -rf ${TMPDIR}/srfi/39.*; fi
	@if [ "${SCHEME}" = "chibi" ]; then rm -rf ${TMPDIR}/srfi/69.*; fi
	cd ${TMPDIR} && COMPILE_R7RS=${SCHEME} compile-r7rs -I . -o ${SRFI} ${SRFI}.scm
	cd ${TMPDIR} && ./${SRFI}
	cp ${TMPDIR}/srfi-*.log logs/${SCHEME}/srfi-${SRFI}.log
	chmod -R 755 logs

logs/${SCHEME}:
	mkdir -p logs/${SCHEME}

test-docker:
	docker build --build-arg IMAGE=${DOCKERIMG} --build-arg SCHEME=${SCHEME} --tag=r7rs-srfi-test-${SCHEME} -f Dockerfile.test .
	docker run -t -v "${PWD}:/workdir" -w /workdir -t r7rs-srfi-test-${SCHEME} sh -c \
		"make SCHEME=${SCHEME} SRFI=${SRFI} test ; chmod -R 755 ${TMPDIR}"

srfi-test:
	@git clone https://github.com/srfi-explorations/srfi-test.git \
		--depth=1 \
		--branch=retropikzel-fixes
	@cd srfi-test && chibi-scheme convert.scm

clean:
	for name in "${CLEAN}"; do find . -name "$${name}" -delete; done
	rm -rf tmp

distclean: clean
	rm -rf logs
	rm -rf srfi-test

