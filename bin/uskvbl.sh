#!/bin/sh

set -ex

article="https://uskvbl.cz/cs/inspekce/nelegalni-vlp"

# find link to csv
file=`wget -q ${article} -O - | perl -lne 'print $1 if /href="(.*?\.csv)"/'`

wget -q "${file}" -O original/uskvbl.csv

cat original/uskvbl.csv | tail -n +2 | awk -F";" '{print $1}' | sed 's/ //g' | grep "\S" > csv/uskvbl.csv

