.SILENT:
SCHEME=chibi
SRFI=64
VERSION=$(shell cat srfi/${SRFI}/VERSION)
TESTFILE=srfi-test/r7rs-programs/${SRFI}.scm
PKG=srfi-${SRFI}-${VERSION}.tgz
MAINTAINERS=$(shell cat srfi/${SRFI}/MAINTAINERS 2> /dev/null || echo "Retropikzel")

all: package

package: srfi/${SRFI}/VERSION
	echo "<pre>$$(cat README.md)</pre>" > README.html
	snow-chibi package \
		--always-yes \
		--version=${VERSION} \
		--maintainers="${MAINTAINERS}" \
		--doc=README.html \
		--description="SRFI-${SRFI}" \
	srfi/${SRFI}.sld

install:
	snow-chibi --impls=${SCHEME} --always-yes install ${PKG}

test: srfi-test
	COMPILE_R7RS=${SCHEME} compile-r7rs -o test-program ${TESTFILE}
	./test-program

test-docker: srfi-test package
	SNOW_PACKAGES="srfi.64 ${PKG}" \
	COMPILE_R7RS=${SCHEME} \
	test-r7rs -o test-program ${LIB_DIR} ${TESTFILE}

srfi-test:
	git clone https://github.com/srfi-explorations/srfi-test.git --depth=1
	cd srfi-test && chibi-scheme convert.scm

local-srfi-test:
	cp ../srfi-test/*.scm srfi-test/
	cd srfi-test && chibi-scheme convert.scm

clean:
	git clean -X -f
	rm -rf .tmp

