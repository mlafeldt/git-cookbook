require 'spec_helper'

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
  let (:tmp_dir) { Chef::Config[:file_cache_path] }

  it 'installs packages to compile C programs (gcc, make, etc.)' do
    expect(chef_run).to include_recipe 'build-essential'
  end

  it 'installs packages required for building git' do
    packages = %w(libcurl4-gnutls-dev libexpat1-dev gettext zlib1g-dev libssl-dev)
    packages.each { |pkg| expect(chef_run).to install_package pkg }
  end

  it 'creates a temporary directory to store build products' do
    expect(chef_run).to create_directory tmp_dir
  end

  it 'downloads the git source tarball' do
    version = chef_run.node['git']['version']
    tarball = File.join(tmp_dir, "git-#{version}.tar.gz")
    expect(chef_run).to create_remote_file tarball
  end

  it 'builds and installs git' do
    expect(chef_run).to execute_bash_script 'build and install git'
  end
end
