#!/bin/bash

show_unit() {
	name="$1"
	full_text="$2"
	color="$3"
	echo -n "{\"name\": \"$name\", \"full_text\": \"$full_text\", \"separator\": false, \"color\": \"$color\", \"border_top\": 0, \"border_bottom\": 0, \"border_left\": 0, \"border_right\": 0, \"separator_block_width\": 0},"
}

get_rtc() {
	# DATE=$(date '+%F %T')
	rtc_path="/sys/class/rtc/rtc0"
	printf "$(<${rtc_path}/date) $(<${rtc_path}/time)"
}

get_uptime() {
	# UPTIME="$(uptime -p)"
	proc_uptime=$(</proc/uptime)
	local T=${proc_uptime%%.*}
	local D=$((T/60/60/24))
	local H=$((T/60/60%24))
	local M=$((T/60%60))
	local S=$((T%60))
	[[ $D > 0 ]] && printf '%d days ' $D
	[[ $H > 0 ]] && printf '%02d:' $H
	[[ $M > 0 ]] && printf '%02d:' $M
	printf '%02d\n' $S
}

show_status() {
	echo '{"version": 1, "click_events": true}'
	echo '['
	while :; do
		#echo '[{"full_text": "25%"}],'
		echo -n '['
		show_unit date "$(get_rtc) " "#FFA726"
		show_unit separator "| " "#c0c0c0"
		show_unit uptime "$(get_uptime) " "#43A047"
		echo '],'
		sleep 2
	done
	echo ']'
}

show_status
