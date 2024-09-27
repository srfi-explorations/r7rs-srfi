#!/usr/bin/env bash

set -euxo pipefail

implementation=${1}
scheme_command=${2}
library_command=${3}
srfi_number=${4}

rm -rf *.log
echo "${implementation}-srfi-${srfi_number}" > test-prefix.txt

if [ "${implementation}" = "chicken" ];
then
    cp "srfi/${srfi_number}.sld" "srfi-${srfi_number}.sld"
    ${library_command} "srfi-${srfi_number}.sld"
fi

if [ "${implementation}" = "chicken" ] \
    || [ "${implementation}" = "cyclone" ] \
    || [ "${implementation}" = "gambit" ];
then
    ${scheme_command} "srfi-test/${srfi_number}.scm"
    ./srfi-test/${srfi-number}
else
    ${scheme_command} "srfi-test/${srfi_number}.scm"
fi

