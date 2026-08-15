#!/bin/sh

mkdir -p srfis

for srfi in $(seq 1 300); do
    curl -L -o /tmp/srfi.html "https://srfi.schemers.org/srfi-${srfi}"
    title=$(cat /tmp/srfi.html | grep '<title>' | sed 's/<title>//' | sed 's/<\/title>//')
    status=$(cat /tmp/srfi.html | grep 'status:' | awk -F 'em' '{print($2)}' | sed 's/[></]//g')
    if [ "${title}" != "" ]; then
        echo "${status};${title}" > "srfis/${srfi}.txt"
    fi
done
