require 'spec_helper'

describe 'The recipe git::source' do
  let(:git_version) { '1.8.4' }

  it "installs git" do
    expect(command 'git --version').to return_stdout /^git version #{git_version}/
  end
end
