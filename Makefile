RNRS=r7rs
SCHEME=chibi
SRFI=64
DOCKER_TAG=head

VERSION=$(shell cat srfi/${SRFI}/VERSION)
DEPENDS=$(shell cat srfi/${SRFI}/DEPENDS || echo "")
PKG=srfi-${SRFI}-${VERSION}.tgz

SFX=scm
LIB_PATHS=
ifeq "${RNRS}" "r6rs"
SFX=sps
LIB_PATHS=-I .akku/lib
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

install:
	snow-chibi --impls=${SCHEME} install ${PKG}

testfiles: package
	rm -rf .tmp
	mkdir -p .tmp
	cp srfi-test/${RNRS}-programs/${SRFI}.${SFX} .tmp/test.${SFX}
	cp ${PKG} .tmp/

test: srfi-test testfiles
	cd .tmp && COMPILE_R7RS=${SCHEME} compile-r7rs -o test-program test.${SFX}
	cd .tmp && timeout 120 ./test-program
	mkdir -p logs/${SCHEME}/
	-cp .tmp/*.log logs/${SCHEME}/

test-docker: testfiles
	cd .tmp && \
		TEST_R7RS_DEBUG=1 \
		DOCKER_TAG=${DOCKER_TAG} \
		SNOW_PACKAGES="srfi.64 ${DEPENDS} ${PKG}"\
		COMPILE_R7RS=${SCHEME} \
		test-r7rs -o test-program test.${SFX}
	mkdir -p logs/${SCHEME}/
	-cp .tmp/*.log logs/${SCHEME}/

srfi-test:
	git clone https://github.com/srfi-explorations/srfi-test.git --depth=1
	cd srfi-test && chibi-scheme convert.scm

clean:
	rm -rf *.log
	rm -rf *.html
	rm -rf *.tgz
	find . -name "*.so" -delete
	rm -rf .tmp

