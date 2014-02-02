require "spec_helper"

describe "git::source" do
  let(:git_version) { "1.8.4" }

  it "installs correct version of git" do
    expect(command "/usr/local/bin/git --version")
      .to return_stdout(/^git version #{git_version}/)
  end
end
