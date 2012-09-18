Description
===========

Installs Git from source and optionally configures it.

Requirements
============

## Platform:

* Ubuntu
* Debian

## Cookbooks:

* apt (optional; you may want to include it to update the Debian package index)
* build-essential

Recipes
=======

## source

Installs Git from source.

This recipe can be run without any configuration. You might want to set
`node['git']['version']` to a specific version of Git to install.

## config

Provisions a system-wide configuration for Git.

For this recipe, set `node['git']['config']` accordingly.

License and Author
==================

Author:: Mathias Lafeldt (<mathias.lafeldt@gmail.com>)

Copyright:: 2012 Mathias Lafeldt

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
