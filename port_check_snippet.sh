#!/bin/sh

# Test remote host:port availability (TCP-only as UDP does not reply)
function check_firewall() {
	rport=$(timeout 1 bash -c '>/dev/tcp/193.133.96.34/80' &&   echo "Port open" ||   echo "Port closed")
	echo $rport
	if [ "$rport" == "Port closed" ] ; then
		echo "This machine does not have firewall access to the Web Proxy."
		exit 0
	else
		echo "Proxy port is open, web traffic should be allowed to pass."


	fi
}
check_firewall
