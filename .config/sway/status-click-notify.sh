#!/bin/bash

get_rtc() {
	rtc_path="/sys/class/rtc/rtc0"
	printf "$(<${rtc_path}/date) $(<${rtc_path}/time)"
}

get_uptime() {
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

echo '{"version": 1, "click_events": true}'
echo '['
echo '[{"name": "date", "full_text": "date", "separator": false, "color": "#FFA726"}, {"name": "uptime", "full_text": "uptime", "separator": false, "color": "#43A047"}]'

while read line; do
	if [[ $line == *"name"*"uptime"* ]]; then
		notify-send.sh "uptime" "$(get_uptime)"
	elif [[ $line == *"name"*"date"* ]]; then
		notify-send.sh "date" "$(get_rtc)"
	fi
done
