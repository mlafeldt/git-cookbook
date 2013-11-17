require "rake"
require "rake/clean"
require "rspec/core/rake_task"
require "kitchen/rake_tasks"

COOKBOOK_PATH = ENV.fetch("COOKBOOK_PATH", "vendor/cookbooks")

CLOBBER.include COOKBOOK_PATH

desc "Run Foodcritic lint checks"
task :lint do
  require "foodcritic"
  result = FoodCritic::Linter.new.check(
    :cookbook_paths => [Dir.pwd],
    :fail_tags => ["any"],
  )
  abort result.to_s if result.warnings.any?
end

task :berkshelf do
  require "berkshelf"
  Berkshelf.ui.mute do
    Berkshelf::Berksfile.from_file("Berksfile").install(:path => COOKBOOK_PATH)
  end
end

desc "Run ChefSpec examples"
RSpec::Core::RakeTask.new(:spec)
task :spec => :berkshelf

# Test Kitchen Rake task generator
Kitchen::RakeTasks.new

desc "Run tasks lint, spec, and kitchen:all"
task :test => [:lint, :spec, 'kitchen:all']
task :default => :test
