#!/usr/bin/env bash

set -eu -o pipefail

list_allergies() {
  local score="$1"

  [[ $(( (score /   1) % 2 )) -eq 1 ]] && printf 'eggs\n'         || true
  [[ $(( (score /   2) % 2 )) -eq 1 ]] && printf 'peanuts\n'      || true
  [[ $(( (score /   4) % 2 )) -eq 1 ]] && printf 'shellfish\n'    || true
  [[ $(( (score /   8) % 2 )) -eq 1 ]] && printf 'strawberries\n' || true
  [[ $(( (score /  16) % 2 )) -eq 1 ]] && printf 'tomatoes\n'     || true
  [[ $(( (score /  32) % 2 )) -eq 1 ]] && printf 'chocolate\n'    || true
  [[ $(( (score /  64) % 2 )) -eq 1 ]] && printf 'pollen\n'       || true
  [[ $(( (score / 128) % 2 )) -eq 1 ]] && printf 'cats\n'         || true
}

score="$1"
action="$2"

case "$action" in
  allergic_to)
    allergen="$3"

    if list_allergies "$score" | grep -q "^$allergen\$"; then
      printf 'true\n'
    else
      printf 'false\n'
    fi
    ;;
  list)
    list_allergies "$score" | paste -sd ' ' -
    ;;
esac
