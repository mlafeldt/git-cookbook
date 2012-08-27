maintainer        "Mathias Lafeldt"
maintainer_email  "mathias.lafeldt@gmail.com"
license           "Apache 2.0"
description       "Installs Git"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "1.0.0"
recipe            "git::source", "Installs Git from source"

%w(ubuntu debian).each do |os|
  supports os
end
