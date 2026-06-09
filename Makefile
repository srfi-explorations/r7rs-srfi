SCHEME=chibi
SRFI=64
VERSION=$(shell cat srfi/${SRFI}/VERSION)
PKG=srfi-${SRFI}-${VERSION}.tgz
BATS_JOBS=1

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

test: srfi-test
	rm -rf ${tmpdir}
	mkdir -p ${tmpdir}
	cp srfi-test/r7rs-programs/${SRFI}.scm ${tmpdir}/test.scm
	cd ${tmpdir} && COMPILE_R7RS=${SCHEME} compile-r7rs -o test-program test.scm
	cd ${tmpdir} && ./test-program

test-docker: srfi-test docker-test-image
	rm -rf ${tmpdir}
	mkdir -p ${tmpdir}
	cp srfi-test/r7rs-programs/${SRFI}.scm ${tmpdir}/test.scm
	docker run -it \
		-v "${PWD}/srfi-test:/workdir/srfi-test" \
		srfitest \
		sh -c "snow-chibi install --impls=${SCHEME} --always-yes srfi.64 \
		&& make SCHEME=${SCHEME} SRFI=${SRFI} all install test"

tests.bats: bats.sh srfi/*.scm srfi/*.sld
	sh bats.sh

docker-test-image:
	docker build -f Dockerfile.test --tag=srfitest .

test-srfi: tests.bats
	bats --jobs ${BATS_JOBS} --filter-tags ${SRFI} --timing tests.bats

test-srfi-docker: tests.bats docker-test-image
	docker run -it \
		-v "${PWD}/srfi-test:/workdir/srfi-test" \
		srfitest \
		sh -c "BATS_JOBS=${BATS_JOBS} make SRFI=${SRFI} test-srfi; chmod -R 775 .tmp"

test-implementation: tests.bats
	bats --jobs ${BATS_JOBS} --filter-tags ${SCHEME} --timing tests.bats

test-implementation-docker: tests.bats docker-test-image
	docker run -it \
		-v "${PWD}/srfi-test:/workdir/srfi-test" \
		srfitest \
		sh -c "make BATS_JOBS=${BATS_JOBS} SCHEME=${SCHEME} test-implementation; chmod -R 775 .tmp"

srfi-test:
	git clone https://github.com/srfi-explorations/srfi-test.git --depth=1 --branch=retropikzel-fixes2
	cd srfi-test && chibi-scheme convert.scm

clean:
	git clean -X -f
	rm -rf .tmp

