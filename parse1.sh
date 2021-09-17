#!/bin/bash
zaehl=1

xmlgetnext () {
   local IFS='>'
   # shellcheck disable=SC2162
   read -d '<' TAG VALUE
}
# shellcheck disable=SC2002
cat "$1" | while xmlgetnext ; do
   case $TAG in
      'item')
         title=''
         link=''
         pubDate=''
         description=''
         enclosure=''
        
         
         ;;
      'title')
         title="$VALUE"
         ;;
      'link')
         link="$VALUE"
         #link=$( echo "$VALUE" | sed -e 's/\.de/\.de\/amp/g')
         alt=$(curl "$link" |grep '[[:blank:]][[:blank:]]alt=' | sed -e 's/alt=/\n/g')
         bild=$(curl "$link" |grep -E -o 'large],.*1020x510.*large]\"'|sed -e  's/x*large]/\n/g'| tr -d  ,\"[
)
         #grep -o 'consectetuer.*elit'
         # option | tail -n +3 | head -n 2
         ;;
      'pubDate')
         # convert pubDate format for <time datetime="">
         datetime=$( date --date "$VALUE" --iso-8601=minutes )
         pubDate=$( date --date "$VALUE" '+%d.%m %Y  %H:%M%P Uhr' )
         ;;
      'description')
         # convert '&lt;' and '&gt;' to '<' and '>'
         description=$( echo "$VALUE" | sed -e 's/&lt;/</g' -e 's/&gt;/>/g' )
         enclosure=0

        ;;
        
          enclosure*)  
          enclosure=1
         
         ;;
      
  '/item')
      
    
         cat<<EOF
<article>
<h3><a href="$link">$title</a></h3>
<p>$description
<span class="post-date">hoch geladen am <time
datetime="$datetime">$pubDate</time></span></p>
<p>$alt</p>
<br><a href="$bild">Bild in groß</a>"

</article>
EOF

if [ $enclosure -eq 1 ] ; then
# shellcheck disable=SC2002

cat "$1" | grep -e enclosure | sed -n "$zaehl"p | sed -e 's/<enclosure//g' -e 's/<\/item>//g' -e 's/length=\"0\"\///g' -e 's/type=\"image\/jpeg\" url/<img src/g'
zaehl=$((zaehl+1)) 

fi

  ;;
      esac
    
done

sleep 2

