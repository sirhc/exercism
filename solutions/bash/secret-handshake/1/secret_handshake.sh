#!/usr/bin/env bash

{
  [[ $(( $1     % 2 )) -eq 1 ]] && echo 'wink'
  [[ $(( $1 / 2 % 2 )) -eq 1 ]] && echo 'double blink'
  [[ $(( $1 / 4 % 2 )) -eq 1 ]] && echo 'close your eyes'
  [[ $(( $1 / 8 % 2 )) -eq 1 ]] && echo 'jump'
} | {
  [[ $(( $1 / 16 % 2 )) -eq 1 ]] && tac || cat
} | paste -sd ',' -
