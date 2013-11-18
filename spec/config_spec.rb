require "spec_helper"

describe "git::config" do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  before do
    stub_command("test -d /var/chef/cache").and_return(false)
    stub_command("git --version | grep -q 1.8.4$").and_return(false)
  end

  it "compiles and installs git from source" do
    expect(chef_run).to include_recipe "git::source"
  end

  it "creates the system-wide git config file with the right content" do
    content = <<EOF
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
EOF
    expect(chef_run).to render_file("/usr/local/etc/gitconfig").
      with_content(content)
  end
end
