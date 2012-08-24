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

  not_if { File.exists? tarball }
end

# Extract code, compile it, and install Git.
bash "build and install git" do
  user "root"
  cwd tmp_dir

  code <<-EOS
    tar xzf #{tarball}
    cd `tar -tf #{tarball} | head -n1`
    make prefix=#{node.git.prefix} install
    cd ..
    rm -rf `tar -tf #{tarball} | head -n1`
  EOS

  not_if "git --version | grep -q #{node.git.version}$"
end
