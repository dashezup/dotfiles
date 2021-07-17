if [ -z "$DISPLAY" ] && [ -z "$WAYLAND_DISPLAY" ] ; then
	case "$TTY" in
		#"/dev/tty1")	sx ~/.config/sx/sxrc dwm;;
		"/dev/tty1")	dbus-launch --sh-syntax --exit-with-session sway;;
		"/dev/tty2")	echo; opcal; echo;;
	esac
fi
