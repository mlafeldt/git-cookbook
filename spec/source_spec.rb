require "spec_helper"

describe "git::source" do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }
  let(:tmp_dir) { Chef::Config[:file_cache_path] }

  before do
    stub_command("test -d /var/chef/cache").and_return(false)
    stub_command("git --version | grep -q 1.8.4$").and_return(false)
  end

  it "installs packages to compile C programs (gcc, make, etc.)" do
    expect(chef_run).to include_recipe "build-essential"
  end

  it "installs packages required for building git" do
    packages = %w(libcurl4-gnutls-dev libexpat1-dev gettext zlib1g-dev libssl-dev)
    packages.each { |pkg| expect(chef_run).to install_package pkg }
  end

  it "creates a temporary directory to store build products" do
    expect(chef_run).to create_directory tmp_dir
  end

  it "downloads the git source tarball" do
    version = chef_run.node["git"]["version"]
    tarball = File.join(tmp_dir, "git-#{version}.tar.gz")
    expect(chef_run).to create_remote_file tarball
  end

  it "builds and installs git" do
    expect(chef_run).to run_bash "build and install git"
  end
end
