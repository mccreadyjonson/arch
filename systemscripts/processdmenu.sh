#!/bin/sh


chosen="$(ps -axco pid,comm | dmenu -fn "Liberation Mono-13" -nb "#282a36" -nf "#f8f8f2" -sb "#bd93f9" -l 15 -p "What process to kill? " -i)"
[ -z "$chosen" ] && notify-send "Nothing selected... exiting" && exit


process=$(echo "$chosen" | awk '{print $1}')
kill "$process" && notify-send "$process... W A S T E D"
