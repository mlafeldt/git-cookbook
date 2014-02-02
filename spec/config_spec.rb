require "spec_helper"

describe "git::config" do
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

  it "builds and installs git from source" do
    expect(chef_run).to include_recipe "git::source"
  end

  # rubocop:disable Tab
  it "creates the system-wide git config file with the right content" do
    expect(chef_run).to render_file("/usr/local/etc/gitconfig")
      .with_content <<EOS
[alias]
	ci = commit -v
	di = diff
	st = status -sb
[color]
	ui = true
[diff]
	renames = copies
[push]
	default = simple
EOS
  end
  # rubocop:enable Tab
end
