#!/bin/sh


streamerfunc() {
    streamer=$(printf "xQcOW\nTrihex\nDestiny\nElajjaz\nLilyPichu\nWillNeff" | dmenu -fn "Liberation Mono-13" -nb "#282a36" -nf "#f8f8f2" -sb "#bd93f9" -i -l 10)
    [ -z "$streamer" ] && notify-send "Nothing selected, exiting..." && exit 1
    notify-send "Opening $streamer's Stream..."
    mpv "https://www.twitch.tv/$streamer"
    [ $? -eq 2 ] && notify-send "$streamer is offline ☹️" && exit 1
}


streamerfunc
