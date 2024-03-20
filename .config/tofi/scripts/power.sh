#!/bin/bash
RET=$(echo -e "Shutdown\nReboot\nLogout" | tofi --prompt-text " " --height 120 --width 130 )
case $RET in
	Shutdown) systemctl poweroff ;;
	Reboot) systemctl reboot ;;
	Logout) loginctl terminate-user $USER ;;
esac
