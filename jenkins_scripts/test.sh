#!/bin/sh

set -eu

name="$1"
cmd="$2"
lib_cmd="$3"
shift 3
srfis=$@

## Build 64 always first
if [ ! "$lib_cmd" = "" ] && [ "$name" = "gambit" ]
then
    echo "Building library: srfi/64 with command $lib_cmd"
    $lib_cmd "srfi/64"
elif [ ! "$lib_cmd"  = "" ]
then
    echo "Building library: srfi/64.scm with command $lib_cmd"
    $lib_cmd "srfi/64.scm"
fi

for srfi in $srfis
do
    echo "Testing $srfi with command $cmd"
    $cmd "srfi-test/r7rs-programs/$srfi.scm" > "srfi-$srfi.log"
done

for f in *.log
do
    cp -- "$f" "reports/$name-$f"
done

ls reports
