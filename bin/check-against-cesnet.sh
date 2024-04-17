#!/bin/sh

set -e

curl -s https://raw.githubusercontent.com/analogic/cz-gov-blocks/master/rpz/all.rpz \
    | grep -v "*" \
    | grep CNAME \
    | tr '[:upper:]' '[:lower:]' \
    | awk -F ' ' '{print $1}' \
    | sort > /tmp/my.rpz

dig rpz.cesnet.cz axfr @nsa.cesnet.cz \
    | grep poker.cesnet.cz \
    | awk -F ' ' '{print $1}' \
    | sed 's/\.rpz\.cesnet\.cz\.//' \
    | sort > /tmp/cesnet.rpz

diff /tmp/my.rpz /tmp/cesnet.rpz
