#!/bin/sh

[ ! -d "/usr/share/doc/arch-wiki" ] && notify-send "arch-wiki-docs package needed..." && exit 1

selection=$(find /usr/share/doc/arch-wiki/html/en -printf "%f\n" | dmenu -fn "Liberation Mono-13" -nb "#000000" -nf "#ffffff" -sb "#0066ff" -i -l 20)

[ -z "$selection" ] && notify-send "Nothing selected... exiting" && exit 1

firefox "/usr/share/doc/arch-wiki/html/en/$selection"
