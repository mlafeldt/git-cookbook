# vi: set ft=ruby :

require 'berkshelf/vagrant'

Vagrant::Config.run do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.host_name = "git-ubuntu"

  config.vm.provision :chef_solo do |chef|
    chef.run_list = [
      "recipe[apt::default]",
      "recipe[git::source]",
      "recipe[git::config]"
    ]
    chef.json = {}
    chef.log_level = :debug
  end
end
