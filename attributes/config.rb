#
# Cookbook Name:: git
# Attributes:: config
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

default['git']['config']['color']['ui'] = "true"
default['git']['config']['push']['default'] = "simple"
default['git']['config']['diff']['renames'] = "copies"
# aliases
default['git']['config']['alias']['ci'] = "commit -v"
default['git']['config']['alias']['di'] = "diff"
default['git']['config']['alias']['st'] = "status -sb"
