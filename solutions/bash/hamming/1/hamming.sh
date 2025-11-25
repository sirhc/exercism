#!/usr/bin/env bash

set -euo pipefail

if [[ $# -ne 2 ]]; then
    echo "Usage: $(basename "$0") <string1> <string2>" 1>&2
    exit 1
fi

if [[ ${#1} -ne ${#2} ]]; then
    echo "$(basename "$0"): strands must be of equal length" 1>&2
    exit 1
fi

if [[ "$1" = "$2" ]]; then
    echo '0'
    exit 0
fi

d=0
for (( i=0; i < ${#1}; i++ )); do
    if [[ "${1:i:1}" != "${2:i:1}" ]]; then
        d=$(( d + 1 ))
    fi
done
echo "$d"
