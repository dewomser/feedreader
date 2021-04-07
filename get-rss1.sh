#!/bin/bash
cd /home/karl/bin/wz-test || exit

wget --quiet -O "$1".txt "$2"

./parse1.sh "$1".txt > "$1".html

/usr/bin/dillo "$1".html
