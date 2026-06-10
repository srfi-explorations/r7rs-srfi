#!/bin/sh

implementations="$(cat test_implementations.txt)"
echo "Schemes: $implementations"
srfis="SRFIs: $(cat test_srfis.txt)"
echo "$srfis"

printf "" > "tests.bats"

for srfi in $srfis; do
    if [ -f "srfi/$srfi.sld" ]; then
        for scheme in $implementations; do
            {
                echo "# bats test_tags=${scheme}, ${srfi}"
                echo "@test \"${scheme}_srfi-${srfi}\" {"
                echo "  timeout 600 snow-chibi install --impls=${scheme} --always-yes srfi.64"
                echo "  timeout 600 make SRFI=$srfi SCHEME=$scheme all install"
                echo "  runtime=600"
                echo "  if [ \"${scheme}\" = \"skint\" ]; then runtime=30; fi"
                echo "  if [ \"${scheme}\" = \"larceny\" ]; then runtime=30; fi"
                echo "  if [ \"${scheme}\" = \"mit-scheme\" ]; then runtime=30; fi"
                echo "  timeout \${runtime} make SRFI=$srfi SCHEME=$scheme test"
                echo "}"
            } >> "tests.bats"
        done
    fi
done
