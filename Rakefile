require 'chef/cookbook/metadata'

def cookbook_metadata
  metadata = Chef::Cookbook::Metadata.new
  metadata.from_file('metadata.rb')
  metadata
end

COOKBOOK_NAME  = cookbook_metadata.name
COOKBOOKS_PATH = ENV['COOKBOOKS_PATH'] || 'cookbooks'


task :cleanup_cookbooks do
  rm_rf COOKBOOKS_PATH
end

task :setup_cookbooks => :cleanup_cookbooks do
  sh "berks", "install", "--path", COOKBOOKS_PATH
end

desc "Run knife cookbook test"
task :knife => :setup_cookbooks do
  sh "knife", "cookbook", "test", COOKBOOK_NAME,
     "--cookbook-path", COOKBOOKS_PATH
end

desc "Run foodcritic lint checks"
task :foodcritic => :setup_cookbooks do
  sh "foodcritic", "--epic-fail", "any",
     File.join(COOKBOOKS_PATH, COOKBOOK_NAME)
end

desc "Run ChefSpec tests"
task :chefspec => :setup_cookbooks do
  sh "rspec", "--color", "--format", "documentation",
     File.join(COOKBOOKS_PATH, COOKBOOK_NAME, 'spec')
end

desc "Run all tests"
task :test => [:knife, :foodcritic, :chefspec]

task :default => :test

# aliases
task :lint => :foodcritic
task :spec => :chefspec
