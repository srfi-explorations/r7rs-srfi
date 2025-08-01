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
    echo "</tr>"
    for logfile in $(find logs -name "*$srfi*")
    do
        echo "<tr>"

        name=$(basename "$logfile" | sed "s/-srfi-$srfi\.log//")
        echo "<td>$name</td>"

        expected_passes=$(grep "# of expected passes" "$logfile" | sed 's/# of expected passes//' | xargs)
        echo "<td>| $expected_passes</td>"

        expected_failures=$(grep "# of expected failures" "$logfile" | sed 's/# of expected failures//' | xargs)
        echo "<td>| $expected_failures</td>"

        failures=$(grep "# of failures" "$logfile" | sed 's/# of failures//' | xargs)
        echo "<td>| $failures</td>"

        skipped=$(grep "# of skipped tests" "$logfile" | sed 's/# of skipped tests//' | xargs)
        echo "<td>| $skipped</td>"

        echo "</tr>"
    done
done
echo "</table>"
