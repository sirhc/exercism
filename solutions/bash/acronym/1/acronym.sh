#!/usr/bin/env bash

set -eu -o pipefail

name="$1"
name="${name//-/ }"            # 'Foo-Bar' -> 'Foo Bar' (hyphens result in multiple words)
name="${name//[^[:alpha:] ]}"  # 'First In, First Out' -> 'First In First Out'
name="${name^^}"               # 'First In First Out' -> 'FIRST IN FIRST OUT'
name=($name)                   # 'FIRST IN FIRST OUT' -> ('FIRST' 'IN' 'FIRST' 'OUT')

# printf '%s\n' "${name[@]}" | cut -c1 | paste -sd '' -

for word in "${name[@]}"; do
  printf '%s' "${word:0:1}"
done
printf '\n'
