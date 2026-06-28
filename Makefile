.SILENT:
SCHEME=chibi
SRFI=64
RNRS=r7rs
VERSION=$(shell cat srfi/${SRFI}/VERSION)
PKG=srfi-${SRFI}-${VERSION}.tgz
BATS_JOBS=1
TIER=1
BATS_ARGS=
DOCKER_TAG=head

tmpdir=.tmp/${SCHEME}-${SRFI}

SFX=scm
LIB_DIR=
AKKU_PACKAGES=
ifeq "${RNRS}" "r6rs"
SFX=sps
LIB_DIR=-I .akku/lib
AKKU_PACKAGES=akku-r7rs
endif

all: package

package: srfi/${SRFI}/VERSION
	echo "<pre>$$(cat README.md)</pre>" > README.html
	snow-chibi package \
		--always-yes \
		--version=${VERSION} \
		--maintainers="Retropikzel" \
		--doc=README.html \
		--description="SRFI-${SRFI}" \
	srfi/${SRFI}.sld

${PKG}: package

snow-index: ${PKG}
	snow-chibi git-index ${PKG}

install:
	snow-chibi --impls=${SCHEME} --always-yes install ${PKG}

testfiles: ${PKG}
	rm -rf ${tmpdir}
	mkdir -p ${tmpdir}
	mkdir -p ${tmpdir}/180
	cp -r srfi-test/180 ${tmpdir}/
	cp srfi-test/r6rs-programs/${SRFI}.sps ${tmpdir}/test.sps
	cp srfi-test/r7rs-programs/${SRFI}.scm ${tmpdir}/test.scm
	cp ${PKG} ${tmpdir}/

test: srfi-test testfiles
	cd ${tmpdir} && COMPILE_R7RS=${SCHEME} compile-r7rs -o test-program ${LIB_DIR} test.${SFX}
	cd ${tmpdir} && ./test-program

test-docker: testfiles
	cd ${tmpdir} \
		&&	DOCKER_TAG=${DOCKER_TAG} \
			TEST_R7RS_DEBUG=1 \
			SNOW_PACKAGES="srfi.64 ${PKG}" \
			AKKU_PACKAGES="${AKKU_PACKAGES}" \
			COMPILE_R7RS=${SCHEME} \
			test-r7rs -o test-program ${LIB_DIR} test.${SFX}

srfi-test:
	git clone https://github.com/srfi-explorations/srfi-test.git --depth=1 --branch=retropikzel-improvements
	cd srfi-test && chibi-scheme convert.scm

local-srfi-test:
	cp ../srfi-test/*.scm srfi-test/
	cd srfi-test && chibi-scheme convert.scm

clean:
	git clean -X -f
	rm -rf .tmp

