#!/bin/bash
RET=$(echo -e "On\nOff" | tofi --prompt-text " " --height 94 --width 125 )
case $RET in
	On) sh ~/.config/tofi/scripts/on.sh ;;
	Off) sh ~/.config/tofi/scripts/off.sh ;;
esac
