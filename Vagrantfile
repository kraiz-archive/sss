# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "hansode/centos-6.6-x86_64"
  config.vm.box_check_update = false

  config.vm.define "core", primary: true do |core|
    core.vm.network "private_network", ip: "10.10.0.5"
    core.vm.hostname = "core"
    core.vm.synced_folder "salt/roots/", "/srv/"
    core.vm.provision "salt" do |salt|
      salt.minion_config = "salt/minion"
      salt.minion_key = "salt/key/minion.pem"
      salt.minion_pub = "salt/key/minion.pub"

      salt.install_master = true
      salt.master_config = "salt/master"
      salt.master_key = "salt/key/master.pem"
      salt.master_pub = "salt/key/master.pub"
      salt.seed_master = {
        core: salt.minion_pub,
        edge1: salt.minion_pub,
        edge2: salt.minion_pub
      }
    end
  end

  (1..2).each do |i|
    config.vm.define "edge#{i}" do |edge|
      edge.vm.network "private_network", ip: "10.10.0.10#{i}"
      edge.vm.synced_folder ".", "/vagrant", disabled: true
      edge.vm.hostname = "edge#{i}"
      edge.vm.provision "salt" do |salt|
        salt.minion_config = "salt/minion"
        salt.minion_key = "salt/key/minion.pem"
        salt.minion_pub = "salt/key/minion.pub"
      end
    end
  end
end
