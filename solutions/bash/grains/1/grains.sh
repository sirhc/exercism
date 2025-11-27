#!/usr/bin/env bash

set -eu -o pipefail

case "$1" in
  total)
    bc <<< '2^64 - 1'
    ;;
  *)
    if [[ $1 -ge 1 && $1 -le 64 ]]; then
      bc <<< "2^($1 - 1)"
      exit 0
    fi

    echo 'Error: invalid input' 1>&2
    exit 1
    ;;
esac
