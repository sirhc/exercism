#!/usr/bin/env bash

set -eu -o pipefail

input="${1?missing input}"
span="${2?missing span}"
product=0

product() {
  local series="$1"
  local product=1
  local i
  local digit

  # <<< $series fold -c1 | paste -sd '*' - | bc

  # Native Bash:
  for (( i = 0; i < ${#series}; i++ )); do
    product=$(( product * ${series:i:1} ))
  done
  echo "$product"
}

if (( span > ${#input} )); then
  echo 'span must not exceed string length' 1>&2
  exit 1
fi

if [[ $input =~ [^0-9] ]]; then
  echo 'input must only contain digits' 1>&2
  exit 1
fi

if (( span < 0 )); then
  echo 'span must not be negative' 1>&2
  exit 1
fi

for (( i = 0; i <= ${#input} - span; i++ )); do
  temp="$( product "${input:i:span}" )"

  if (( temp > product )); then
    product="$temp"
  fi
done

echo "$product"
