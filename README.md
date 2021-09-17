# Feedreader
Rss feedreader incl. image
Es wird ein HTML erzeugt und im Browser angezeigt (Dillo)

Mit Shell-Check getestet:  
[![Trigger: Push action](https://github.com/dewomser/feedreader/actions/workflows/main.yml/badge.svg)](https://github.com/dewomser/feedreader/actions/workflows/main.yml)
## Usage
* copy both shellscripts in the same dir
* only get-rss1.sh needs to be edited.
* 1.line :path
* last line: browser
## Get RSS an example
./get-rss1.sh worms [https://www.wormser-zeitung.de/rss/lokales/worms/nachrichten-worms](https://www.wormser-zeitung.de/rss/lokales/worms/nachrichten-worms)

oder

./get-rss1.sh mainz [https://www.allgemeine-zeitung.de/rss/lokales/mainz/nachrichten-mainz](https://www.allgemeine-zeitung.de/rss/lokales/mainz/nachrichten-mainz)

