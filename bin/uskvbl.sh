#!/bin/sh

set -ex

article="https://uskvbl.cz/cs/inspekce/nelegalni-vlp"

# find link to csv
file=`wget -q ${article} -O - | perl -lne 'print $1 if /href="(.*?\.xlsx)"/'`

wget -q "${file}" -O original/uskvbl.xlsx

pip install xlsx2csv

xlsx2csv original/uskvbl.xlsx | tail -n +2 | awk -F"," '{print $1}' | sed 's/ //g' > csv/uskvbl.csv

