require "spec_helper"

describe "git::config" do
  it "creates the system-wide git config file" do
    expect(file "/usr/local/etc/gitconfig").to be_file
  end
end
