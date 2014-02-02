require "spec_helper"

describe "git::source" do
  let(:git_version) { "1.2.3" }
  let(:tmp_dir) { Chef::Config[:file_cache_path] }
  let(:chef_run) do
    ChefSpec::Runner.new do |node|
      node.set["git"]["version"] = git_version
    end.converge(described_recipe)
  end

  before do
    stub_command("test -d #{tmp_dir}").and_return(false)
    stub_command("git --version | grep -q #{git_version}$").and_return(false)
  end

  it "installs tools to compile C programs" do
    expect(chef_run).to include_recipe "build-essential"
  end

  it "installs packages required for building git" do
    packages = %w(libcurl4-gnutls-dev libexpat1-dev gettext zlib1g-dev libssl-dev)
    packages.each { |pkg| expect(chef_run).to install_package pkg }
  end

  it "creates a temporary directory to store build products" do
    expect(chef_run).to create_directory(tmp_dir).with(:recursive => true)
  end

  it "downloads the git source tarball" do
    tarball = File.join(tmp_dir, "git-#{git_version}.tar.gz")
    expect(chef_run).to create_remote_file tarball
  end

  it "builds and installs git" do
    expect(chef_run).to run_bash("build and install git").with(
      :user  => "root",
      :cwd   => tmp_dir,
      :flags => "-e"
    )
  end
end
