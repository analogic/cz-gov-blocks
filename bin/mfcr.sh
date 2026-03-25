#!/bin/sh

set -ex

# naively find link to the article
article=`wget --inet4-only https://mf.gov.cz/cs/kontrola-a-regulace/hazardni-hry/blokace-nepovolenych-internetovych-her/verejna-cast-seznamu-nepovolenych-internetovych-he -O - | perl -lne 'print $1 if /a href="([^"]*?\/zverejnovane-udaje[^"]*?)"/' | head -n 1`
if [ -z "$article" ]
then
    echo "parser error"
    exit 1
fi
article="https://mf.gov.cz${article}"

# find link to csv
file=`wget --inet4-only ${article} -O - | perl -lne 'print $1 if /a href="([^"]*?\.csv[^"]*?)"/' | head -n 1`
if [ -z "$file" ]
then
    echo "parser error"
    exit 1
fi
file="https://mf.gov.cz${file}"

wget --inet4-only "${file}" -O original/mfcr.csv

cat original/mfcr.csv \
    | tail -n +2 \
    | sed 's/[\xa7\x0d ]//g' \
    | awk -F";" '$8 == "" {print $2}' \
    | grep "\S" \
    | sort \
    | uniq \
> csv/mfcr.csv

