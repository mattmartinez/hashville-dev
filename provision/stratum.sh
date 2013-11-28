#!/bin/bash

echo "Installing Stratum dependencies.."
apt-get install python-twisted python-mysqldb python-dev python-setuptools python-memcache python-simplejson -y >/dev/null 2>&1

echo "Building.."
easy_install -U distribute
easy_install stratum

echo "Cloning scrypt and stratum.."
cd ~
git clone https://github.com/Tydus/litecoin_scrypt.git
git clone https://github.com/moopless/stratum-mining-litecoin.git
echo "Installing.."
cd litecoin_scrypt
python setup.py install
easy_install stratum

echo "Configuring.."
cd ~
cd stratum-mining-litecoin
cp conf/config_sample.py conf/config.py
sed -i "s/^CENTRAL_WALLET.*/CENTRAL_WALLET = 'LRFS47tmhrP6cgwwMDYm3KjjAB2ocVh9zD'/g" config.py
sed -i "s/^LITECOIN_TRUSTED_PORT.*/LITECOIN_TRUSTED_PORT = 17832/g" config.py
sed -i "s/^LITECOIN_TRUSTED_USER.*/LITECOIN_TRUSTED_USER = 'devtest'/g" config.py
sed -i "s/^LITECOIN_TRUSTED_PASSWORD.*/LITECOIN_TRUSTED_PASSWORD = 'devtest'/g" config.py
sed -i "s/^DB_MYSQL_DBNAME.*/DB_MYSQL_DBNAME = 'hashville'/g" config.py
sed -i "s/^DB_MYSQL_USER.*/DB_MYSQL_USER = 'hashville'/g" config.py
sed -i "s/^DB_MYSQL_PASS.*/DB_MYSQL_PASS = 'devpassw0rd'/g" config.py

echo "Launching stratum-mining daemon.."
cd ~
cd stratum-mining
twistd -y launcher_demo.tac
