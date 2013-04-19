# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.box = 'precise64'
  config.vm.box_url = 'http://files.vagrantup.com/precise64.box'
  config.vm.hostname = 'git-ubuntu'

  # Enable Berkshelf plugin which will make cookbooks available to Vagrant
  config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|
    chef.add_recipe 'minitest-handler' unless ENV['INTEGRATION_TEST'].nil?
    chef.add_recipe 'apt'
    chef.add_recipe 'git::source'
    chef.add_recipe 'git::config'

    chef.json = {
      # Only run integration tests for this cookbook
      "minitest" => { "tests" => "git/*_test.rb" },
    }

    chef.log_level = :debug
  end
end
