#!/bin/sh
        #Created by Ian Shaw

host=$1
file=$2

echo "Getting $file from $host"

bastion=10.44.198.71
username=iansha.adm

cd /tmp

scp $username@$bastion:root@$host:$file .
diff $(basename $file) $file
