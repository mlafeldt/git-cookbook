require 'chef_bones/unit_spec_helper'

describe 'The recipe git::source' do
  let (:chef_run) do
    chef_run = ChefSpec::ChefRunner.new(
      :platform      => 'ubuntu',
      :version       => '12.04',
      :log_level     => :error,
      :cookbook_path => COOKBOOK_PATH
    )
    Chef::Config.force_logger true
    chef_run.converge 'git::source'
    chef_run
  end
  let (:tmp_dir) { File.join(Chef::Config[:file_cache_path], 'git') }

  it 'should include the recipe build-essential' do
    chef_run.should include_recipe 'build-essential'
  end

  %w(libcurl4-gnutls-dev libexpat1-dev gettext zlib1g-dev libssl-dev).each do |pkg|
    it "should install the package #{pkg}" do
      chef_run.should install_package pkg
    end
  end

  it 'creates a temporary directory to store the source tarball' do
    chef_run.should create_directory tmp_dir
  end

  it 'downloads the source tarball' do
    version = chef_run.node['git']['version']
    tarball = File.join(tmp_dir, "git-#{version}.tar.gz")
    chef_run.should create_remote_file tarball
  end

  it 'should execute bash to build and install git' do
    chef_run.should execute_bash_script 'build and install git'
  end
end
