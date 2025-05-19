#!/bin/sh

set -x

out=`egrep -v '^[^[:space:]]+$' csv/*.csv`

set -ex

if [ -z "$out" ]; then
    echo "No errors found"
    exit 0
fi

echo "$out"
echo "Errors found, exiting..."
exit 1

