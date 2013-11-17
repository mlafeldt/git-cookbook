require 'spec_helper'

describe 'The recipe git::config' do
  let (:chef_run) do
    chef_run = ChefSpec::ChefRunner.new(
      :platform      => 'ubuntu',
      :version       => '12.04',
      :log_level     => :error,
      :cookbook_path => COOKBOOK_PATH
    )
    Chef::Config.force_logger true
    chef_run.converge 'git::config'
    chef_run
  end

  it 'compiles and installs git from source' do
    expect(chef_run).to include_recipe 'git::source'
  end

  it 'creates the system-wide git config file with the right content' do
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
    expect(chef_run).to create_file_with_content('/usr/local/etc/gitconfig', content)
  end
end
