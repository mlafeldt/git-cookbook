require 'chefspec'

module ChefSpec
  module Matchers
    RSpec::Matchers.define :execute_bash_script do |name|
      match do |chef_run|
        chef_run.resources.any? do |resource|
          resource.resource_name.to_s == 'bash' && resource.name == name
        end
      end
    end
  end
end
