#!/bin/bash
RET=$(echo -e "On\nOff" | tofi --prompt-text " " --height 118 --width 140 )
case $RET in
	On) sh ~/.config/tofi/scripts/on.sh ;;
	Off) sh ~/.config/tofi/scripts/off.sh ;;
esac
