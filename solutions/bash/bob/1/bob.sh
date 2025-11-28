#!/usr/bin/env bash

set -eu -o pipefail

line="${1-}"
line="${line//[^[:alnum:]?!]/}"

if [[ -z "$line" ]]; then
  echo 'Fine. Be that way!'
  exit 0
fi

if [[ "$line" =~ ^[A-Z]+\?$ ]]; then
  echo "Calm down, I know what I'm doing!"
  exit 0
fi

if [[ "$line" =~ \?$ ]]; then
  echo 'Sure.'
  exit 0
fi

line="${line//[^[:alpha:]]/}"

if [[ "$line" =~ ^[A-Z]+$ ]]; then
  echo 'Whoa, chill out!'
  exit 0
fi

echo 'Whatever.'
