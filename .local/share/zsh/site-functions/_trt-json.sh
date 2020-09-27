#compdef _trt trt
#
# Completion script for trt
#

_trt() {
	local -a subcmds

	levels=('global:List nodes by levels' 'bronze:List nodes by levels' 'silver:List nodes by levels' 'gold:List nodes by levels' 'platinum:List nodes by levels')
	types=('time:List nodes by types' 'speed:List nodes by types' 'country:List nodes by types')

	switch_nat=('sn:Switch NAT node')
	switch_client=('sc:Switch Client node')

	info=('i:Show info')

	update=('-u:Update IP list and json')
	speedtest=('-t:Speed test')

	addrules=('-a:Add iptabels rules')
	clearrules=('-c:Clear iptables rules')

	_describe 'command' levels -- types -- switch_nat -- switch_client -- info -- update -- speedtest -- addrules -- clearrules
}
