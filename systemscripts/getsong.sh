#!/bin/sh


[ -z "$1" ] && notify-send "No link" && exit


songinfo() {

    echo "What would you like the artist directory to be called? "; read -r dirartistname
    echo "What would you like the song file to be called? "; read -r filename

    echo "What is the artist name? " ; read -r artistname
    echo "What is the song name? " ; read -r songname
    rightname="$filename"".mp3"
}


songplacement() {
    if [ -e "$HOME"/music/"$dirartistname" ]; then
        cd "$HOME"/music/"$dirartistname" || exit
        musicpath="$PWD"
        youtube-dl -f m4a "$1"
        cd "$HOME"/downloadmusic || exit
        mv ./* "$filename"
        mv "$filename" "$musicpath"
        cd "$musicpath" || exit
        ffmpeg -i "$filename" -vn -b:a 320k "$rightname" 2> /dev/null
        eyeD3 -Q --remove-all -a "$artistname" -t "$songname" "$rightname"
        rm "$filename"
    else
        mkdir -p "$HOME"/music/"$dirartistname"
        cd "$HOME"/music/"$dirartistname" || exit
        musicpath="$PWD"
        youtube-dl -f m4a "$1"
        cd "$HOME"/downloadmusic || exit
        mv ./* "$filename"
        mv "$filename" "$musicpath"
        cd "$musicpath" || exit
        ffmpeg -i "$filename" -vn -b:a 320k "$rightname" 2> /dev/null
        eyeD3 -Q --remove-all -a "$artistname" -t "$songname" "$rightname"
        rm "$filename"
    fi
}


songinfo
songplacement $1
