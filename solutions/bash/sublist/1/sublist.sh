#!/usr/bin/env bash

set -eu -o pipefail

a="$1"
a="${a/\[/}"
a="${a/\]/}"

b="$2"
b="${b/\[/}"
b="${b/\]/}"

if [[ $a == $b ]]; then
  echo 'equal'
  exit
fi

re="\\b$a\\b"
if [[ $b =~ $re ]]; then
  echo 'sublist'
  exit
fi

re="\\b$b\\b"
if [[ $a =~ $re ]]; then
  echo 'superlist'
  exit
fi

echo 'unequal'
