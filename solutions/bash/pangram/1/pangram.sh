#!/usr/bin/env bash

set -eu -o pipefail

sentence="$*"
sentence="${sentence,,}"         # convert to lowercase ("Foo Bar!" -> "foo bar!")
sentence="${sentence//[^a-z]/}"  # remove non-letter characters ("foo bar!" -> "foobar")

# Split the sentence into individual characters, sort them uniquely, and count them.

if [[ "$( <<< "$sentence" fold -c1 | sort -u | grep -c . )" -eq 26 ]]; then
  echo 'true'
else
  echo 'false'
fi
