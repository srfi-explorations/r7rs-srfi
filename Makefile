.PHONY: README.html
SCHEME=chibi
SRFI=64
VERSION=2025.08.27
TMPDIR=.tmp/${SCHEME}
TEST_R7RS_TIMEOUT=6000

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
	@cp srfi-test/r7rs-programs/${SRFI}.scm ${TMPDIR}/
	@cd ${TMPDIR} && COMPILE_R7RS=${SCHEME} TEST_R7RS_TIMEOUT=${TEST_R7RS_TIMEOUT} test-r7rs ${TEST_R7RS_ARGS} --no-header --use-docker-heads -I . -o ${SRFI} ${SRFI}.scm

test-all:
	@test-r7rs --only-header -o ${SRFI}
	@for scheme in $(shell compile-r7rs --list-r7rs-schemes); do make --silent SCHEME=$${scheme} TEST_TR7RS_ARGS=--no-header test; done

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

