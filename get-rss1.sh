#!/bin/bash
cd "$HOME"/bin/wz-test || exit

wget --quiet -O "$1".txt "$2"

./parse1.sh "$1".txt > "$1".html

#Hier Browser einstellen
#/usr/bin/dillo "$1".html
#oder default Browser
xdg-open "$1".html
