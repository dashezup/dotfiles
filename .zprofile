PROXYCHAINS_QUIET_MODE=1
PATH="$HOME/.local/bin:$PATH"
if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
	sx ~/.config/sx/sxrc dwm
fi
