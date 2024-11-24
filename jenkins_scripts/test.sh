#!/bin/sh

set -eu

name="$1"
cmd="$2"
lib_cmd="$3"
shift 3
srfis=$@

## Build 64 always first
make test-srfi-64-$name-build-library

for srfi in $srfis
do
    make test-srfi-$srfi-$name-build-library
    echo "Testing $srfi with command $cmd"
    $cmd "srfi-test/r7rs-programs/$srfi.scm" > "srfi-$srfi.log"
done

for f in *.log
do
    cp -- "$f" "reports/$name-$f"
done

ls reports
