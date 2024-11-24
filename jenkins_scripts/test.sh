#!/bin/sh

set -eu

name="$1"
cmd="$2"
lib_cmd="$3"
shift 3
srfis=$@

for srfi in $srfis
do
    if [ ! "$lib_cmd" = "" ] && [ "$name" = "gambit" ]
    then
        echo "Building library: srfi/$srfi with command $lib_cmd"
        $lib_cmd "srfi/$srfi"
    elif [ ! "$lib_cmd"  = "" ]
    then
        echo "Building library: srfi/$srfi.scm with command $lib_cmd"
        $lib_cmd "srfi/$srfi.scm"
    fi

    echo "Testing $srfi with command $cmd"
    $cmd "srfi-test/r7rs-programs/$srfi.scm" > "srfi-$srfi.log"
done

for f in *.log
do
    cp -- "$f" "reports/$name-$f"
done

ls reports
