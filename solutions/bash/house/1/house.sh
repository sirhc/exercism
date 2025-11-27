#!/usr/bin/env bash

set -eu -o pipefail

nouns=(
  'house '
  $'malt\n'
  $'rat\n'
  $'cat\n'
  $'dog\n'
  $'cow with the crumpled horn\n'
  $'maiden all forlorn\n'
  $'man all tattered and torn\n'
  $'priest all shaven and shorn\n'
  $'rooster that crowed in the morn\n'
  $'farmer sowing his corn\n'
  $'horse and the hound and the horn\n'
)

verbs=(
  'Jack built.'
  'lay in '
  'ate '
  'killed '
  'worried '
  'tossed '
  'milked '
  'kissed '
  'married '
  'woke '
  'kept '
  'belonged to '
)

if (( $1 < 1 || $1 > ${#nouns[@]} )); then
  echo "error: $1: invalid verse range" 1>&2
  exit 1
fi

if (( $2 < 1 || $2 > ${#nouns[@]} )); then
  echo "error: $2: invalid verse range" 1>&2
  exit 1
fi

for (( verse=$1; verse<=$2; verse++ )); do
  printf 'This is '

  for (( i=verse-1; i>=0; i-- )); do
    printf 'the %sthat %s' "${nouns[i]}" "${verbs[i]}"
  done

  printf '\n'

  if (( verse < $2 )); then
    printf '\n'
  fi
done
