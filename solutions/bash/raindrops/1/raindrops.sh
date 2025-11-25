#!/usr/bin/env bash

set -euo pipefail

matched=

[[ $(( $1 % 3 )) -eq 0 ]] && { printf 'Pling'; matched=1; }
[[ $(( $1 % 5 )) -eq 0 ]] && { printf 'Plang'; matched=1; }
[[ $(( $1 % 7 )) -eq 0 ]] && { printf 'Plong'; matched=1; }
[[ -z $matched ]] && printf '%s' "$1"
printf '\n'
