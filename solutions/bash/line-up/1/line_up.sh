#!/usr/bin/env bash

set -eu -o pipefail

name="$1"
number="$2"

suffix() {
  case "$1" in
    1 | *[02-9]1 ) echo 'st' ;;
    2 | *[02-9]2 ) echo 'nd' ;;
    3 | *[02-9]3 ) echo 'rd' ;;
    *            ) echo 'th' ;;
  esac
}

printf '%s, you are the %d%s customer we serve today. Thank you!\n' \
  "$name" \
  "$number" \
  "$( suffix "$number" )"
