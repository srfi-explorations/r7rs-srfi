#!/bin/sh

implementations="capyscheme chibi chicken foment gauche kawa mosh racket \
sagittarius skint stklos tr7 ypsilon"
srfis=$(cat test_srfis.txt)

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
