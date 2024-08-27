#!/run/current-system/sw/bin/zsh
RET=$(echo -e "Shutdown\nReboot\nSleep\nLogout" | tofi --prompt-text " " --height 143 --width 125 )
case $RET in
	Shutdown) systemctl poweroff ;;
	Reboot) systemctl reboot ;;
	Sleep) sleep 0.1 && systemctl suspend & swaylock --screenshot --effect-blur 7x5 --effect-vignette 1:1 ;;
	Logout) loginctl terminate-user $USER ;;
esac
