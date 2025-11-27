#!/usr/bin/env bash

# set -eu -o pipefail  # avoid `bad array subscript`

declare -A colors=(
  ['black']=0
  ['brown']=1
  ['red']=2
  ['orange']=3
  ['yellow']=4
  ['green']=5
  ['blue']=6
  ['violet']=7
  ['grey']=8
  ['white']=9
)

one="${colors[$1]}"
two="${colors[$2]}"

if [[ -z "$one" || -z "$two" ]]; then
  echo 'invalid color' 1>&2
  exit 1
fi

echo "$one$two" | sed -e 's/^0//'
