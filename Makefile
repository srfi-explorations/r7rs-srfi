.SILENT:
SCHEME=chibi
SRFI=64
PKG=srfi-${SRFI}-${VERSION}.tgz

LICENSEFILE=srfi/${SRFI}/LICENSE
LICENSE=$(shell cat ${LICENSEFILE} 2> /dev/null | tr -d '\n' | tr -d ' ')
VERSIONFILE=srfi/${SRFI}/VERSION
VERSION=$(shell cat ${VERSIONFILE})
MAINTAINERSFILE=srfi/${SRFI}/MAINTAINERS
MAINTAINERS=$(shell cat ${MAINTAINERSFILE} 2> /dev/null | tr -d '\n')
AUTHORSFILE=srfi/${SRFI}/AUTHORS
AUTHORS=$(shell cat ${AUTHORSFILE} 2> /dev/null | tr -d '\n')
ORIGTESTFILE=srfi-test/r7rs-programs/${SRFI}.scm
TESTFILE=test.scm
ORIGINDEXFILE=srfi/${SRFI}/index.html
INDEXFILE=index.html
DESCFILE=srfi/${SRFI}/DESCRIPTION
DESCRIPTION=$(shell cat ${DESCFILE} 2> /dev/null | tr -d '\n')

all: package

${TESTFILE}: ${ORIGTESTFILE}
	cp ${ORIGTESTFILE} ${TESTFILE}

${INDEXFILE}: ${ORIGINDEXFILE}
	cp ${ORIGINDEXFILE} ${INDEXFILE}

package: ${LICENSEFILE} ${VERSIONFILE} ${MAINTAINERSFILE} ${AUTHORSFILE} ${TESTFILE} ${INDEXFILE} ${DESCFILE}
	snow-chibi package \
		--always-yes \
		--license="${LICENSE}" \
		--version="${VERSION}" \
		--maintainers="${MAINTAINERS}" \
		--authors="${AUTHORS}" \
		--test="${TESTFILE}" \
		--doc="${INDEXFILE}" \
		--description='${DESCRIPTION}' \
	srfi/${SRFI}.sld

.tmp/srfi-${SRFI}.html:
	mkdir -p .tmp
	curl -L -o .tmp/srfi-${SRFI}.html https://srfi.schemers.org/srfi-${SRFI}
	grep -F "<title>" .tmp/srfi-${SRFI}.html || rm -rf .tmp/srfi-${SRFI}.html

index: .tmp/srfi-${SRFI}.html
	printf "<html><head><title>SRFI-${SRFI}</title></head><body>" > ${ORIGINDEXFILE}
	printf "<a href='https://srfi.schemers.org/srfi-${SRFI}'>" >> ${ORIGINDEXFILE}
	printf "SRFI-${SRFI} - " >> ${ORIGINDEXFILE}
	cat .tmp/srfi-${SRFI}.html | grep '<title>' | sed 's/<title>//' | sed 's/<\/title>//' | sed 's/^[ \t]*//' | tr -d '\n' >> ${ORIGINDEXFILE}
	printf "</a></body></html>" >> ${ORIGINDEXFILE}

description: .tmp/srfi-${SRFI}.html
	printf "SRFI-${SRFI} - " > ${DESCFILE}
	cat .tmp/srfi-${SRFI}.html | grep '<title>' | sed 's/<title>//' | sed 's/<\/title>//' | sed "s/^[ \t]*//" | tr -d '\n' >> ${DESCFILE}

deftaul-maintainer:
	echo "Retropikzel" > ${MAINTAINERSFILE}

snow-index: package
	snow-chibi git-index ${PKG}

install:
	snow-chibi --impls=${SCHEME} \
		--install-prefix ${INSTALL_PREFIX} \
		--always-yes install ${PKG}

test: srfi-test package
	snow-chibi test-package --impls=${SCHEME} --verbose?=1 ${PKG}

test-compile-r7rs: srfi-test ${TESTFILE}
	COMPILE_R7RS=${SCHEME} compile-r7rs -o test-program ${TESTFILE}
	./test-program

test-docker: ${TESTFILE} package
	SNOW_PACKAGES="srfi.64 ${PKG}" \
	COMPILE_R7RS=${SCHEME} \
	test-r7rs -o test-program ${TESTFILE}

srfi-test:
	git clone https://github.com/srfi-explorations/srfi-test.git --depth=1
	cd srfi-test && chibi-scheme convert.scm

clean:
	git clean -X -f
	rm -rf .tmp

