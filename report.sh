#!/bin/sh

{
    echo "<table border=1>"
    echo "<thead>"
    echo "<tr><td>RNRS</td><td>SRFI</td><td>Scheme</td></tr>"
    echo "</thead>"
    echo "<tbody>"
} > report.html

for line in $(find . -name "*-line.html"); do
    cat "$line" >> report.html
done

{
    echo "</tbody>"
    echo "</table>"
} >> report.html
