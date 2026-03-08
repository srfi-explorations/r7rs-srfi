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

ifeq "${SCHEME}" "stklos"
DOCKERIMG="${SCHEME}:head"
endif

all: build

racket-compability:
	printf "#lang r7rs\n(import (only (scheme base) include))\n(include \"${SRFI}.sld\")" > srfi/${SRFI}.rkt

guile-compability:
	cp srfi/${SRFI}.sld srfi/srfi-${SRFI}.scm


build:
	echo "<pre>$$(cat README.md)</pre>" > README.html
	snow-chibi package \
		--version=${VERSION} \
		--maintainers="Retropikzel" \
		--doc=README.html \
		--description="SRFI-${SRFI}" \
	srfi/${SRFI}.sld

install:
	snow-chibi install --impls=${SCHEME} ${SNOW_CHIBI_ARGS} srfi-${SRFI}-${VERSION}.tgz

run-test: racket-compability guile-compability srfi-test
	rm -rf tmp
	mkdir -p tmp
	cp -r srfi tmp/
	cp srfi-test/r6rs-programs/${SRFI}.sps tmp/run-test.sps
	cp srfi-test/r7rs-programs/${SRFI}.scm tmp/run-test.scm
	if [ "${RNRS}" = "r6rs" ]; then cd tmp && akku install akku-r7rs chez-srfi; fi
	if [ "${RNRS}" = "r6rs" ]; then cd tmp && COMPILE_R7RS_LOKO="-feval" COMPILE_R7RS=${SCHEME} compile-scheme -A .akku/lib run-test.sps; fi
	if [ "${RNRS}" = "r7rs" ]; then cd tmp && COMPILE_R7RS_LOKO="-feval" COMPILE_R7RS=${SCHEME} compile-scheme -A . run-test.scm; fi
	cd tmp && ./run-test
	mv tmp/*.log logs/${SCHEME}-${RNRS}-${SRFI}.log || true

run-test-docker: srfi-test
	docker build --build-arg SCHEME=${SCHEME} --build-arg IMAGE=${DOCKERIMG} --tag=r7rs-srfi-${SCHEME} -f Dockerfile.test .
	docker run \
		--memory=2G \
		--cpus=2 \
		-v "/tmp/akkucache:/root/.cache/akku" \
		-v "${PWD}/logs:/workdir/logs" \
		-w /workdir \
		r7rs-srfi-${SCHEME} \
		sh -c "make SCHEME=${SCHEME} RNRS=${RNRS} SRFI=${SRFI} run-test && chmod 755 logs/*.log"

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

