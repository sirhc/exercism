#!/usr/bin/env bash

set -eu -o pipefail

if [[ $# -ne 1 || ! $1 =~ ^[0-9]+$ ]]; then
  echo "Usage: $0 <year>" 1>&2
  exit 1
fi

year="$1"

if (( year % 4 == 0 && (year % 100 != 0 || year % 400 == 0) )); then
  echo 'true'
else
  echo 'false'
fi
