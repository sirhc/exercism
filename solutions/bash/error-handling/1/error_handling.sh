#!/usr/bin/env bash

set -euo pipefail

if [[ $# -eq 1 ]]; then
    echo "Hello, $1"
else
    echo "Usage: $(basename "$0") <person>" 1>&2
    exit 1
fi
