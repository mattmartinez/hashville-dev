# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "debian"
  config.vm.box_url = "http://cdimage.debian.org/debian-cd/7.2.0/amd64/iso-cd/debian-7.2.0-amd64-netinst.iso"

  config.vm.provision "shell", path: "provision/init.sh"

  config.vm.define "Hashville-dev" do |box|
    box.vm.network "private_network", ip: "192.168.137.100"
    box.vm.network "private_network", ip: "192.168.137.101"
#    box.vm.provision "shell", path: "provision/litecoin.sh"
#    box.vm.provision "shell", path: "provision/stratum.sh"
#    box.vm.provision "shell", path: "provision/web.sh"
  end  
end
