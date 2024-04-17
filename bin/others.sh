#!/bin/sh

set -ex

cat original/others.csv \
  | tail -n +2 \
  | awk -F";" 'length($3) <= 2 {print $1}' \
  | sed 's/ //g' > csv/others.csv

