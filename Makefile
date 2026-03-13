SCHEME=chibi
RNRS=r7rs
SRFI=64
VERSION=2026.02.12
PKG=srfi-${SRFI}-${VERSION}.tgz

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

test: srfi-test build
	mkdir -p logs
	rm -rf .tmp
	mkdir -p .tmp
	snow-chibi install --impls=${SCHEME} --always-yes ${PKG}
	cp srfi-test/r6rs-programs/${SRFI}.sps .tmp/test.sps
	cp srfi-test/r7rs-programs/${SRFI}.scm .tmp/test.scm
	if [ "${RNRS}" = "r6rs" ]; then cd .tmp && akku install akku-r7rs; fi
	if [ "${RNRS}" = "r6rs" ]; then cd .tmp && COMPILE_R7RS_LOKO="-feval" COMPILE_R7RS=${SCHEME} compile-r7rs -I .akku/lib test.sps; fi
	if [ "${RNRS}" = "r7rs" ]; then cd .tmp && COMPILE_R7RS_LOKO="-feval" COMPILE_R7RS=${SCHEME} compile-r7rs test.scm; fi
	cd .tmp && ./test
	if [ -f .tmp/*.log ]; then cp .tmp/*.log logs/${SCHEME}-${RNRS}-${SRFI}.log; fi

test-docker: srfi-test
	docker build --build-arg SCHEME=${SCHEME} --tag=${SCHEME}-testing -f Dockerfile.test .
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

