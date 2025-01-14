#!/bin/sh

set -eu

name="$1"
cmd="$2"
lib_cmd="$3"
srfis=$(cat srfi-numbers.txt)

## Build SRFI libraries in dependency order always first
#for n in 8 1 60 13 14 26 28 38 39 48 64
for srfi in 8 1 38 39 48 64
do
    make $srfi-$name-library
done


for srfi in $srfis
do
    make $srfi-$name-library
    echo "${PWD}"

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
