#!/usr/bin/env bash

set -eu -o pipefail

value() {
  case "${1,,}" in
    [aeioulnrst] ) echo  1 ;;
    [dg]         ) echo  2 ;;
    [bcmp]       ) echo  3 ;;
    [fhvwy]      ) echo  4 ;;
    [k]          ) echo  5 ;;
    [jx]         ) echo  8 ;;
    [qz]         ) echo 10 ;;
  esac
}

score=0

while read -r letter; do
  score=$(( score + $( value "$letter" ) ))
done < <( grep -o . <<< "${1-}" )

echo "$score"
