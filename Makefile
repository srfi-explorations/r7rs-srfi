SILENT:
SCHEME=chibi
SRFI=64
VERSION=$(shell cat srfi/${SRFI}/VERSION)
ORIG_TESTFILE=srfi-test/r7rs-programs/${SRFI}.scm
TESTFILE=test.scm
PKG=srfi-${SRFI}-${VERSION}.tgz
BATS_JOBS=1
TIER=1
BATS_ARGS=

tmpdir=.tmp/${SCHEME}-${SRFI}

all: package

package: srfi/${SRFI}/VERSION srfi-test ${TESTFILE}
	echo "<pre>$$(cat README.md)</pre>" > README.html
	snow-chibi package \
		--always-yes \
		--version=${VERSION} \
		--maintainers="Retropikzel" \
		--doc=README.html \
		--test=${TESTFILE} \
		--description="SRFI-${SRFI}" \
	srfi/${SRFI}.sld

${TESTFILE}: ${ORIG_TESTFILE}
	cp ${ORIG_TESTFILE} ${TESTFILE}

${PKG}: package

snow-index: ${PKG}
	snow-chibi git-index ${PKG}

install:
	snow-chibi --impls=${SCHEME} --always-yes install ${PKG}

test: ${TESTFILE}
	COMPILE_R7RS=${SCHEME} compile-r7rs -o test-program ${TESTFILE}
	./test-program

test-docker: ${TESTFILE} package
	SNOW_PACKAGES="srfi.64 ${PKG}" \
	COMPILE_R7RS=${SCHEME} \
	test-r7rs -o test-program ${TESTFILE}

srfi-test:
	git clone https://github.com/srfi-explorations/srfi-test.git --depth=1 --branch=retropikzel-improvements
	cd srfi-test && chibi-scheme convert.scm

local-srfi-test:
	cp ../srfi-test/*.scm srfi-test/
	cd srfi-test && chibi-scheme convert.scm

clean:
	git clean -X -f
	rm -rf .tmp

