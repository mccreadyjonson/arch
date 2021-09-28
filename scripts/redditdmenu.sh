#!/bin/sh

selection=$(printf "stallmanwasright
mousereview
livestreamfail
valorant
valorantcompetitive
bash
onions
tor
imaginarysliceoflife
commandline
thinkpad
cyberpunk
privacytoolsIO
privacyguides
privacy
destiny
linux
politics
linuxmasterrace
linuxquestions
archlinux
artixlinux
voidlinux" | dmenu -fn "Liberation Mono-13" -nb "#282a36" -nf "#f8f8f2" -sb "#bd93f9" -i -l 20)

url="https://teddit.net/r/""$selection"

[ -z "$selection" ] && notify-send "Nothing selected..." && exit

#torornot=$(printf "Yes\nNo" | dmenu -i -fn "Liberation Mono-13" -l 2 -p "Would you like to use tor browser?")

#if [ "$torornot" = "Yes" ]; then
#    /home/dan/.local/share/torbrowser/tbb/x86_64/tor-browser_en-US/Browser/start-tor-browser "$url" &
#elif [ "$(pgrep $BROWSER)" ]; then
#    $BROWSER "$url" &
#else
#    qutebrowser "$url" &
#fi
notify-send "Opening r/$selection"
$BROWSER "$url"
