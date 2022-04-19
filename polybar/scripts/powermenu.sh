#!/usr/bin/env bash

dir="~/.config/rofi"

uptime=$(uptime -p | sed -e 's/up //g')
rofi_command="rofi -theme $dir/powermenu.rasi"

# Options
shutdown="  Shutdown"
reboot=" ﯩ Reboot"
lock="  Lock"
logout="  Logout"

options="$lock\n$logout\n$reboot\n$shutdown"

# Confirmation
confirm_exit() {
    rofi -dmenu -i -no-fixed-num-lines -p "Are you sure? : " -theme $dir/confirm.rasi
}

# Message
msg() {
    rofi -theme "$dir/confirm.rasi" -e "Available Options  -  yes / y / no / n"
}

chosen="$(echo -e "$options" | $rofi_command -p "Uptime: $uptime" -dmenu -selected-row 0)"

case $chosen in
    $shutdown)
        ans=$(confirm_exit &)
        if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
            systemctl poweroff
        elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
            exit 0
        else
            msg
        fi
        ;;
    $reboot)
        ans=$(confirm_exit &)
        if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
            systemctl reboot
        elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
            exit 0
        else
            msg
        fi
        ;;
    $lock)
        betterlockscreen -l dimblur --display 1
        ;;
    $logout)
        ans=$(confirm_exit &)
        if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
            i3-msg exit
        elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
            exit 0
        else
            msg
        fi
        ;;
esac
