RNRS=r7rs
SCHEME=chibi
SRFI=64
DOCKER_TAG=head

VERSION=2026.04.26
PKG=srfi-${SRFI}-${VERSION}.tgz

SFX=scm
LIB_PATHS=
ifeq "${RNRS}" "r6rs"
SFX=sps
LIB_PATHS=-I .akku/lib
endif

all: package

package:
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
	cd .tmp && timeout 600 ./test-program
	mkdir -p logs/${SCHEME}/
	cp .tmp/*.log logs/${SCHEME}/ || true

test-docker: testfiles
	cd .tmp && \
		TEST_R7RS_DEBUG=1 \
		DOCKER_TAG=${DOCKER_TAG} \
		SNOW_PACKAGES="srfi.2 srfi.8 srfi.11 srfi.19 srfi.27 srfi.28 srfi.39 srfi.60 srfi.64 srfi.69 srfi.145 srfi.180 ${PKG}"\
		COMPILE_R7RS=${SCHEME} \
		test-r7rs -o test-program test.${SFX}
	mkdir -p logs/${SCHEME}/
	cp .tmp/*.log logs/${SCHEME}/ || true

srfi-test:
	git clone https://github.com/srfi-explorations/srfi-test.git --depth=1
	cd srfi-test && chibi-scheme convert.scm

clean:
	rm -rf *.log
	rm -rf *.html
	rm -rf *.tgz
	find . -name "*.so" -delete
	rm -rf .tmp

