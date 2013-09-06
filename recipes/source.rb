#
# Cookbook Name:: git
# Recipe:: source
#
# Copyright (C) 2012-2013 Mathias Lafeldt <mathias.lafeldt@gmail.com>
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

include_recipe 'build-essential'

packages = %w(libcurl4-gnutls-dev libexpat1-dev gettext zlib1g-dev libssl-dev)
packages.each { |pkg| package pkg }

tmp_dir = Chef::Config[:file_cache_path]
tarball = File.join(tmp_dir, "git-#{node['git']['version']}.tar.gz")

directory tmp_dir do
  recursive true
  action :create
  not_if "test -d #{tmp_dir}"
end

remote_file tarball do
  source node['git']['url']
  checksum node['git']['checksum']
  mode "0644"
  action :create
end

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
