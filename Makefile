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

ifeq "${SCHEME}" "meevax"
DOCKERIMG="${SCHEME}:head"
endif

ifeq "${SCHEME}" "stklos"
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

build-srfi-39:
	echo "<pre>$$(cat README.md)</pre>" > README.html
	snow-chibi package \
		--version=${VERSION} \
		--maintainers="Retropikzel" \
		--doc=README.html \
		--description="SRFI-39" \
	srfi/39.sld

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

run-test-venv: build-srfi-39 build-srfi-64 build srfi-test
	rm -rf venv
	scheme-venv ${SCHEME} ${RNRS} venv
	mkdir -p venv/srfi
	cp srfi-test/r6rs-programs/${SRFI}.sps venv/test.sps
	cp srfi-test/r7rs-programs/${SRFI}.scm venv/test.scm
	if [ "${RNRS}" = "r6rs" ]; then cp -r srfi ./venv/; fi
	if [ "${RNRS}" = "r6rs" ]; then cp -r srfi/64.* ./venv/srfi/; fi
	if [ ! "${SCHEME}" = "chibi" ]; then ./venv/bin/snow-chibi install --always-yes ${SRFI_39_PKG}; fi
	if [ "${RNRS}" = "r7rs" ]; then ./venv/bin/snow-chibi install --always-yes ${SRFI_64_PKG}; fi
	if [ "${RNRS}" = "r7rs" ]; then ./venv/bin/snow-chibi install --always-yes ${PKG}; fi
	if [ "${RNRS}" = "r6rs" ]; then ./venv/bin/akku install akku-r7rs; fi
	if [ "${RNRS}" = "r6rs" ]; then ./venv/bin/akku install ; fi
	if [ "${RNRS}" = "r6rs" ]; then VENV_LOKO_ARGS="-feval" ./venv/bin/scheme-compile venv/test.sps; fi
	if [ "${RNRS}" = "r7rs" ]; then VENV_LOKO_ARGS="-feval" ./venv/bin/scheme-compile venv/test.scm; fi
	./venv/test
	mv *.log logs/${SCHEME}-${RNRS}-${SRFI}.log || true

run-test-system: build-srfi-39 build-srfi-64 build srfi-test
	rm -rf tmp
	mkdir -p tmp
	mkdir -p tmp/srfi
	cp -r srfi/39.* tmp/srfi/
	cp -r srfi/64.* tmp/srfi/
	cp srfi-test/r6rs-programs/${SRFI}.sps tmp/run-test.sps
	cp srfi-test/r7rs-programs/${SRFI}.scm tmp/run-test.scm
	if [ ! "${SCHEME}" = "chibi" ]; then snow-chibi install --always-yes ${SRFI_39_PKG}; fi
	if [ "${RNRS}" = "r7rs" ]; then snow-chibi install --always-yes ${SRFI_64_PKG}; fi
	if [ "${RNRS}" = "r7rs" ]; then snow-chibi install --always-yes ${PKG}; fi
	if [ "${RNRS}" = "r6rs" ]; then cd tmp && akku install akku-r7rs; fi
	if [ "${RNRS}" = "r6rs" ]; then cd tmp && akku install ; fi
	if [ "${RNRS}" = "r6rs" ]; then cd tmp && COMPILE_SCHEME=${SCHEME} compile-scheme -I .akku/lib run-test.sps; fi
	if [ "${RNRS}" = "r7rs" ]; then cd tmp && COMPILE_SCHEME=${SCHEME} compile-scheme run-test.scm; fi
	cd tmp && ./run-test
	mv tmp/*.log logs/${SCHEME}-${RNRS}-${SRFI}.log || true

run-test-docker: srfi-test
	docker build --build-arg SCHEME=${SCHEME} --build-arg IMAGE=${DOCKERIMG} --tag=r7rs-srfi-${SCHEME}-${RNRS} -f Dockerfile.test .
	docker run --memory=2G --cpus=2 -v "${PWD}/logs:/workdir/logs" -w /workdir r7rs-srfi-${SCHEME}-${RNRS} sh -c "make SCHEME=${SCHEME} RNRS=${RNRS} SRFI=${SRFI} run-test-system"

srfi-test:
	git clone https://github.com/srfi-explorations/srfi-test.git --depth=1
	cd srfi-test && gosh -r7 convert.scm

clean:
	rm -rf *.log
	rm -rf *.html
	rm -rf *.tgz
	find . -name "*.so" -delete

