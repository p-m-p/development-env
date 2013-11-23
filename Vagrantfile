# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"
  config.vm.network :hostonly, "192.168.33.10"
  config.vm.share_folder "bridge", "/home/vagrant/bridge", "bridge"

  config.ssh.forward_agent = true

  config.vm.provision :chef_solo do |chef|
     chef.cookbooks_path = "cookbooks"
     chef.roles_path = "roles"
     chef.add_role "web"
   end
end
