#!/bin/sh
	#Created by Ian Shaw

set host [lindex $argv 0]	
set file [lindex $argv 1]

bastion=x.x.x.x
username=<username>

cd /tmp

scp $username@$bastion:root@$host:$file .
diff hosts /etc/hosts
