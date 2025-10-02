.PHONY: README.html
SCHEME=chibi
DOCKERIMG=${SCHEME}:head
SRFI=64
VERSION=2025.08.27
TMPDIR=.tmp/${SCHEME}
TEST_R7RS_TIMEOUT=6000
TIMEOUT=6000

ifeq "${SCHEME}" "chicken"
DOCKERIMG="chicken:5"
endif

all: package

package: README.html
	snow-chibi package \
		--version=${VERSION} \
		--maintainers="Retropikzel" \
		--doc=README.html \
		--description="SRFI-${SRFI}" \
	srfi/${SRFI}.sld

README.html: README.md
	echo "<pre>" > README.html
	cat README.md >> README.html
	echo "</pre>" >> README.html

install: package
	snow-chibi install --impls=${SCHEME} ${SNOW_CHIBI_ARGS} srfi-${SRFI}-${VERSION}.tgz

test: srfi-test ${TMPDIR}
	cp srfi-test/r7rs-programs/${SRFI}.scm ${TMPDIR}/
	cd ${TMPDIR} && COMPILE_R7RS=${SCHEME} compile-r7rs -I . -o ${SRFI} ${SRFI}.scm
	cd ${TMPDIR} && ./${SRFI}

test-docker:
	docker build --build-arg IMAGE=${DOCKERIMG} --build-arg SCHEME=${SCHEME} --tag=r7rs-srfi-test-${SCHEME} -f Dockerfile.test .
	docker run -it -v "${PWD}:/workdir" -w /workdir -t r7rs-srfi-test-${SCHEME} sh -c \
		"make SCHEME=${SCHEME} SNOW_CHIBI_ARGS=--always-yes install test"

test-all:
	@for scheme in $(shell compile-r7rs --list-r7rs-schemes); do \
		make --silent SRFI=${SRFI} TIMEOUT=${TIMEOUT} SCHEME=$${scheme} TEST_TR7RS_ARGS=--no-header test; \
	done

${TMPDIR}:
	@mkdir -p ${TMPDIR}
	@cp -r srfi/ ${TMPDIR}/
	@if [ "${SCHEME}" = "chibi" ]; then rm -rf ${TMPDIR}/srfi/11.*; fi
	@if [ "${SCHEME}" = "chibi" ]; then rm -rf ${TMPDIR}/srfi/39.*; fi
	@if [ "${SCHEME}" = "chibi" ]; then rm -rf ${TMPDIR}/srfi/69.*; fi

srfi-test:
	@git clone https://github.com/srfi-explorations/srfi-test.git \
		--depth=1 \
		--branch=retropikzel-fixes
	@cd srfi-test && chibi-scheme convert.scm

clean:
	find . -name "*.tgz" -delete
	find . -name "*.o" -delete
	find . -name "*.so" -delete
	find . -name "*.a" -delete
	find . -name "*.link" -delete
	rm -rf ${TMPDIR}

clean-all: clean
	rm -rf srfi-test

