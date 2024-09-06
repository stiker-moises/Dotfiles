#!/run/current-system/sw/bin/zsh
RET=$(echo -e "Shutdown\nReboot\nSleep\nHibernate" | tofi --prompt-text " " --height 143 --width 136 )
case $RET in
	Shutdown) systemctl poweroff ;;
	Reboot) systemctl reboot ;;
	Sleep) sleep 0.1 && powerprofilesctl set power-saver ; ( systemctl suspend & hyprlock ) && ( rg -qq 0 /sys/class/power_supply/*/online && powerprofilesctl set power-saver || powerprofilesctl set performance ) ;;
	Hibernate) sleep 0.1 && powerprofilesctl set power-saver ; ( systemctl hibernate & hyprlock ) && ( rg -qq 0 /sys/class/power_supply/*/online && powerprofilesctl set power-saver || powerprofilesctl set performance ) ;;
#	Logout) loginctl terminate-user $USER ;;
esac
