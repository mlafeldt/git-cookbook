require "rspec/core/rake_task"
require "kitchen/rake_tasks"

desc "Run Foodcritic lint checks"
task :lint do
  require "foodcritic"
  result = FoodCritic::Linter.new.check(
    :cookbook_paths => [Dir.pwd],
    :fail_tags => ["any"],
  )
  abort result.to_s if result.warnings.any?
end

desc "Run ChefSpec examples"
RSpec::Core::RakeTask.new(:spec)

# Test Kitchen Rake task generator
Kitchen::RakeTasks.new

desc "Run tasks lint, spec, and kitchen:all"
task :test => [:lint, :spec, 'kitchen:all']
task :default => :test
