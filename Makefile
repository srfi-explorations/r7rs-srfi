SCHEME=chibi
SRFI=64
VERSION=$(shell cat srfi/${SRFI}/VERSION)
PKG=srfi-${SRFI}-${VERSION}.tgz
BATS_JOBS=1
TIER=1
BATS_ARGS=

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

testfiles:
	rm -rf ${tmpdir}
	mkdir -p ${tmpdir}
	mkdir -p ${tmpdir}/180
	cp -r srfi-test/180 ${tmpdir}/
	cp srfi-test/r7rs-programs/${SRFI}.scm ${tmpdir}/test.scm

test: srfi-test testfiles
	cd ${tmpdir} && COMPILE_R7RS=${SCHEME} compile-r7rs -o test-program test.scm
	cd ${tmpdir} && ./test-program

test-docker: srfi-test docker-test-image testfiles
	docker run -it \
		-v "${PWD}/srfi-test:/workdir/srfi-test" \
		srfitest \
		sh -c "snow-chibi install --impls=${SCHEME} --always-yes srfi.64 \
		&& make SCHEME=${SCHEME} SRFI=${SRFI} all install test"

bats: bats.sh srfi/*.scm srfi/*.sld
	sh bats.sh

docker-test-image:
	docker build -f Dockerfile.test --tag=srfitest .

test-srfi: bats
	bats ${BATS_ARGS} --jobs ${BATS_JOBS} --filter-tags srfi_${SRFI},tier_${TIER} --timing tests.bats

test-srfi-docker: bats docker-test-image
	docker run -it \
		-v "${PWD}/srfi-test:/workdir/srfi-test" \
		srfitest \
		sh -c "make BATS_ARGS=${BATS_ARGS} TIER=${TIER} BATS_JOBS=${BATS_JOBS} SRFI=${SRFI} bats test-srfi"

test-implementation: bats
	bats ${BATS_ARGS} --jobs ${BATS_JOBS} --filter-tags ${SCHEME},tier_${TIER} --timing tests.bats

test-implementation-docker: bats docker-test-image
	docker run -it \
		-v "${PWD}/srfi-test:/workdir/srfi-test" \
		srfitest \
		sh -c "make BATS_ARGS=${BATS_ARGS} TIER=${TIER} BATS_JOBS=${BATS_JOBS} SCHEME=${SCHEME} bats test-implementation"

srfi-test:
	git clone https://github.com/srfi-explorations/srfi-test.git --depth=1 --branch=retropikzel-fixes2
	cd srfi-test && chibi-scheme convert.scm

local-srfi-test:
	cp ../srfi-test/*.scm srfi-test/
	cd srfi-test && chibi-scheme convert.scm

clean:
	git clean -X -f
	rm -rf .tmp

