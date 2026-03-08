SCHEME=chibi
RNRS=r7rs
SRFI=64
VERSION=2026.02.12
PKG=srfi-${SRFI}-${VERSION}.tgz
SRFI_39_PKG=srfi-39-${VERSION}.tgz
SRFI_64_PKG=srfi-64-${VERSION}.tgz
DOCKERIMG=${SCHEME}:latest
TMPDIR=.tmp/${SCHEME}
SCHEMES=capyscheme chibi chicken cyclone foment gauche gambit guile kawa larceny loko meevax mit-scheme mosh racket sagittarius skint stklos tr7 ypsilon

LOGFILE=${SCHEME}-${RNRS}-srfi-${SRFI}.log

TESTFILESUFFIX=scm
ifeq "${RNRS}" "r6rs"
TESTFILESUFFIX=sps
endif

ifeq "${SCHEME}" "capyscheme"
DOCKERIMG="${SCHEME}:head"
endif

ifeq "${SCHEME}" "chibi"
DOCKERIMG="${SCHEME}:head"
endif

ifeq "${SCHEME}" "cyclone"
DOCKERIMG="${SCHEME}:head"
endif

ifeq "${SCHEME}" "foment"
DOCKERIMG="${SCHEME}:head"
endif

ifeq "${SCHEME}" "loko"
DOCKERIMG="${SCHEME}:head"
endif

ifeq "${SCHEME}" "meevax"
DOCKERIMG="${SCHEME}:head"
endif

ifeq "${SCHEME}" "stklos"
DOCKERIMG="${SCHEME}:head"
endif

ifeq "${SCHEME}" "tr7"
DOCKERIMG="${SCHEME}:head"
endif

all: build

build:
	echo "<pre>$$(cat README.md)</pre>" > README.html
	snow-chibi package \
		--version=${VERSION} \
		--maintainers="Retropikzel" \
		--doc=README.html \
		--description="SRFI-${SRFI}" \
	srfi/${SRFI}.sld

build-srfi-64:
	echo "<pre>$$(cat README.md)</pre>" > README.html
	snow-chibi package \
		--version=${VERSION} \
		--maintainers="Retropikzel" \
		--doc=README.html \
		--description="SRFI-64" \
	srfi/64.sld

install:
	snow-chibi install --impls=${SCHEME} ${SNOW_CHIBI_ARGS} srfi-${SRFI}-${VERSION}.tgz

run-test-venv: build-srfi-64 build srfi-test
	rm -rf venv
	scheme-venv ${SCHEME} venv
	cp srfi-test/r6rs-programs/${SRFI}.sps venv/run-test.sps
	cp srfi-test/r7rs-programs/${SRFI}.scm venv/run-test.scm
	snow-chibi install --impls=generic --always-yes --install-source-dir=snow --install-library-dir=venv/snow ${SRFI_64_PKG}
	./venv/bin/akku install akku-r7rs
	./venv/bin/snow-chibi install --impls=${SCHEME} --always-yes ${SRFI_64_PKG}
	./venv/bin/snow-chibi install --impls=${SCHEME} --always-yes ${PKG}
	COMPILE_R7RS_LOKO="-feval" COMPILE_R7RS=${SCHEME} ./venv/bin/scheme-compile ./venv/run-test.${TESTFILESUFFIX}
	cd venv && ./run-test
	mv venv/*.log logs/${SCHEME}-${RNRS}-${SRFI}.log || true

run-test-system: build-srfi-64 build srfi-test
	rm -rf tmp
	mkdir -p tmp
	cp srfi-test/r6rs-programs/${SRFI}.sps tmp/run-test.sps
	cp srfi-test/r7rs-programs/${SRFI}.scm tmp/run-test.scm
	snow-chibi install --impls=generic --always-yes --install-source-dir=snow --install-library-dir=tmp/snow ${SRFI_64_PKG}
	cd tmp && akku install akku-r7rs
	snow-chibi install --impls=${SCHEME} --always-yes ${SRFI_64_PKG}
	snow-chibi install --impls=${SCHEME} --always-yes ${PKG}
	if [ "${RNRS}" = "r6rs" ]; then cd tmp && COMPILE_R7RS_LOKO="-feval" COMPILE_R7RS=${SCHEME} compile-scheme -I .akku/lib run-test.sps; fi
	if [ "${RNRS}" = "r7rs" ]; then cd tmp && COMPILE_R7RS_LOKO="-feval" COMPILE_R7RS=${SCHEME} compile-scheme run-test.scm; fi
	cd tmp && ./run-test
	mv tmp/*.log logs/${SCHEME}-${RNRS}-${SRFI}.log || true

run-test-docker: srfi-test
	docker build --build-arg SCHEME=${SCHEME} --build-arg IMAGE=${DOCKERIMG} --tag=r7rs-srfi-${SCHEME}-${RNRS} -f Dockerfile.test .
	docker run \
		--memory=2G --cpus=2 \
		-v "/tmp/akkucache:/root/.cache/akku" \
		-v "${PWD}/logs:/workdir/logs" \
		-w /workdir r7rs-srfi-${SCHEME}-${RNRS} \
		sh -c "make SCHEME=${SCHEME} RNRS=${RNRS} SRFI=${SRFI} run-test-system && chmod 755 logs/*.log"

srfi-test:
	git clone https://github.com/srfi-explorations/srfi-test.git --depth=1 --branch=srfi-180
	cd srfi-test && gosh -r7 convert.scm

local-srfi-test:
	cp -r ../srfi-test/*.scm srfi-test/
	cd srfi-test && gosh -r7 convert.scm

clean:
	rm -rf *.log
	rm -rf *.html
	rm -rf *.tgz
	find . -name "*.so" -delete

