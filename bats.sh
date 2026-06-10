#!/bin/sh

implementations="$(cat test_implementations.txt)"
echo "Schemes: $implementations"
srfis="SRFIs: $(cat test_srfis.txt)"
echo "$srfis"

printf "" > "tests.bats"

for srfi in $srfis; do
    if [ -f "srfi/$srfi.sld" ]; then
        for scheme in $implementations; do
            tier=1
            if [ "${scheme}" = "capyscheme" ]; then tier=2; fi
            if [ "${scheme}" = "cyclone" ]; then tier=2; fi
            if [ "${scheme}" = "gambit" ]; then tier=2; fi
            if [ "${scheme}" = "guile" ]; then tier=2; fi
            if [ "${scheme}" = "loko" ]; then tier=2; fi
            if [ "${scheme}" = "meevax" ]; then tier=2; fi
            if [ "${scheme}" = "skint" ]; then tier=2; fi
            if [ "${scheme}" = "tr7" ]; then tier=2; fi

            if [ "${scheme}" = "foment" ]; then tier=3; fi
            if [ "${scheme}" = "mit-scheme" ]; then tier=3; fi
            if [ "${scheme}" = "larceny" ]; then tier=3; fi

            {
                echo "# bats test_tags=${scheme},srfi_${srfi},tier_${tier}"
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
