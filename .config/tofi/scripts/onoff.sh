#!/run/current-system/sw/bin/zsh
RET=$(echo -e "On\nOff" | tofi --prompt-text " " --height 97 --width 125 )
case $RET in
	On) sh ~/.config/tofi/scripts/on.sh ;;
	Off) sh ~/.config/tofi/scripts/off.sh ;;
esac
