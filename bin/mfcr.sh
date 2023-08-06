#!/bin/sh

set -ex

# test mfcr stupidnes
curl -v https://www.mfcr.cz/assets/attachments/Zverejnovane-udaje-ze-Seznamu-nepovolenych-internetovych-her_v72.csv

# naively find link to the article
article=`wget https://www.mfcr.cz/cs/soukromy-sektor/hazardni-hry/seznam-nepovolenych-internetovych-her -O - | perl -lne 'print $1 if /a href="(.*?\/zverejnovane-udaje.*?)"/' | head -n 1`
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

wget --inet4-only "${file}" -O original/mfcr.csv

cat original/mfcr.csv | tail -n +2 | awk -F";" '{print $1}' | sed 's/ //g' > csv/mfcr.csv

