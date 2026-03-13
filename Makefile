SCHEME=chibi
RNRS=r7rs
SRFI=64
VERSION=2026.03.13
PKG=srfi-${SRFI}-${VERSION}.tgz
SRFI_64_PKG=srfi-64-${VERSION}.tgz
IMAGE=${SCHEME}:latest

all: build

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

SNOW=snow-chibi --impls=${SCHEME} --always-yes install srfi.64
test: srfi-test build
	mkdir -p logs
	rm -rf .tmp
	mkdir -p .tmp
	cp srfi-test/r6rs-programs/${SRFI}.sps .tmp/test.sps
	cp srfi-test/r7rs-programs/${SRFI}.scm .tmp/test.scm
	if [ "${RNRS}" = "r6rs" ]; then ${SNOW} --install-source-dir=.tmp --install-library-dir=.tmp ${PKG}; fi
	if [ "${RNRS}" = "r6rs" ]; then cd .tmp && akku install akku-r7rs; fi
	if [ "${RNRS}" = "r6rs" ]; then cd .tmp && COMPILE_R7RS=${SCHEME} compile-r7rs -I .akku/lib test.sps; fi
	if [ "${RNRS}" = "r7rs" ]; then ${SNOW} ${PKG}; fi
	if [ "${RNRS}" = "r7rs" ]; then cd .tmp && COMPILE_R7RS=${SCHEME} compile-r7rs test.scm; fi
	cd .tmp && ./test
	if [ -f .tmp/*.log ]; then cp .tmp/*.log logs/${SCHEME}-${RNRS}-${SRFI}.log; fi

test-docker: srfi-test
	docker build --build-arg IMAGE=${IMAGE} --build-arg SCHEME=${SCHEME} --tag=${SCHEME}-testing -f Dockerfile.test .
	docker run --memory=2G --cpus=2 -v "${PWD}/logs:/workdir/logs" ${SCHEME}-testing \
		sh -c "make SCHEME=${SCHEME} RNRS=${RNRS} SRFI=${SRFI} test"

srfi-test:
	git clone https://github.com/srfi-explorations/srfi-test.git --depth=1 --branch=srfi-180
	cd srfi-test && chibi-scheme convert.scm

local-srfi-test:
	cp -r ../srfi-test/*.scm srfi-test/
	cd srfi-test && gosh -r7 convert.scm

clean:
	rm -rf *.log
	rm -rf *.html
	rm -rf *.tgz
	find . -name "*.so" -delete

