#!/bin/sh

echo "<table>"
for srfi in $(cat tmp/srfis.txt)
do
    echo "<tr><th>$srfi</th>"
    echo "<th>expected passes</th>"
    echo "<th>expected failures</th>"
    echo "<th>failures</th>"
    echo "<th>skipped tests</th>"
    echo "</tr>"
    for logfile in $(find logs -name "*$srfi*")
    do
        name=$(basename "$logfile" | sed "s/-srfi-$srfi\.log//")

        printf "<tr><td>$name</td>"

        expected_passes=$(grep "# of expected passes" "$logfile" | sed 's/# of expected passes//' | xargs)
        echo "<td>$expected_passes</td></tr>"

        expected_failures=$(grep "# of expected failures" "$logfile" | sed 's/# of expected failures//' | xargs)
        echo "<td>$expected_failures</td></tr>"

        failures=$(grep "# of failures" "$logfile" | sed 's/# of failures//' | xargs)
        echo "<td>$failures</td></tr>"

        skipped=$(grep "# of skipped tests" "$logfile" | sed 's/# of skipped tests//' | xargs)
        echo "<td>$skipped</td></tr>"
    done
done
echo "</table>"
