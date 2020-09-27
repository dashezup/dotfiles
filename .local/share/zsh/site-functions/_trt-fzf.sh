#compdef _trt trt
#
# Completion script for trt
#

_trt() {
	local -a subcmds

	fetch=('-f:Get csv')
	select_node=('s:Select node')
	client=('c:Switch node for trojan client')
	nat=('n:Switch node for trojan NAT     (root)')
	reset=('r:Reset iptables rules           (root)')
	add=('a:Add iptables rules             (root)')

	_describe 'command' fetch -- select_node -- client -- nat -- reset -- add
}
