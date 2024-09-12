if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	wl-restart -n 20 hyprland
fi
