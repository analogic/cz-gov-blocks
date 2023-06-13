#!/bin/sh

set -ex

# naively find link to the article
article=`wget https://www.mfcr.cz/cs/soukromy-sektor/hazardni-hry/seznam-nepovolenych-internetovych-her -O - | perl -lne 'print $1 if /a href="(.*?seznam.*?)"/' | head -n 1`
if [ -z "$article" ]
then
    echo "parser error"
    exit 1
fi
article="https://www.mfcr.cz${article}"

# find link to csv
file=`wget ${article} -O - | perl -lne 'print $1 if /a href="(.*?\.csv.*?)"/' | head -n 1`
if [ -z "$file" ]
then
    echo "parser error"
    exit 1
fi
file="https://www.mfcr.cz${file}"

wget "${file}" -O original/mfcr.csv

cat original/mfcr.csv | tail -n +2 | awk -F";" '{print $1}' > csv/mfcr.csv

