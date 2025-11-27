#!/usr/bin/env bash

set -eu -o pipefail

square_of_sum() {
  local sum=0

  for (( i=1; i <= $1; i++ )); do
    sum=$(( sum + i ))
  done

  echo $(( sum * sum ))
}

sum_of_squares() {
  local sum=0

  for (( i=1; i <= $1; i++ )); do
    sum=$(( sum + (i * i) ))
  done

  echo $sum
}

case "$1" in
  square_of_sum)
    square_of_sum "$2"
    ;;
  sum_of_squares)
    sum_of_squares "$2"
    ;;
  difference)
    echo $(( $( square_of_sum "$2" ) - $( sum_of_squares "$2" ) ))
    ;;
esac
