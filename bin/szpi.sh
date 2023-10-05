#!/bin/sh

set -ex

wget -q "https://www.szpi.gov.cz/soubor/blokovane-weby-szpi.aspx" -O original/szpi.csv

cat original/szpi.csv | tail -n +2 | awk -F"," '{print $1}' | sed 's/[ "]//g' | awk NF > csv/szpi.csv
