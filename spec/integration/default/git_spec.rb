require 'chef_bones/integration_spec_helper'

describe 'default machine' do
  it 'installs git 1.8.2' do
    expect(command "git --version" ).to return_stdout /^git version 1.8.2/
  end

  # TODO: test git::config recipe
end
