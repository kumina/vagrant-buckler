# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Set box
  config.vm.box = "debian-8.2.0-64bit-vbox-4.3.18-docker"

  # Set box memory to 1024
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  # Always run apt-get update
  config.vm.provision "shell", inline: "apt-get update"

  # Puppet provisioning
  config.vm.provision :puppet,
    :options => ["--verbose --disable_warnings=deprecations"] do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.module_path    = "puppet/modules"
    puppet.manifest_file  = "site.pp"
  end

  # Node: docker host / webserver
  config.vm.define :server do |conf|
    conf.vm.hostname = 'web01.vagrant.local'
    conf.vm.network :forwarded_port, guest: 5601, host: 5601
    conf.vm.network :forwarded_port, guest: 8000, host: 8000
    conf.vm.network :forwarded_port, guest: 9200, host: 9200
  end

end