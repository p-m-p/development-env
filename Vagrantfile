# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.network 'private_network', ip: "192.168.33.10"
  config.vm.synced_folder "bridge", "/home/vagrant/sites"

  config.ssh.forward_agent = true

  config.vm.provider 'virtualbox' do |vb|
    vb.customize [
      'modifyvm', :id,
      '--memory', (1024 * 2).to_s,
      '--cpus', 1
    ]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end

  config.vm.provision :chef_solo do |chef|
     chef.cookbooks_path = "cookbooks"
     chef.roles_path = "roles"
     chef.add_role "web"
   end
end
