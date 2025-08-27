.PHONY: README.html
SRFI=64
SCHEME=chibi
TMPDIR=tmp/${SCHEME}
VERSION=2025.08.27
DOCKERIMG="${SCHEME}:head"
ifeq "${SCHEME}" "chicken"
DOCKERIMG="chicken:5"
endif

INCDIRS=-I . -I /usr/local/share/kawa/lib -I ./deps

ifeq "${SCHEME}" "chibi"
INCDIRS=-A .
endif

ifeq "${SCHEME}" "ypsilon"
INCDIRS=-I .
endif

ifeq "${SCHEME}" "cyclone"
INCDIRS=-I .
endif

all: package

package: README.html
	snow-chibi package \
		--version=${VERSION} \
		--authors="Schemeists" \
		--doc=README.html \
		--description="SRFI-${SRFI}" \
	srfi/${SRFI}.sld

README.html: README.md
	pandoc --metadata title="SRFI-${SRFI}" --standalone README.md > README.html

install:
	snow-chibi install --impls=${SCHEME} srfi-${SRFI}-${VERSION}.tgz

force-install:
	printf "\n" | snow-chibi install --always-yes --impls=${SCHEME} srfi-${SRFI}-${VERSION}.tgz

test: ${TMPDIR} logs
	cd ${TMPDIR} && cp srfi-test/r7rs-programs/${SRFI}.scm test-${SRFI}.scm
	cd ${TMPDIR} && printf "\n" | compile-r7rs ${INCDIRS} -o test-${SRFI} test-${SRFI}.scm
	cd ${TMPDIR} && LD_LIBRARY_PATH=. printf "\n" | time ./test-${SRFI} 2>&1 | tee ${SCHEME}-srfi-${SRFI}-test-output.log
	cp ${TMPDIR}/srfi-${SRFI}.log logs/${SCHEME}-srfi-${SRFI}.log
	cp ${TMPDIR}/${SCHEME}-srfi-${SRFI}-test-output.log logs/${SCHEME}-srfi-${SRFI}-test-output.log
	chmod 755 ${TMPDIR}/srfi-${SRFI}.log
	chmod -R 755 logs

test-docker:
	docker build --build-arg IMAGE=${DOCKERIMG} --build-arg SCHEME=${SCHEME} --tag=r7rs-srfi-test-${SCHEME} -f Dockerfile.test .
	if [ ! "${SCHEME}" = "cyclone" ]; then \
		docker run -v ${PWD}:/workdir -w /workdir -t r7rs-srfi-test-${SCHEME} sh -c "make SCHEME=${SCHEME} SRFI=${SRFI} clean"; \
	fi
	docker run -v ${PWD}:/workdir -w /workdir -t r7rs-srfi-test-${SCHEME} sh -c "make SCHEME=${SCHEME} SRFI=${SRFI} test"

test-docker-all:
	docker build -f Dockerfile.test . --tag=impls
	for i in $(shell docker run impls sh -c "compile-r7rs --list-r7rs-schemes | sed 's/gambit//'" | xargs); \
		do \
			make SCHEME="$$i" SRFI=${SRFI} test-docker; \
		done

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
	cp -r srfi ${TMPDIR}/
	find ${TMPDIR} -name "*.swp" -delete
	cp -r srfi-test ${TMPDIR}/
	mkdir -p ${TMPDIR}/deps

logs:
	mkdir -p logs

clean:
	rm -rf ${TMPDIR}

clean-logs:
	rm -rf logs

clean-tgz:
	find . -name "*.tgz" -delete

clean-all:
	rm -rf tmp
