#!/usr/bin/env bash

set -eu -o pipefail

colors=(
  'black'
  'brown'
  'red'
  'orange'
  'yellow'
  'green'
  'blue'
  'violet'
  'grey'
  'white'
)

code() {
  local color="$1"
  local i

  for (( i = 0; i < ${#colors[@]}; i++ )); do
    if [[ "${colors[i]}" == "$color" ]]; then
      echo "$i"
      break
    fi
  done
}

colors() {
  local i

  for (( i = 0; i < ${#colors[@]}; i++ )); do
    echo "${colors[i]}"
  done
}

case "$1" in
  code)   code "$2" ;;
  colors) colors    ;;
esac
