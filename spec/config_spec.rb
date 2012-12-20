require 'spec_helper'

describe 'The recipe git::config' do
  let (:chef_run) { ChefSpec::ChefRunner.new.converge 'git::config' }

  it 'should include the recipe git::source' do
    chef_run.should include_recipe 'git::source'
  end

  it 'should create the config file with the right content' do
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
    chef_run.should create_file_with_content('/usr/local/etc/gitconfig', content)
  end
end
