require "chefspec"
require "chefspec/berkshelf"

RSpec.configure do |c|
  c.platform  = "ubuntu"
  c.version   = "12.04"
  c.log_level = :warn
end
