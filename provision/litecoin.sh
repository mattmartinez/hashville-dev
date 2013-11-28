#!/bin/bash

echo "Installing Litecoind dependencies.."
apt-get install build-essential libboost-all-dev libcurl4-openssl-dev libdb5.1-dev libdb5.1++-dev -y >/dev/null 2>&1

echo "Cloning litecoind from Github.."
cd ~
git clone git://github.com/litecoin-project/litecoin.git

echo "Compiling litecoind.."
cd litecoin/src
make -f makefile.unix USE_UPNP=-
cp litecoind /usr/bin

echo "Cloning network test.."
cd ~
git clone git://github.com/xrobau/litecoin-testnet-box.git
cd litecoin-testnet-box
echo "rpcuser=litecoinrpc" >> 1/litecoin.conf
echo "rpcpassword="`date +%s | md5sum | sha256sum | head -c 30` >> 1/litecoin.conf
sleep 1
echo "rpcuser=litecoinrpc" >> 2/litecoin.conf
echo "rpcpassword="`date +%s | md5sum | sha256sum | head -c 30` >> 2/litecoin.conf
make start

echo -e "Installation complete!!\n Please run 'make getinfo' to confirm."
