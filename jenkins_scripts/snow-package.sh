#!/bin/bash

set -euxo

WORKDIR=${PWD}
VERSION=$(cat VERSION)

rm -rf packages
mkdir -p packages

cd ${WORKDIR}/srfi
for f in *.sld
do
    package_name=srfi-${f/.sld}-${VERSION}
    rm -rf /tmp/srfi
    mkdir -p /tmp/srfi/${package_name}/srfi

    number=${f/.sld}
    dependencies=$(gosh -r7 ../jenkins_scripts/get-dependencies.scm ${f})

    {
        echo "(package"
        echo "  (authors \"r7rs-srfi\")"
        echo "  (version \"${VERSION}\")"
        echo "  (manual \"srfi-${number}.html\")"
        echo "  (library"
        echo "    (name (srfi ${number}))"
        echo "    (path \"srfi/${number}.sld\")"
        echo "    (depends ${dependencies})))"
    } > /tmp/srfi/${package_name}/package.scm

    echo "${f} package.scm: "
    cat /tmp/srfi/${package_name}/package.scm

    cp ${f} /tmp/srfi/${package_name}/srfi
    cp ${f/.sld/.scm} /tmp/srfi/${package_name}/srfi

    echo "Packaging /tmp/srfi"

    cd /tmp/srfi/${package_name}

    wget https://srfi.schemers.org/srfi-${number}/srfi-${number}.html

    cd /tmp/srfi


    tree .

    tar -czvf ${WORKDIR}/packages/srfi-${f/.sld/}-${VERSION}.tar.gz ${package_name}

    cd ${WORKDIR}/srfi
done
cd ..

ls packages/
