#!/bin/sh

set -ex

# get github's IP address
curl ifconfig.me > /tmp/ip
cat /tmp/ip

proxy="https://analogic.cz/mfcr.php?url="

# naively find link to the article
article=`wget --inet4-only ${proxy}/cs/kontrola-a-regulace/hazardni-hry/seznam-nepovolenych-internetovych-her -O - | perl -lne 'print $1 if /a href="([^"]*?\/zverejnovane-udaje[^"]*?)"/' | head -n 1`
if [ -z "$article" ]
then
    echo "parser error"
    exit 1
fi
article="${proxy}${article}"

# find link to csv
file=`wget --inet4-only ${article} -O - | perl -lne 'print $1 if /a href="([^"]*?\.csv[^"]*?)"/' | head -n 1`
if [ -z "$file" ]
then
    echo "parser error"
    exit 1
fi
file="${proxy}${file}"

wget --inet4-only "${file}" -O original/mfcr.csv

cat original/mfcr.csv \
    | tail -n +2 \
    | awk -F";" '$3 == "" {print $1}' \
    | sed 's/ //g' \
    | sort \
    | uniq \
> csv/mfcr.csv

