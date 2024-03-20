#!/bin/bash
RET=$(echo -e "Bedroom\nBathroom\nIcecream" | tofi --prompt-text " " --height 122 --width 125 )
case $RET in
	Bedroom) python ~/.config/tofi/scripts/bedroom-on.py ;;
	Bathroom) python ~/.config/tofi/scripts/bathroom-on.py ;;
	Icecream) python ~/.config/tofi/scripts/icecream-on.py ;;
esac
