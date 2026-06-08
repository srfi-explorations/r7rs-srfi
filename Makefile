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

tmpdir=.tmp/${SCHEME}-${SRFI}

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

install-with-dependencies:
	snow-chibi --impls=${SCHEME} --always-yes install srfi.64 ${DEPENDS} ${PKG}

testfiles: ${PKG}
	rm -rf ${tmpdir}
	mkdir -p ${tmpdir}
	cp srfi-test/${RNRS}-programs/${SRFI}.${SFX} ${tmpdir}/test.${SFX}
	cp -r ${PKG} ${tmpdir}

test: srfi-test testfiles
	cd ${tmpdir} && COMPILE_R7RS=${SCHEME} compile-r7rs -o test-program test.${SFX}
	cd ${tmpdir} && ./test-program

docker-test-image:
	docker build -f Dockerfile.test --tag=srfitest .

test-docker: testfiles
	cd ${tmpdir} && \
		DOCKER_TAG=${DOCKER_TAG} \
		SNOW_PACKAGES="srfi.64 ${DEPENDS} ${PKG}"\
		COMPILE_R7RS=${SCHEME} \
		test-r7rs -o test-program test.${SFX}

bats:
	mkdir -p bats
	sh generate_bats.sh

test-srfi: bats
	rm -rf out/tests/${SRFI}
	mkdir -p out/tests/${SRFI}
	bats --jobs 13 --timing --gather-test-outputs-in out/tests/${SRFI} bats/srfi-${SRFI}.bats

test-srfi-docker: docker-test-image
	docker run -it -v "${PWD}:/workdir" --workdir /workdir srfitest sh -c "make SRFI=${SRFI} test-srfi; chmod -R 775 ./out; chmod -R 775 bats; chmod -R 775 ${tmpdir}"

test-implementation: bats
	rm -rf out/tests/${SCHEME}
	mkdir -p out/tests/${SCHEME}
	bats --timing --gather-test-outputs-in out/tests/${SCHEME} bats/${SCHEME}.bats

test-implementation-docker: docker-test-image
	docker run -it -v "${PWD}:/workdir" --workdir /workdir srfitest sh -c "make SCHEME=${SCHEME} test-implementation; chmod -R 775 ./out; chmod -R 775 bats; chmod -R 775 ${tmpdir}"

srfi-test:
	git clone https://github.com/srfi-explorations/srfi-test.git --depth=1 --branch=retropikzel-fixes2
	cd srfi-test && chibi-scheme convert.scm

clean:
	rm -rf *.log
	rm -rf *.html
	rm -rf *.tgz
	find . -name "*.so" -delete
	rm -rf ${tmpdir}
	rm -rf bats

