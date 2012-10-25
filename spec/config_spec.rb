require File.expand_path('../spec_helper', __FILE__)

describe 'The recipe git::config' do
  let (:chef_run) do
    Chef::Recipe.any_instance.stub(:include_recipe)
    ChefSpec::ChefRunner.new.converge 'git::config'
  end

  # content test needs ordered hash
  if RUBY_VERSION >= '1.9'
    it 'should create the git config file with right content' do
      content = <<EOF
[color]
	ui = true
[push]
	default = simple
[diff]
	renames = copies
[alias]
	ci = commit -v
	di = diff
	st = status -sb
EOF
      chef_run.should create_file_with_content('/usr/local/etc/gitconfig', content)
    end
  else
    it 'should create the git config file' do
      chef_run.should create_file '/usr/local/etc/gitconfig'
    end
  end
end
