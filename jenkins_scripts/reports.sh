#!/bin/sh

mkdir -p reports
gosh -r7 -I . -I ./snow report.scm reports/*.log


