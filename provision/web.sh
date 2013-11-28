#!/bin/bash
echo "Installing web app requirements.."
apt-get install memcached php5-memcached php5-mysqlnd php5-curl -y >/dev/null 2>&1 
