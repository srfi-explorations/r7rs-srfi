#!/bin/sh

implementations="capyscheme chibi chicken foment gauche kawa mosh racket \
sagittarius skint stklos tr7 ypsilon"
srfis=$(cat test_srfis.txt)

mkdir -p bats

# SRFI tests

for srfi in $srfis; do
    if [ -f "srfi/$srfi.sld" ]; then
        printf "" > "bats/srfi-$srfi.bats"
        for scheme in $implementations; do
            {
                echo "@test \"$scheme SRFI-$srfi\" { timeout 300 make SRFI=$srfi SCHEME=$scheme all install-with-dependencies test; }"
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
                    echo "@test \"$scheme SRFI-$srfi\" { timeout 300 make SRFI=$srfi SCHEME=$scheme all install-with-dependencies test; }"
                } >> "bats/$scheme.bats"
        fi
    done
done
