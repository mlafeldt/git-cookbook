require "rake"
require "rake/clean"
require "rspec/core/rake_task"
require "kitchen/rake_tasks"

COOKBOOK_PATH = ENV.fetch("COOKBOOK_PATH", "vendor/cookbooks")

CLOBBER.include COOKBOOK_PATH

def cookbook_name
  require "chef/cookbook/metadata"
  metadata = Chef::Cookbook::Metadata.new
  metadata.from_file "metadata.rb"
  name = metadata.name
  if name.nil? || name.empty?
    File.basename(File.dirname(__FILE__))
  else
    name
  end
end

task :prepare_cookbooks do
  require "berkshelf"
  Berkshelf.ui.mute do
    Berkshelf::Berksfile.from_file("Berksfile").install(:path => COOKBOOK_PATH)
  end
end

desc "Run Foodcritic lint checks"
task :lint => :prepare_cookbooks do
  require "foodcritic"
  result = FoodCritic::Linter.new.check(
    :fail_tags => ["any"],
    :cookbook_paths => [File.join(COOKBOOK_PATH, cookbook_name)]
  )
  abort result.to_s if result.warnings.any?
end

desc "Run ChefSpec examples"
RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = "spec/*_spec.rb"
  t.rspec_opts = "--color --format documentation"
end
task :spec => :prepare_cookbooks

Kitchen::RakeTasks.new
