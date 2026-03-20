SCHEME=chibi
RNRS=r7rs
SRFI=64
VERSION=2026.03.13
PKG=srfi-${SRFI}-${VERSION}.tgz
SRFI_64_PKG=srfi-64-${VERSION}.tgz
IMAGE=${SCHEME}:latest

SNOW=snow-chibi --impls=${SCHEME} install --always-yes
SFX=scm
LIB_PATHS=
ifeq "${RNRS}" "r6rs"
SNOW=${SNOW} --install-source-dir=. --install-library-dir=.
SFX=sps
LIB_PATHS=-I .akku/lib
endif

ifeq "${SCHEME}" "capyscheme"
IMAGE=${SCHEME}:head
endif

all: build

build:
	echo "<pre>$$(cat README.md)</pre>" > README.html
	snow-chibi package \
		--always-yes \
		--version=${VERSION} \
		--maintainers="Retropikzel" \
		--doc=README.html \
		--description="SRFI-${SRFI}" \
	srfi/${SRFI}.sld

index:
	snow-chibi index ${PKG}

install: index
	snow-chibi install --impls=${SCHEME} srfi.${SRFI}

test: srfi-test build index
	mkdir -p logs
	rm -rf .tmp
	mkdir -p .tmp
	cp -r srfi-test/180 .tmp/
	cp srfi-test/${RNRS}-programs/${SRFI}.${SFX} .tmp/test.${SFX}
	cd .tmp && ${SNOW} "(srfi 64)"
	cd .tmp && ${SNOW} "(srfi ${SRFI})"
	cd .tmp && akku install akku-r7rs 2> /dev/null
	cd .tmp && COMPILE_R7RS=${SCHEME} compile-r7rs ${LIB_PATHS} test.${SFX}
	cd .tmp && timeout 600 ./test
	if [ -f .tmp/*.log ]; then cp .tmp/*.log logs/${SCHEME}-${RNRS}-${SRFI}.log; fi

test-docker: srfi-test
	docker build --build-arg IMAGE=${IMAGE} --build-arg SCHEME=${SCHEME} --tag=${SCHEME}-testing -f Dockerfile.test .
	docker run --memory=2G --cpus=2 -v "${PWD}/dockertmp:/tmp" -v "${PWD}/logs:/workdir/logs" ${SCHEME}-testing \
		sh -c "make SCHEME=${SCHEME} RNRS=${RNRS} SRFI=${SRFI} test"

srfi-test:
	git clone https://github.com/srfi-explorations/srfi-test.git --depth=1 --branch=retropikzel-180
	cd srfi-test && chibi-scheme convert.scm

local-srfi-test:
	cp -r ../srfi-test/*.scm srfi-test/
	cp -r ../srfi-test/180 srfi-test/
	cd srfi-test && chibi-scheme convert.scm

local-chibi-scheme:
	rm -rf chibi-scheme
	cp -r ../chibi-scheme .

clean:
	rm -rf *.log
	rm -rf *.html
	rm -rf *.tgz
	find . -name "*.so" -delete
	rm -rf .tmp

