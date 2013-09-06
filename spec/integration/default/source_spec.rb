require 'chef_bones/integration_spec_helper'

describe 'The git::source recipe' do
  git_version = '1.8.4'

  it "installs git #{git_version}" do
    expect(command 'git --version').to return_stdout /^git version #{git_version}/
  end
end
