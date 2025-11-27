#!/usr/bin/env bash

set -eu -o pipefail

calc() {
  local number="$1"
  local length=${#number}
  local sum=0

  for (( i=0; i < length; i++ )); do
    sum=$(( sum + (number % 10) ** length ))
    number=$(( number / 10 ))
  done

  echo "$sum"
}

if [[ "$( calc "$1" )" == "$1" ]]; then
  echo true
else
  echo false
fi
