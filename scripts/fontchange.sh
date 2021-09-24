#!/bin/sh
#location of file you wish to edit
file="/home/dan/.config/alacritty/alacritty.yml"


#give dmenu list of fonts to choose from
choice=$(fc-list | cut -f2 -d: | sort -u | sed "s/^ *//" | dmenu -fn "Liberation Mono-13" -nb "#000000" -nf "#ffffff" -sb "#0066ff" -i -l 30)
[ -z "$choice" ] && notify-send "Nothing selected, exiting..." && exit


#annoyingly extract the font name
currentfont=$(sed -n '/family/ {p;q}' "$file")
currentfont="${currentfont#????????????}"


#replace old font with new
sed -i "s/$currentfont/$choice/g" "$file"
