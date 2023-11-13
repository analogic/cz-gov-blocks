#!/bin/sh

set -ex

article="https://uskvbl.cz/cs/inspekce/nelegalni-vlp"

file=`wget -q ${article} -O - | perl -lne 'print $1 if /href="(.*?\.csv)"/'`

wget -q "${file}" -O original/uskvbl.csv

cat original/uskvbl.csv \
    | tail -n +2 \
    | awk -F";" 'length($3) <= 2 {print $1}' \
    | sed 's/ //g' \
    | awk NF \
> csv/uskvbl.csv

