#!/bin/sh

echo "<table>"
for srfi in $(cat tmp/srfis.txt)
do
    echo "<tr><th>$srfi</th><th>expected passes</th><th>expected failures</th></tr>"
    for logfile in $(find logs -name "*$srfi*")
    do
        name=$(basename "$logfile" | sed "s/-srfi-$srfi\.log//")
        expected_passes=$(grep "# of expected passes" "$logfile" | sed 's/# of expected passes//' | xargs)

        printf "<tr><td>$name</td>"
        echo "<td>$expected_passes</td></tr>"
    done
done
echo "</table>"
