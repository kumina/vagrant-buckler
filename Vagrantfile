# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Cache the debs so we can reduce network transfer.
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end

  # Set box
  config.vm.provider "libvirt" do |v, override|
    override.vm.box = "debian-8.7.1-64bit-libvirt-4.3.18-docker"
    #config.vm.box_url = "http://vagrant.kumina.nl/boxes/debian-8.3.0-64bit-backports-libvirt.box"
  end

  config.vm.provider "virtualbox" do |v, override|
    override.vm.box = "debian-8.2.0-64bit-vbox-4.3.18-docker"
    override.vm.box_url = "http://vagrant.kumina.nl/boxes/debian-8.2.0-64bit-vbox-4.3.18-docker.box"
  end

  # Set box memory to 1024
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.vm.provider :libvirt do |lv|
    lv.memory = 1024
  end

  # Always run apt-get update
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
  config.vm.provision "shell", inline: "export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get -y --force-yes dist-upgrade"

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
