#
# Cookbook Name:: git
# Attributes:: source
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

git_version = '1.8.0'

default['git']['version']  = git_version
default['git']['url']      = "https://github.com/gitster/git/tarball/v#{git_version}"
default['git']['checksum'] = '5d0ce3dacfd4'
default['git']['prefix']   = '/usr/local'
