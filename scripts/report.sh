#!/bin/sh


echo "<table>"
for srfi in $(cat srfis.scm | sed 's/(//' | sed 's/)//')
do
    echo "<tr>"
    echo "<th>$srfi</th>"
    echo "<th>| expected passes</th>"
    echo "<th>| expected failures</th>"
    echo "<th>| failures</th>"
    echo "<th>| skipped tests</th>"
    echo "<th>| time</th>"
    echo "</tr>"
    for name in $(docker run retropikzel1/compile-r7rs sh -c "compile-r7rs --list-r7rs-schemes | sed 's/gambit//' " | xargs)
    do
        echo "<tr>"

        logfile="logs/$name-srfi-$srfi.log"
        outputfile="logs/$name-srfi-$srfi-test-output.log"

        if [ -f "$outputfile" ]
        then
            time="$(grep -I "elapsed" "$outputfile" | awk '{ split($0,a,"user"); print(a[1]," * 1000") }' | bc | xargs ) ms"
        else
            time=""
        fi

        echo "<td>$name</td>"

        if [ -f "$logfile" ]
        then
            expected_passes=$(grep -I "# of expected passes" "$logfile" | sed 's/# of expected passes//' | xargs)
            echo "<td>| $expected_passes</td>"

            expected_failures=$(grep -I "# of expected failures" "$logfile" | sed 's/# of expected failures//' | xargs)
            echo "<td>| $expected_failures</td>"

            failures=$(grep -I "# of failures" "$logfile" | sed 's/# of failures//' | xargs)
            echo "<td>| $failures</td>"

            skipped=$(grep -I "# of skipped tests" "$logfile" | sed 's/# of skipped tests//' | xargs)
            echo "<td>| $skipped</td>"

            echo "<td>| $time</td>"

            echo "</tr>"
        else
            echo "<td>|</td>"
            echo "<td>|</td>"
            echo "<td>|</td>"
            echo "<td>|</td>"
            echo "<td>|</td>"
        fi
    done
done
echo "</table>"
