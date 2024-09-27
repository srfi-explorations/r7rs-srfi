#!/usr/bin/env bash

name=${1}
scheme_command=${2}
library_command=${3}
srfi_number=${4}

grep "# of" *.log >> reports/results.html

