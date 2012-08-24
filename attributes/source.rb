default[:git][:version] = "master"  # e.g. "v1.7.12-rc3"
default[:git][:url] = "https://github.com/gitster/git/tarball/#{node.git.version}"
default[:git][:prefix] = "/usr/local"
