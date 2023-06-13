#!/bin/sh

set -ex

wget -q https://opendata.sukl.cz/soubory/NELEGALNI_STRANKY/Nelegalni_stranky_LP.csv -O original/sukl.csv

cat original/sukl.csv \
  | tail -n +2 \
  | awk -F"," '{print $1}' \
  | awk '{print substr($0, 2, length($0) - 2)}' > csv/sukl.csv

