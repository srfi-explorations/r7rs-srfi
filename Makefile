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
	COMPILE_R7RS=${SCHEME} compile-r7rs \
				-o ${tmpdir}/test-program-${SRFI} \
				srfi-test/r7rs-programs/${SRFI}.scm
	cd ${tmpdir} && ./test-program-${SRFI}

tests.bats: bats.sh srfi/*.scm srfi/*.sld
	sh bats.sh

docker-test-image:
	docker build -f Dockerfile.test --tag=srfitest .

test-srfi: tests.bats
	bats --jobs ${BATS_JOBS} --filter-tags ${SRFI} --timing --gather-test-outputs-in out/tests/${SRFI} tests.bats

test-srfi-docker: tests.bats docker-test-image
	docker run -it -v "${PWD}:/workdir" --workdir /workdir srfitest sh -c "make SRFI=${SRFI} test-srfi"

test-implementation: tests.bats
	bats --jobs ${BATS_JOBS} --filter-tags ${SCHEME} --timing --gather-test-outputs-in out/tests/${SCHEME} tests.bats

test-implementation-docker: tests.bats docker-test-image
	docker run -it -v "${PWD}:/workdir" --workdir /workdir srfitest sh -c "make SCHEME=${SCHEME} test-implementation"

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

