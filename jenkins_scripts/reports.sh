#!/bin/sh

mkdir -p reports
gosh -r7 -I . -I ./snow jenkins_scripts/report.scm reports/*.log


