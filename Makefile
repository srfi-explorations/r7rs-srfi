SCHEME=chibi
RNRS=r7rs
SRFI=64
VERSION=2025.12.04
PKG=srfi-${SRFI}-${VERSION}.tgz
SRFI_39_PKG=srfi-39-${VERSION}.tgz
SRFI_64_PKG=srfi-64-${VERSION}.tgz
DOCKERIMG=${SCHEME}:latest
TMPDIR=.tmp/${SCHEME}
SCHEMES=capyscheme chibi chicken cyclone foment gauche gambit guile kawa larceny loko meevax mit-scheme mosh racket sagittarius skint stklos tr7 ypsilon

LOGFILE=${SCHEME}-${RNRS}-srfi-${SRFI}.log

ifeq "${SCHEME}" "capyscheme"
DOCKERIMG="capyescheme:head"
endif

ifeq "${SCHEME}" "chibi"
DOCKERIMG="chibi:head"
endif

ifeq "${SCHEME}" "meevax"
DOCKERIMG="meevax:head"
endif

ifeq "${SCHEME}" "racket"
DOCKERIMG="racket:head"
endif

ifeq "${SCHEME}" "stklos"
DOCKERIMG="stklos:head"
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
		--description="SRFI-${SRFI}" \
	srfi/64.sld

build-srfi-64:
	echo "<pre>$$(cat README.md)</pre>" > README.html
	snow-chibi package \
		--version=${VERSION} \
		--maintainers="Retropikzel" \
		--doc=README.html \
		--description="SRFI-${SRFI}" \
	srfi/39.sld

install:
	snow-chibi install --impls=${SCHEME} ${SNOW_CHIBI_ARGS} srfi-${SRFI}-${VERSION}.tgz

run-test: build-srfi-39 build-srfi-64 build srfi-test
	@rm -rf venv
	@scheme-venv ${SCHEME} ${RNRS} venv
	@mkdir -p venv/srfi
	@cp srfi-test/r6rs-programs/${SRFI}.sps venv/test.sps
	@cp srfi-test/r7rs-programs/${SRFI}.scm venv/test.scm
	@if [ "${RNRS}" = "r6rs" ]; then cp -r srfi ./venv/; fi
	@if [ "${RNRS}" = "r6rs" ]; then cp -r srfi/64.* ./venv/srfi/; fi
	@if [ ! "${SCHEME}" = "chibi" ]; then ./venv/bin/snow-chibi install --always-yes ${SRFI_39_PKG}; fi
	@if [ "${RNRS}" = "r7rs" ]; then ./venv/bin/snow-chibi install --always-yes ${SRFI_64_PKG}; fi
	@if [ "${RNRS}" = "r7rs" ]; then ./venv/bin/snow-chibi install --always-yes ${PKG}; fi
	@if [ "${RNRS}" = "r6rs" ]; then ./venv/bin/akku install akku-r7rs; fi
	@if [ "${RNRS}" = "r6rs" ]; then ./venv/bin/akku install ; fi
	@if [ "${RNRS}" = "r6rs" ]; then VENV_LOKO_ARGS="-feval" ./venv/bin/scheme-compile venv/test.sps; fi
	@if [ "${RNRS}" = "r7rs" ]; then VENV_LOKO_ARGS="-feval" ./venv/bin/scheme-compile venv/test.scm; fi
	@./venv/test | tail -n +2 | xargs | sed 's/\# of/<\/td><td>/g' | awk '{print("<tr><td>${RNRS}</td><td>${SRFI}</td><td>${SCHEME}</td><td>" $$0 "</td></tr>")}' | tee ${SCHEME}-${SRFI}-line.html
	@if [ -f srfi-${SRFI}.log ]; then mv srfi-${SRFI}.log ${LOGFILE}; fi

report:
	sh report.sh

run-test-docker: srfi-test
	docker build --build-arg SCHEME=${SCHEME} --build-arg IMAGE=${DOCKERIMG} --tag=r7rs-srfi-${SCHEME}-${RNRS} -f Dockerfile.test .
	docker run --memory=2G --cpus=2 -v "${PWD}:/workdir" -w /workdir r7rs-srfi-${SCHEME}-${RNRS} sh -c "make SCHEME=${SCHEME} RNRS=${RNRS} SRFI=${SRFI} run-test"

srfi-test:
	git clone https://github.com/srfi-explorations/srfi-test.git --depth=1
	cd srfi-test && gosh -r7 convert.scm

clean:
	rm -rf *.log
	rm -rf *.html

