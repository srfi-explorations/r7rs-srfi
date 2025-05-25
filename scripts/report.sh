#!/bin/sh

echo "<table style='border: 1px solid black'>"
for srfi in $(cat tmp/srfis.txt)
do
    echo "<tr style='border: 1px solid black'>"
    echo "<th style='border: 1px solid black'>$srfi</th>"
    echo "<th style='border: 1px solid black'>expected passes</th>"
    echo "<th style='border: 1px solid black'>expected failures</th>"
    echo "<th style='border: 1px solid black'>failures</th>"
    echo "<th style='border: 1px solid black'>skipped tests</th>"
    echo "</tr>"
    for logfile in $(find logs -name "*$srfi*")
    do
        echo "<tr>"

        name=$(basename "$logfile" | sed "s/-srfi-$srfi\.log//")
        echo "<td style='border: 1px solid black'>$name</td>"

        expected_passes=$(grep "# of expected passes" "$logfile" | sed 's/# of expected passes//' | xargs)
        echo "<td style='border: 1px solid black'>$expected_passes</td>"

        expected_failures=$(grep "# of expected failures" "$logfile" | sed 's/# of expected failures//' | xargs)
        echo "<td style='border: 1px solid black'>$expected_failures</td>"

        failures=$(grep "# of failures" "$logfile" | sed 's/# of failures//' | xargs)
        echo "<td style='border: 1px solid black'>$failures</td>"

        skipped=$(grep "# of skipped tests" "$logfile" | sed 's/# of skipped tests//' | xargs)
        echo "<td style='border: 1px solid black'>$skipped</td>"

        echo "</tr>"
    done
done
echo "</table>"
