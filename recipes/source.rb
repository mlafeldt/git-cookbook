# Install packages required for building.
%w(libcurl4-gnutls-dev libexpat1-dev gettext zlib1g-dev libssl-dev).each do |pkg|
  package(pkg) do
    action :install
  end
end


require 'tmpdir'

tmp_dir = Dir.tmpdir
tarball = File.join(tmp_dir, "git-#{node.git.version}.tar.gz")

# Download source tarball.
remote_file(tarball) do
  source node.git.url
  mode "0644"
  action :create
end

# Extract code, compile it, and install Git.
bash "build and install git" do
  user "root"
  cwd tmp_dir

  code <<-EOS
    tar xzf #{tarball}
    cd `tar -tf #{tarball} | head -n1`

    make prefix=/usr/local install
    git --version

    cd ..
    rm -rf `tar -tf #{tarball} | head -n1`
    rm -f #{tarball}
  EOS

  creates "/usr/local/bin/git"
end
