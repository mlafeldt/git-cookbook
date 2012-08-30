maintainer        "Mathias Lafeldt"
maintainer_email  "mathias.lafeldt@gmail.com"
license           "Apache 2.0"
description       "Installs Git from source and optionally configures it"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "1.0.0"
recipe            "git::source", "Installs Git from source"
recipe            "git::config", "Provisions a system-wide Git config"

%w(ubuntu debian).each do |os|
  supports os
end

%w(build-essential).each do |cb|
  depends cb
end
