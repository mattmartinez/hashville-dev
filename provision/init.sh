#!/bin/bash

echo "installing motd.."
rm -rf /etc/update-motd.d/*
cp /vagrant/provision/motd.sh /etc/update-motd.d/01-motd
chmod +x /etc/update-motd.d/01-motd

echo "adding hostnames in /etc/hosts.."
echo "127.0.0.1 hashville.local" >> /etc/hosts
echo "127.0.0.1 api.hashville.local" >> /etc/hosts

echo "updating and installing base packages.."
apt-get update >/dev/null 2>&1
PKGS="curl vim git"
for i in $PKGS; do echo -e "\t`apt-get changelog $i | head -10 | grep ^$i | cut -d " " -f1,2 | head -1`" && apt-get install -y $i >/dev/null 2>&1; done
echo "syntax on" > /root/.vimrc
echo "Done."
