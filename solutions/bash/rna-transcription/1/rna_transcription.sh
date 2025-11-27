#!/usr/bin/env bash

set -eu -o pipefail

complement() {
  local nucleotide="$1"

  case "$nucleotide" in
    A) echo U ;;
    T) echo A ;;
    C) echo G ;;
    G) echo C ;;
  esac
}

transcription=''

while read -r nucleotide; do
  complement="$( complement "$nucleotide" )"

  if [[ -z $complement ]]; then
    echo 'Invalid nucleotide detected.' 1>&2
    exit 1
  fi

  transcription="$transcription$complement"
done < <( <<< "${1-}" grep -o '.' )

echo "$transcription"
