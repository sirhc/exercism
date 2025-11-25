#!/usr/bin/env bash

reverse_string() {
  local string="$1"
  local length=${#string}

  while [[ $length -gt 0 ]]; do
    length=$(( length - 1 ))
    printf '%s' "${string:length:1}"
  done

  printf '\n'
}

reverse_string "$*"
