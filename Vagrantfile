# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/vivid64"

  # This can be set to the host name you wish the guest machine to have. Vagrant
  # will automatically execute the configuration necessary to make this happen.
  config.vm.hostname = "vagrant"

  config.vm.network :forwarded_port, guest: 5000, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network :private_network, ip: "192.168.33.10"
  config.vm.network "private_network", ip: "192.168.50.4"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder './', '/vagrant/', nfs: true

  config.vm.provider :virtualbox do |v|
    v.cpus = `sysctl -n hw.ncpu`.to_i / 2
    v.memory = 4096
  end

  config.vm.provision :ansible do |ansible|
    ansible.playbook = 'ansible/playbook.yml'
  end
end
