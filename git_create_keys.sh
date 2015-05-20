#!/bin/sh
	#git_create_keys.sh
	#Created by Ian Shaw
echo -ne '\n' | ssh-keygen -t rsa -b 4096
eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa
cat .ssh/id_rsa.pub
echo ""
echo "Now copy the above public key into the Github web interface SSH keys section"
