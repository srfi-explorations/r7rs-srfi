#!/bin/sh

set -eu

name="$1"
cmd="$2"
lib_cmd="$3"
srfis=$(cat srfi-numbers.txt)


## Build 64 and it's dependencies always first
for n in 8 1 60 14 13 26 28 39 64
do
    make $n-$name-library
done

for srfi in $srfis
do
    make $srfi-$name-library
    echo "Testing $srfi with command $cmd"
    if [ "$lib_cmd" = "" ]
    then
        $cmd "srfi-test/r7rs-programs/$srfi.scm" > "reports/$name-srfi-$srfi.log"
    else
        $cmd "srfi-test/r7rs-programs/$srfi.scm"
        ./test > "reports/$name-srfi-$srfi.log"
    fi
done

ls reports
