# Redhat tools, scripts and assorted laziness

RHEL_Auto_subscribe.sh
	The script will do the following:
	Inject local repo
	Update subscription-manager and dependencies
	Remove local repo
	Add proxy configuration to subscription-manager
	Finally, it will ascertain if the system is physical or virtual and then apply the appropriate activation key

What it doesn't do:
	Ascertain and act upon the current version of subscription-manager, it simply assumes this is out of date and attempts to update via the opsbuild01 repo
	Handle outputs from dmidecode -s system-product-name other than KVM or "else". This means if a system returns anything other than KVM to this command, it will receive a physical NFR licence, we don't have many of these at all and as such this may cause some issues.
