if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
	sx ~/.config/sx/sxrc dwm
fi
