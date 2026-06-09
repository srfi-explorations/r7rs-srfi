#!/bin/sh

implementations="chibi chicken foment gauche kawa mosh racket \
sagittarius skint stklos tr7 ypsilon"
srfis="1 2 5 8 11 14 16 19 25 26 28 29 31 37 38 39 41 42 43 48 51 60 63 64 66 \
69 87 95 111 113 115 116 128 145 180 197 227"

printf "" > "tests.bats"

for srfi in $srfis; do
    if [ -f "srfi/$srfi.sld" ]; then
        for scheme in $implementations; do
            {
                echo "# bats test_tags=${scheme}, ${srfi}"
                echo "@test \"${scheme}_srfi-${srfi}\" {"
                echo "  timeout 600 snow-chibi install --impls=${scheme} --always-yes srfi.64"
                echo "  timeout 600 make SRFI=$srfi SCHEME=$scheme all install"
                echo "  timeout 600 make SRFI=$srfi SCHEME=$scheme test"
                echo "}"
            } >> "tests.bats"
        done
    fi
done
