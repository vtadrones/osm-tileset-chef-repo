# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

# We'll mount the Chef::Config[:file_cache_path] so it persists between
# Vagrant VMs
host_cache_path = File.expand_path("../.cache", __FILE__)
guest_cache_path = "/tmp/vagrant-cache"

# ensure the cache path exists
FileUtils.mkdir(host_cache_path) unless File.exist?(host_cache_path)

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

# Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "trusty64"
# Install RVM, Ruby and Chef on the Virtual Machine.
  config.vm.provision :shell, :path => "scripts/install_packages.sh"
  config.vm.provision :shell, :path => "scripts/install_rvm.sh",  :args => "stable"

  config.vm.provision :shell, :path => "scripts/stage_osm_repo.sh", :args => "vagrant release-1.4"
#  config.vm.provision :shell, :inline => "gem install chef --version 11.10.4 --no-rdoc --no-ri --conservative"
  config.vm.provision :shell, :inline => "gem install chef --version 11.18.0 --no-rdoc --no-ri --conservative"

# The url from where the 'config.vm.box' box will be fetched if it doesn't already exist on the user's system. Comment out 
# the version you want.
# trusty64
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

# configure the network
  config.vm.network :private_network, ip: "192.168.99.90"
  config.vm.provider :virtualbox do |vb|
    # Don't boot with headless mode
    vb.gui = true
    vb.name = 'geoshape_mapnik'
    # Use VBoxManage to customize the VM memory and CPUs.
    vb.customize ["modifyvm", :id, "--memory", "4096"]
    vb.customize ["modifyvm", :id, "--cpus", "2"]
  end
end
