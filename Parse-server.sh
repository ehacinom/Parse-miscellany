#!/bin/bash

## need to retrieve some variables $VAR

## revoke old ssh keys
ssh-keygen -R $IP

## sign in as root
ssh root@$IP

## add a user
useradd -m -g users $USER
passwd $USER
adduser $USER sudo

##### LATER:
# Think about changing Pass_Max_Days in /etc/login.defs 
# (in bash) to force password changes

## general to do while root
# update
apt-get update && apt-get upgrade
# which ubuntu (Ubuntu 14.04.4 LTS)
lsb_release -a
# timezone
dpkg-reconfigure tzdata
# memory
free -m

## hostname
echo $HOSTNAME > /etc/hostname
hostname -F /etc/hostname
# if this file exists, comment out SET_HOSTNAME
if [ -w /etc/default/dhcpcp ]; then
    sed -i "s/SET_HOSTNAME/#SET_HOSTNAME/"
fi
