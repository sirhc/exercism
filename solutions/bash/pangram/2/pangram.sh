#!/usr/bin/env bash

set -eu -o pipefail

sentence="$*"
sentence="${sentence,,}"         # convert to lowercase ("Foo Bar!" -> "foo bar!")
sentence="${sentence//[^a-z]/}"  # remove non-letter characters ("foo bar!" -> "foobar")

# Split the sentence into individual characters, sort them uniquely, and count them.
#
# Note: The version of `fold(1)` used by the Exercism system doesn't support the `-c`
# flag. However, the instructions only include the 26 letters of the English alphabet,
# so each character is only a single byte.

if [[ "$( <<< "$sentence" fold -b1 | sort -u | grep -c . )" -eq 26 ]]; then
  echo 'true'
else
  echo 'false'
fi
