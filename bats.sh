#!/bin/sh

implementations="capyscheme chibi chicken foment gauche kawa mosh racket \
sagittarius skint stklos tr7 ypsilon"
srfis="1 2 5 8 11 14 16 19 25 26 37 38 39 41 42 43 48 51 54 60 63 66 64 87 69 \
95 111 113 115 116 128 145 180 197 227"

printf "" > "tests.bats"

for srfi in $srfis; do
    if [ -f "srfi/$srfi.sld" ]; then
        for scheme in $implementations; do
            {
                echo "# bats test_tags=${scheme}, ${srfi}"
                echo "@test \"${scheme}_srfi-${srfi}\" {"
                echo "  timeout 60 make SRFI=$srfi SCHEME=$scheme all install"
                echo "  timeout 120 make SRFI=$srfi SCHEME=$scheme test"
                echo "}"
            } >> "tests.bats"
        done
    fi
done
