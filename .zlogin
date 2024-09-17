if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
	wl-restart -n 20 hyprland
fi
