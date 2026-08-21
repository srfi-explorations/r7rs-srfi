.DEFAULT: package
.POSIX:
SCHEME=chibi
SRFI=64
PKG=srfi-${SRFI}-${VERSION}.tgz
TAPPKG=tap-${PKG}

LICENSEFILE=srfi/${SRFI}/LICENSE
LICENSE=$$(cat ${LICENSEFILE})
VERSIONFILE=srfi/${SRFI}/VERSION
VERSION=$$(cat ${VERSIONFILE})
MAINTAINERSFILE=srfi/${SRFI}/MAINTAINERS
MAINTAINERS=$$(cat ${MAINTAINERSFILE} 2> /dev/null || echo "Retropikzel")
AUTHORSFILE=srfi/${SRFI}/AUTHORS
AUTHORS=$$(cat ${AUTHORSFILE})
ORIGTESTFILE=srfi-test/r7rs-programs/${SRFI}.scm
TESTFILE=test.scm
TAPTESTFILE=srfi-test/r7rs-programs/tap-${SRFI}.scm
ORIGINDEXFILE=srfi/${SRFI}/index.html
INDEXFILE=index.html
DESCFILE=srfi/${SRFI}/DESCRIPTION
DESCRIPTION=$$(cat ${DESCFILE})

all: package

${ORIGTESTFILE}: srfi-test

${TESTFILE}: ${ORIGTESTFILE}
	cp ${ORIGTESTFILE} ${TESTFILE}

${INDEXFILE}: ${ORIGINDEXFILE}
	cp ${ORIGINDEXFILE} ${INDEXFILE}

testfile:
	cp ${ORIGTESTFILE} ${TESTFILE}

taptestfile:
	cp ${TAPTESTFILE} ${TESTFILE}

indexfile:
	cp ${ORIGINDEXFILE} ${INDEXFILE}

package: srfi-test testfile indexfile ${LICENSEFILE} ${VERSIONFILE} ${AUTHORSFILE} ${TESTFILE} ${INDEXFILE} ${DESCFILE}
	snow-chibi package \
		--always-yes \
		--license="${LICENSE}" \
		--version="${VERSION}" \
		--maintainers="${MAINTAINERS}" \
		--authors="${AUTHORS}" \
		--test="${TESTFILE}" \
		--doc="${INDEXFILE}" \
		--description="${DESCRIPTION}" \
	srfi/${SRFI}.sld

package-tap: srfi-test ${LICENSEFILE} ${VERSIONFILE} ${AUTHORSFILE} ${TAPTESTFILE} ${INDEXFILE} ${DESCFILE}
	snow-chibi package \
		--always-yes \
		--license=${LICENSE} \
		--version="${VERSION}" \
		--maintainers="${MAINTAINERS}" \
		--authors="${AUTHORS}" \
		--test="${TAPTESTFILE}" \
		--doc="${INDEXFILE}" \
		--description='${DESCRIPTION}' \
	srfi/${SRFI}.sld
	mv ${PKG} ${TAPPKG}

index:
	curl -L -o srfi/${SRFI}/index.html https://srfi.schemers.org/srfi-${SRFI}/srfi-${SRFI}.html

description: srfi/${SRFI}/index.html
	printf "SRFI-${SRFI} - " > ${DESCFILE}
	cat srfi/${SRFI}/index.html | grep '<title>' | sed 's/<title>//' | sed 's/<\/title>//' | sed "s/^[ \t]*//" | tr -d '\n' >> ${DESCFILE}

deftaul-maintainer:
	echo "Retropikzel" > ${MAINTAINERSFILE}

install: package
	snow-chibi install --impls=${SCHEME} --always-yes --overwrite-native?=1 --skip-tests?=1 --verbose?=1 ${PKG}

test: package srfi-test
	snow-chibi test-package --impls=${SCHEME} --verbose?=1 ${PKG}

test-tap: package-tap srfi-test
	snow-chibi test-package --impls=${SCHEME} --verbose?=1 ${TAPPKG}

test-compile-r7rs: ${TESTFILE} srfi-test
	COMPILE_R7RS=${SCHEME} compile-r7rs -o test-program ${TESTFILE}
	./test-program

test-compile-r7rs-tap: ${TESTFILE} srfi-test
	COMPILE_R7RS=${SCHEME} compile-r7rs -o test-program ${TAPTESTFILE}
	./test-program

test-docker: srfi-test package testfile
	SNOW_PACKAGES="srfi.64 ${PKG}" \
	COMPILE_R7RS=${SCHEME} \
	test-r7rs -o test-program ${TESTFILE}

test-docker-tap: srfi-test package taptestfile
	DOCKER_TAG=head \
	SNOW_PACKAGES="srfi.64 ${PKG}" \
	COMPILE_R7RS=${SCHEME} \
	test-r7rs -o test-program ${TAPTESTFILE}

srfi-test:
	git clone https://github.com/srfi-explorations/srfi-test.git --depth=1
	cd srfi-test && chibi-scheme convert.scm
	cp -r srfi-test/180 .

clean:
	git clean -X -f
	rm -rf .tmp

distclean: clean
	rm -rf srfi-test

