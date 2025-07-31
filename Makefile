SRFI=64
SCHEME=chibi
TMPDIR=tmp/${SCHEME}
VERSION=1.0.0
DOCKERIMG="${SCHEME}:head"
ifeq "${SCHEME}" "chicken"
DOCKERIMG="chicken:5"
endif

INCDIRS=-I . -I /usr/local/share/kawa/lib -I ./deps
ifeq "${SCHEME}" "ypsilon"
INCDIRS=-I . #-I ${TMPDIR}/deps
endif

all: package

package:
	snow-chibi package \
		--version=${VERSION} \
		--authors="Schemeists" \
		--doc=README.md \
		--description="SRFI-${SRFI}" \
	srfi/${SRFI}.sld

install:
	snow-chibi install --impls=${SCHEME} srfi-${SRFI}-${VERSION}.tgz

force-install:
	printf "\n" | snow-chibi install --always-yes --impls=${SCHEME} srfi-${SRFI}-${VERSION}.tgz

test: ${TMPDIR} logs
	cd ${TMPDIR} && printf "\n" | timeout 60 compile-r7rs ${INCDIRS} -o test-${SRFI} srfi-test/r7rs-programs/${SRFI}.scm
	cd ${TMPDIR} && LD_LIBRARY_PATH=. printf "\n" | timeout 60 ./test-${SRFI}
	cp ${TMPDIR}/srfi-${SRFI}.log logs/${SCHEME}-srfi-${SRFI}.log

test-docker:
	docker build --build-arg IMAGE=${DOCKERIMG} --build-arg SCHEME=${SCHEME} --tag=r7rs-srfi-test-${SCHEME} -f Dockerfile.test .
	docker run -v ${PWD}:/workdir -w /workdir -t r7rs-srfi-test-${SCHEME} sh -c "make SCHEME=${SCHEME} SRFI=${SRFI} clean test && chmod -R 755 logs && chmod -R 755 tmp"

report:
	sh scripts/report.sh > report.html

srfi-test:
	git clone https://github.com/srfi-explorations/srfi-test.git \
		--depth=1 \
		--branch=retropikzel-fixes
	cd srfi-test && chibi-scheme convert.scm

${TMPDIR}: srfi-test
	mkdir -p ${TMPDIR}
	mkdir -p ${TMPDIR}/srfi-test
	cat srfis.scm | sed 's/(//' | sed 's/)//' | awk 'BEGIN { RS = "\^\$$" } {print $0}' > ${TMPDIR}/srfis.txt
	cp -r srfi ${TMPDIR}
	cp -r srfi-test ${TMPDIR}/
	mkdir -p ${TMPDIR}/deps
	snow-chibi install --impls=${SCHEME} --always-yes --install-source-dir=${TMPDIR}/deps --install-library-dir=${TPMDIR}/deps "(r6rs bytevectors)"

logs:
	mkdir -p logs

clean:
	rm -rf ${TMPDIR}

clean-logs:
	rm -rf logs

clean-all:
	rm -rf tmp
