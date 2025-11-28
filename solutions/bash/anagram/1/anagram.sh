#!/usr/bin/env bash

set -eu -o pipefail

letters() {
  local word="${1,,}"
  echo "$word" | fold -w1 | sort | paste -sd '' -
}

target="$1"
words=($2)

for word in "${words[@]}"; do
  # A word is not an anagram of itself.
  if [[ "${word,,}" == "${target,,}" ]]; then
    continue
  fi

  # solemn -> elmnos
  # lemons -> elmnos
  # cherry -> cehrry
  if [[ "$( letters "$word" )" == "$( letters "$target" )" ]]; then
    echo "$word"
  fi
done | paste -sd ' ' -
