#!/bin/sh

# xlsfonts | grep terminus-bold | grep iso10646
FONT="-xos4-terminus-bold-r-normal--16-160-72-72-c-80-iso10646-1"

get_output() {
	while true; do
		# time
		TIME=$(date -u +%FT%TZ)
		# current workspace
		CURRENT_WS=$(xprop -root _NET_CURRENT_DESKTOP | sed -e 's/.* = //')
		# window name
		CURRENT_WINDOW_ID=$(xprop -root _NET_ACTIVE_WINDOW | sed 's/.* window id # //')
		[ "$CURRENT_WINDOW_ID" != "0x0" ] && CURRENT_WINDOW_NAME=$(xprop -id "$CURRENT_WINDOW_ID)" WM_NAME | sed 's/.* = "\(.*\)"/\1/')
		# all workspaces
		CLIENT_LIST=$(xprop -root _NET_CLIENT_LIST | sed 's/.*: window id # //; s/, / /g')
		WS=$(for id in $CLIENT_LIST; do
			xprop -id "$id" _NET_WM_DESKTOP | sed 's/.* = //;'
		done | sort -hu | sed "s/^/ /; s/$/ /; s/ $CURRENT_WS /%{F#3498db}[$CURRENT_WS]%{F-}%{B-}/" | tr -d '\n')
		echo "$WS" | grep $CURRENT_WS >/dev/null 2>&1
		[ "$?" -ne 0 ] && WS="$WS($CURRENT_WS)"
		# output
		echo " $WS -  %{F#ecf0f1}$CURRENT_WINDOW_NAME%{B-} %{r}%{F#b2babb}%{B#212f3d} $TIME %{F-}%{B-}"
		# sleep
		sleep 0.2
	done
}

#get_output | lemonbar -f "$FONT" -g 1440x22+0+0 -n leftbar -B '#171717' -F '#eeeeee'
get_output | lemonbar -f "$FONT" -g 1430x24+5+5 -n leftbar -B '#1c2833' -F '#eeeeee'
#echo abc | lemonbar -p -f "$FONT" -g 1080x27+1440+0 -n rightbar
#hidden -c|xargs 9menu -popup -label Iconics -font "-xos4-terminus-bold-r-normal--24-240-72-72-c-120-iso10646-1"

