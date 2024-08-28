#!/run/current-system/sw/bin/zsh
RET=$(echo -e "Toggle\nDaylight\nNight\nDim" | tofi --prompt-text " " --height 148 --width 125 )
case $RET in
	Daylight) python ~/.config/tofi/scripts/broadcast_color.py 41134 0 65535 7000 ;;
	Night) python ~/.config/tofi/scripts/broadcast_color.py 41134 0 65535 2500 ;;
	Dim) python ~/.config/tofi/scripts/broadcast_color.py 41134 0 655 2500 ;;
	Toggle) sh ~/.config/tofi/scripts/onoff.sh ;;
esac
