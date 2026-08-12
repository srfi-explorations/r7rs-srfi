.SILENT:
SCHEME=chibi
SRFI=64
VERSION=$(shell cat srfi/${SRFI}/VERSION)
TESTFILE=srfi-test/r7rs-programs/${SRFI}.scm
PKG=srfi-${SRFI}-${VERSION}.tgz

all: package

package: srfi/${SRFI}/VERSION ${TESTFILE}
	echo "<pre>$$(cat README.md)</pre>" > README.html
	snow-chibi package \
		--always-yes \
		--version=${VERSION} \
		--maintainers="Retropikzel" \
		--doc=README.html \
		--test=${TESTFILE} \
		--description="SRFI-${SRFI}" \
	srfi/${SRFI}.sld

snow-index: package
	snow-chibi git-index ${PKG}

install:
	snow-chibi --impls=${SCHEME} --always-yes install ${PKG}

test: srfi-test package
	snow-chibi test-package --impls=${SCHEME} --verbose?=1 ${PKG}

test-compile-r7rs: srfi-test ${TESTFILE}
	COMPILE_R7RS=${SCHEME} compile-r7rs -o test-program ${TESTFILE}
	./test-program

test-docker: ${TESTFILE} package
	SNOW_PACKAGES="srfi.64 ${PKG}" \
	COMPILE_R7RS=${SCHEME} \
	test-r7rs -o test-program ${TESTFILE}

srfi-test:
	git clone https://github.com/srfi-explorations/srfi-test.git --depth=1
	cd srfi-test && chibi-scheme convert.scm

clean:
	git clean -X -f
	rm -rf .tmp

