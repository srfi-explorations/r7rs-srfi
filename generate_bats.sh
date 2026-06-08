#!/bin/sh

implementations="chibi chicken foment gauche kawa mosh racket sagittarius \
skint stklos tr7 ypsilon"
srfis="1 2 5 8 11 14 16 19 25 26 37 38 39 41 42 43 48 51 54 60 63 66 64 87 \
69 95 111 113 115 116 128 145 180 197 227"

mkdir -p bats

# SRFI tests

for srfi in $srfis; do
    if [ -f "srfi/$srfi.sld" ]; then
        printf "" > "bats/srfi-$srfi.bats"
        for scheme in $implementations; do
            {
                echo "@test \"$scheme SRFI-$srfi\" { timeout 120 make SRFI=$srfi SCHEME=$scheme all install-with-dependencies test; }"
            } >> "bats/srfi-$srfi.bats"
        done
    fi
done

# Implementation tests

for scheme in $implementations; do
    printf "" > "bats/$scheme.bats"
    for srfi in $srfis; do
        if [ -f "srfi/$srfi.sld" ]; then
                {
                    echo "@test \"$scheme SRFI-$srfi\" { timeout 120 make SRFI=$srfi SCHEME=$scheme all install-with-dependencies test; }"
                } >> "bats/$scheme.bats"
        fi
    done
done
