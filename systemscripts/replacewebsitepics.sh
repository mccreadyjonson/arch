#!/bin/sh
#Requires text file with names of pictures that you want, seperated by newlines,
#gives output that you can paste into your website html.


[ -z "$1" ] && notify-send "Please enter text file..." && exit


thetext=$(printf "<a href="pics/title1" target"_blank">
            <img src="pics/thumbs/title2">
            </a>")


while IFS= read -r line; do
    realname=$(echo "$line")
    thumbname=$(echo "$realname" | sed 's/^/thumbnail-/g')
    echo "$thetext" | sed "s/title1/$realname/;s/title2/$thumbname/" >> correctedforwebsite.txt
done < "$1"
