require 'spec_helper'

describe 'The recipe git::source' do
  let (:chef_run) do
    Chef::Recipe.any_instance.stub(:include_recipe)
    chef_run = ChefSpec::ChefRunner.new
    chef_run.node.set['git'] = { 'version' => '1.8.0' }
    chef_run.converge 'git::source'
    chef_run
  end

  %w(libcurl4-gnutls-dev libexpat1-dev gettext zlib1g-dev libssl-dev).each do |pkg|
    it "should install the package #{pkg}" do
      chef_run.should install_package pkg
    end
  end

  it 'should download the source tarball' do
    chef_run.should create_remote_file '/tmp/git-1.8.0.tar.gz'
  end

  it 'should execute bash to build and install git' do
    chef_run.should execute_bash_script 'build and install git'
  end
end
