#!/bin/sh

echo "\$TTL 60
@           IN SOA  localhost. root.localhost.  (
            2   ; serial
            3H  ; refresh
            1H  ; retry
            1W  ; expiry
            1H) ; minimum
      IN    NS    localhost.
"

while read line
do
  punycode=$(idn "$line")
  echo "$punycode CNAME ."
  echo "*.$punycode CNAME ."
done < "${1:-/dev/stdin}"

