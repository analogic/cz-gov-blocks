#!/bin/sh

set -ex

# naively find link to the article
article=`wget --inet4-only https://www.mfcr.cz/cs/soukromy-sektor/hazardni-hry/seznam-nepovolenych-internetovych-her -O - | perl -lne 'print $1 if /a href="([^"]*?\/zverejnovane-udaje[^"]*?)"/' | head -n 1`
if [ -z "$article" ]
then
    echo "parser error"
    exit 1
fi
article="https://www.mfcr.cz${article}"

# find link to csv
file=`wget --inet4-only ${article} -O - | perl -lne 'print $1 if /a href="([^"]*?\.csv[^"]*?)"/' | head -n 1`
if [ -z "$file" ]
then
    echo "parser error"
    exit 1
fi
file="https://www.mfcr.cz${file}"

wget --inet4-only "${file}" -O original/mfcr.csv

cat original/mfcr.csv \
    | tail -n +2 \
    | awk -F";" '$3 == "" {print $1}' \
    | sed 's/ //g' \
    | sort \
    | uniq \
> csv/mfcr.csv

