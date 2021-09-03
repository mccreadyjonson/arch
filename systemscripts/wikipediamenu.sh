#!/bin/sh

userquery="$(echo "" | dmenu -fn "Liberation Mono-13" -nb "#282a36" -nf "#f8f8f2" -sb "#bd93f9" -p "Search: " | sed 's/ /_/g')"
[ -z "$userquery" ] && notify-send "Nothing selected... exiting" && exit 
searchurl="https://en.wikipedia.org/w/index.php?search=$userquery&title=Special%3ASearch&profile=default&fulltext=1&ns0=1"

curl -s "$searchurl" > /tmp/wikisearchurl

#get article names, idk how this works but w/e
{ grep -io '<a href="/wiki/[a-zA-Z0-9_()-]\+' | awk '!seen[$0]++ {if(NR>1)print}' | cut -d'/' -f3; } < /tmp/wikisearchurl > /tmp/wikinames


chosen="$( dmenu -fn "Liberation Mono-13" -nb "#282a36" -nf "#f8f8f2" -sb "#bd93f9" -l 10 -p "Choose one: " < /tmp/wikinames)"
[ -z "$chosen" ] && notify-send "Nothing selected... exiting" && exit 
echo "$chosen"

$BROWSER "https://en.wikipedia.org/wiki/$chosen"






