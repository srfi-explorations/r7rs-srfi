#!/bin/sh

implementations="chibi kawa skint stklos"

mkdir -p bats

srfi=1
while [ "$srfi" -ne 500 ]; do
    if [ -f "srfi/$srfi.sld" ]; then
        printf "" > "bats/srfi-$srfi.bats"
        for scheme in $implementations; do
            {
                echo "@test \"$scheme SRFI-$srfi\" { timeout 60 make SRFI=$srfi SCHEME=$scheme all install test; }"
            } >> "bats/srfi-$srfi.bats"
        done
    fi
    srfi=$((srfi + 1))
done
