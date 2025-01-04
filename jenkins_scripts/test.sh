#!/bin/sh

set -eu

name="$1"
cmd="$2"
lib_cmd="$3"
srfis=$(cat srfi-numbers.txt)

## Build 64 and it's dependencies always first
for n in 8 1 38 48 64
do
    make $n-$name-library
done

## Copy files for Chicken to find
cp srfi/srfi*.sld .
cp srfi/*.scm .

for srfi in $srfis
do
    make $srfi-$name-library
    make $srfi-$name > "reports/$name-srfi-$srfi.log"
    #echo "Testing $srfi with command $cmd"
    #if [ "$lib_cmd" = "" ]
    #then
        #$cmd "srfi-test/r7rs-programs/$srfi.scm" > "reports/$name-srfi-$srfi.log"
    #else
        #$cmd "srfi-test/r7rs-programs/$srfi.scm"
        #./test > "reports/$name-srfi-$srfi.log"
    #fi

    # Some implementations do not use the projects SRFI-64 yet, so copy their logfiles too
    if [ -f "srfi-$srfi.log" ]
    then
        mv "srfi-$srfi.log" "reports/$name-srfi-$srfi.log"
    fi
done

ls reports
