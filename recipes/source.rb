#
# Cookbook Name:: git
# Recipe:: source
#
# Copyright (C) 2012 Mathias Lafeldt <mathias.lafeldt@gmail.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Install packages to compile C programs (gcc, make, etc.)
include_recipe "build-essential"

# Install packages required for building Git.
# See http://git-scm.com/book/en/Getting-Started-Installing-Git
%w(libcurl4-gnutls-dev libexpat1-dev gettext zlib1g-dev libssl-dev).each do |pkg|
  package(pkg) do
    action :install
  end
end

require 'tmpdir'

tmp_dir = Dir.tmpdir
tarball = File.join(tmp_dir, "git-#{node['git']['version']}.tar.gz")

# Download source tarball.
remote_file(tarball) do
  source node['git']['url']
  mode "0644"
  checksum node['git']['checksum']
  action :create
end

# Extract code, compile it, and install Git.
bash "build and install git" do
  user "root"
  cwd tmp_dir
  flags "-e"

  code <<-EOS
    tar xzf #{tarball}
    cd `tar -tf #{tarball} | head -n1`
    make prefix=#{node['git']['prefix']} install
    cd ..
    rm -rf `tar -tf #{tarball} | head -n1`
  EOS

  not_if "git --version | grep -q #{node['git']['version']}$"
end
