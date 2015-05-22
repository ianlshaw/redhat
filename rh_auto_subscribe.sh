#!/bin/sh
#Magical RH autosubscriber.
#Writen by Ian Shaw

#Functions
function check_firewall() {
	proxy="x.x.x.x"
        rport=$(timeout 1 bash -c ">/dev/tcp/$proxy/80" &&   echo "Port open" ||   echo "Port closed")
        echo $rport
        if [ "$rport" == "Port closed" ] ; then
                echo "This machine does not have firewall access to the Web Proxy."
                exit 0
        else
                echo "Proxy port is open, web traffic should be allowed to pass."


        fi
}

function fix_sub_manager() {
	#Ascertain the current subscription-manager version
	subm_ver=$(rpm -q subscription-manager --queryformat "%{VERSION} \n" | cut -c 1)

	if [ "$subm_ver" -ge 1 ] ; then
		#Do nothing
		echo "Subscription-Manager is of version 1 or higher, which is satisfactory."
	else

		echo "Looks like subscription-manager is version 0.99 or lower - attempting to fix..."
		#Purge existing repos
		rm -f /etc/yum.repos.d/*

		#Inject local repo
		echo -e  "[rh6.6]\nname=added from: http shares\nbaseurl=http://localrepo/location/\nenabled=1" > /etc/yum.repos.d/rh6.6.repo

		#Update subscription-manager and dependencies
		yum -y update subscription-manager* python-rhsm*

		#Remove local repo
		rm -f /etc/yum.repos.d/rh6.6
	fi
}

function subscribe() {
	#Add proxy configuration to subscription-manager
	subscription-manager config --server.proxy_hostname=x.x.x.x --server.proxy_port=80

	#Subscription variables
	org=xxxxxx
	virt_key=xxxxxx
	physical_key=xxxxxx

	#Obtain the type of system. Physical/Virtual
	type=$(dmidecode -s system-product-name)

	if [ "$type" == "KVM" ]
		then
		#Subscribe using activation key.
		subscription-manager register  --activationkey=$virt_key --org=$org
	else
		subscription-manager register  --activationkey=$physical_key --org=$org
	fi
}

check_firewall
fix_sub_manager
subscribe
