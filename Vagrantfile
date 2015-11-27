# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
 
  config.vm.define "nosqldb" do |nosqldb|
    nosqldb.vm.box = "ubuntu/trusty64"
	nosqldb.vm.hostname = "vagrant-nosqldb"
	nosqldb.vm.network "private_network", ip: "192.168.33.31"
	nosqldb.vm.provision "hosts", sync_hosts: true
	nosqldb.vm.provision "shell", path: "db/provision.sh"
  end
  
  config.vm.define "appinstance1" do |appinstance1|
    appinstance1.vm.box = "ubuntu/trusty64"
	appinstance1.vm.hostname = "vagrant-appinstance1"
	appinstance1.vm.network "private_network", ip: "192.168.33.21"
	appinstance1.vm.provision "hosts", sync_hosts: true
	appinstance1.vm.provision "shell", path: "app/provision.sh"
  end
  
  config.vm.define "appinstance2" do |appinstance2|
    appinstance2.vm.box = "ubuntu/trusty64"
	appinstance2.vm.hostname = "vagrant-appinstance2"
	appinstance2.vm.network "private_network", ip: "192.168.33.22"
	appinstance2.vm.provision "hosts", sync_hosts: true
	appinstance2.vm.provision "shell", path: "app/provision.sh"
  end
  
  config.vm.define "proxy" do |proxy|
    proxy.vm.box = "ubuntu/trusty64"
	proxy.vm.hostname = "vagrant-proxy"
	proxy.vm.network "private_network", ip: "192.168.33.11"
	proxy.vm.provision "hosts", sync_hosts: true
	proxy.vm.provision "shell", path: "proxy/provision.sh"
  end

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.
  
end
