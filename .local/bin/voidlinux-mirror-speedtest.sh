#!/bin/sh

pkg_file="glibc-2.32_2.x86_64.xbps"


time_appconnect() {
	time_appconnect=$(curl --connect-timeout 2 -o/dev/null -sw '%{time_appconnect}' -I $1)
	result=$(printf "%.3f s" $time_appconnect)
	echo $result
}

download_speed() {
	speed=$(curl --progress-bar $1 -o/dev/null --write-out "%{speed_download}" | numfmt --to=iec-i --suffix=B/s)
	echo $speed
}

# https://docs.voidlinux.org/xbps/repositories/mirrors/index.html
while read -r mirror; do
	pkg_url=${mirror}current/${pkg_file}
	echo $pkg_url
	time_appconnect $pkg_url
	download_speed $pkg_url
	echo
done <<_EOF
https://alpha.de.repo.voidlinux.org/
https://mirrors.servercentral.com/voidlinux/
https://alpha.us.repo.voidlinux.org/ 
_EOF
