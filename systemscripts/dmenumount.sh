#!/bin/sh

#Get a list of mountable drives and exit if there are no drives
mountabledrives=$(lsblk -lp | awk '/part[[:blank:]]$/ {print $1, "("$4")"}')
[ -z "$mountabledrives" ] && exit


#let user select one of the mountable drives
#if none chosen then exit.
userselection=$(echo "$mountabledrives" | dmenu -i -fn "Liberation Mono-13" -nb "#000000" -nf "#ffffff" -sb "#0066ff" -l 5 -p "Enter drive to mount: " | awk '{print $1}')
[ -z "$userselection" ] && notify-send "Nothing selected, exiting..." && exit
getfiletype=$(lsblk -o "fstype" "$userselection" | sed -n '2p')
[ -z "$userselection" ] && exit


#give user a list of possible locations to mount the drive
#if mount location does not exist then let user create it.
chosenmount=$(printf "/home/dan/storagedrive\n/mnt/usbstick" | dmenu -i -fn "Liberation Mono-13" -nb "#000000" -nf "#ffffff" -sb "#0066ff" -l 5 -p "Choose where to mount the drive: ")
if [ ! -d "$chosenmount" ]; then
    newdir=$(printf "Yes\nNo" | dmenu -fn "Liberation Mono-13" -nb "#000000" -nf "#ffffff" -sb "#0066ff" -i -p "Mount point does not exist, create it?")
    if [ "$newdir" = "Yes" ];then
        sudo -A mkdir -p "$chosenmount"
    else
        notify-send "Nothing selected, exiting... " && exit
    fi
fi


#mount the drive with mount option "-o umask=0000"
case "$getfiletype" in
    "vfat") sudo mount -t  vfat "$userselection" "$chosenmount" -o umask=000 && notify-send "Mounting..." ;;
    "iso9660") sudo mount -t iso9660 "$userselection" "$chosenmount" -o umask=000 && notify-send "Mounting..." ;;
    *) sudo mount "$userselection" "$chosenmount" && notify-send "Mounting..." ;;
esac

