# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.hostname = 'glow-in-the-dark'
  config.vm.box = 'opscode_ubuntu-14.04_provisionerless'
  config.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-14.04_chef-provisionerless.box"
  config.omnibus.chef_version = 'latest'
#  config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["..","berks-cookbooks"]
    chef.json = {
    }

    chef.run_list = [
        'recipe[glow-in-the-dark::default]'
    ]
  end
end
