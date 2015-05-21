# Redhat tools, scripts and assorted laziness

###rh_auto_subscribe.sh

- Assumptions:

	You have a valid Red Hat Portal account
	You have created "Activation Keys" within the Red Hat Portal with subscriptions attached.

###Usage:
	
	chmod +x rh_auto_subscribe.sh
	./rh_auto_subscribe.sh


The script will do the following:

- Check if the web-proxy is accessible
- Inject local repo
- Update subscription-manager and dependencies
- Remove local repo
- Add proxy configuration to subscription-manager
- Finally, it will ascertain if the system is physical or virtual and then apply the appropriate activation key


What it doesn't do:

- Ascertain and act upon the current version of subscription-manager, it simply assumes this is out of date and attempts to update via the local repo
-  Handle outputs from dmidecode -s system-product-name other than KVM or "else". This means if a system returns anything other than KVM to this command, it will receive a physical NFR licence, we don't have many of these at all and as such this may cause some issues.
- Ascertain and act upon the current version of subscription-manager, it simply assumes this is out of date and attempts to update via the local repo
- Handle outputs from dmidecode -s system-product-name other than KVM or "else". This means if a system returns anything other than KVM to this command, it will receive a physical NFR licence.


###git_create_keys.sh

As the name suggests, this will create a key-pair inteded for use with git, simply provide your OAuth token at the 
begining of the script and it will do all the leg-work.

###Usage: 

	chmod +x git_create_keys.sh
	./git_create_keys.sh


###rdiff_behind_bastion.sh

Assumptions:
	
- You are behind a bastion administration server or SSH relay such that you cannot use "SSH Remote Command" option

###Usage:

	chmod +x rdiff_behind_bastion.sh
	./rdiff_behind_bastion.sh <remote_hostname> <file_to_be_compared>

