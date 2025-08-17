#!/bin/sh

set -ex

article="https://uskvbl.cz/cs/inspekce/nelegalni-vlp"

file=`wget -q ${article} -O - | perl -lne 'print $1 if /href="(.*?\.csv)"/'`

wget -q "${file}" -O original/uskvbl.csv

cat original/uskvbl.csv \
    | awk -F',' 'NR>1 {
  vymaz=$3
  gsub(/^[ \t\r]+|[ \t\r]+$/,"",vymaz)          # ořež bílé znaky
  if (vymaz=="") {
    u=$1
    gsub(/^[ \t\r]+|[ \t\r]+$/,"",u)            # ořež bílé znaky
    sub(/^https?:\/\//,"",u)                    # smaž http/https
    split(u, a, "/")                             # odděl cestu
    print a[1]                                   # vytiskni host (doménu)
  }
}' > csv/uskvbl.csv

