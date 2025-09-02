#!/bin/sh

set -ex

wget --no-check-certificate -q https://opendata.sukl.cz/soubory/NELEGALNI_STRANKY/Nelegalni_stranky_LP.csv -O original/sukl.csv

cat original/sukl.csv \
  | tail -n +2 \
  | awk -F"," 'length($3) <= 2 {print $1}' \
  | awk '{print substr($0, 2, length($0) - 2)}' \
  | sed 's/ //g' > csv/sukl.csv

