require "foodcritic"
require "kitchen/rake_tasks"
require "rspec/core/rake_task"

desc "Run Foodcritic lint checks"
FoodCritic::Rake::LintTask.new(:lint) do |t|
  t.options = { :fail_tags => ["any"] }
end

desc "Run ChefSpec examples"
RSpec::Core::RakeTask.new(:spec)

# Test Kitchen Rake task generator
Kitchen::RakeTasks.new

desc "Alias for kitchen:all"
task :integration => "kitchen:all"

desc "Run tasks lint, spec, and integration"
task :test => [:lint, :spec, :integration]

task :default => :test
