#!/usr/bin/env bash

if [ "${1}" = "" ]
then
    SRFI="64"
else
    SRFI="${1}"
fi

for scm in $(compile-scheme --list-r7rs-except larceny)
do
    printf "Test ${scm} SRFI-${SRFI}: "
    make SCHEME=${scm} SRFI=${SRFI} test-r7rs-docker 2>&1 > /dev/null
    if [ "$?" = "0" ]; then echo "PASS"; else echo "FAIL"; fi
done

