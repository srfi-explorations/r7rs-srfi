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
ifeq "${RNRS}" "r6r"
SFX=sps
LIB_DIR=.akku/lib
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

install:
	snow-chibi --impls=${SCHEME} --always-yes install ${PKG}

testfiles:
	rm -rf ${tmpdir}
	mkdir -p ${tmpdir}
	mkdir -p ${tmpdir}/180
	cp -r srfi-test/180 ${tmpdir}/
	cp srfi-test/r7rs-programs/${SRFI}.scm ${tmpdir}/test.${SFX}

test: srfi-test testfiles
	cd ${tmpdir} && COMPILE_R7RS=${SCHEME} compile-r7rs -o test-program test.${SFX}
	cd ${tmpdir} && ./test-program

test-docker: package testfiles
	DOCKER_TAG=${DOCKER_TAG} \
			SNOW_PACKAGES="srfi.64 ${PKG}" \
			COMPILE_R7RS=${SCHEME} \
			test-r7rs -o ${tmpdir}/test-program ${tmpdir}/test.${SFX}

srfi-test:
	git clone https://github.com/srfi-explorations/srfi-test.git --depth=1 --branch=retropikzel-fixes2
	cd srfi-test && chibi-scheme convert.scm

local-srfi-test:
	cp ../srfi-test/*.scm srfi-test/
	cd srfi-test && chibi-scheme convert.scm

clean:
	git clean -X -f
	rm -rf .tmp

