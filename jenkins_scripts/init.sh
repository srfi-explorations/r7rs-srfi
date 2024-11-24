#!/bin/sh

rm -rf srfi-test && git clone https://github.com/srfi-explorations/srfi-test.git
mkdir -p reports
touch reports/placeholder
echo "<h1>Test results</h1>" > reports/results.html
(cd srfi-test && make clean build)
tree srfi-test
