require 'chef_bones/integration_spec_helper'

describe 'The git::config recipe' do
  it 'creates the system-wide git config file' do
    expect(file '/usr/local/etc/gitconfig').to be_file
  end
end