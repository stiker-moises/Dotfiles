#!/bin/bash
RET=$(echo -e "Shutdown\nReboot\nLogout" | tofi --prompt-text " " --height 118 --width 140 )
case $RET in
	Shutdown) systemctl poweroff ;;
	Reboot) systemctl reboot ;;
	Logout) loginctl terminate-user $USER ;;
esac
