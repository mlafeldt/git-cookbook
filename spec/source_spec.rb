require 'spec_helper'

describe 'The recipe git::source' do
  let (:chef_run) { ChefSpec::ChefRunner.new.converge 'git::source' }

  it 'should include the recipe build-essential' do
    chef_run.should include_recipe 'build-essential'
  end

  %w(libcurl4-gnutls-dev libexpat1-dev gettext zlib1g-dev libssl-dev).each do |pkg|
    it "should install the package #{pkg}" do
      chef_run.should install_package pkg
    end
  end

  it 'should download the source tarball' do
    chef_run.should create_remote_file \
      File.join(Chef::Config[:file_cache_path],
                "git-#{chef_run.node['git']['version']}.tar.gz")
  end

  it 'should execute bash to build and install git' do
    chef_run.should execute_bash_script 'build and install git'
  end
end
