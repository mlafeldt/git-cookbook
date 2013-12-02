Git Cookbook
============

Installs Git from source and optionally configures it.

Requirements
------------

### Platform:

* Ubuntu
* Debian

### Cookbooks:

* apt (optional; you may want to include it to update the Debian package index)
* build-essential

Recipes
-------

### git::source

Installs Git from source.

This recipe can be run without any configuration. You might want to set
`node['git']['version']` to a specific version of Git to install.

### git::config

Provisions a system-wide configuration for Git.

For this recipe, set `node['git']['config']` accordingly.

Testing
-------

The cookbook provides the following Rake tasks for testing:

    rake integration                  # Alias for kitchen:all
    rake kitchen:all                  # Run all test instances
    rake kitchen:default-ubuntu-1204  # Run default-ubuntu-1204 test instance
    rake lint                         # Lint Chef cookbooks
    rake spec                         # Run ChefSpec examples
    rake test                         # Run all tests

[![Build Status](https://travis-ci.org/mlafeldt/git-cookbook.png?branch=master)](https://travis-ci.org/mlafeldt/git-cookbook)

License and Author
------------------

Author:: Mathias Lafeldt (<mathias.lafeldt@gmail.com>)

Copyright:: 2012-2013, Mathias Lafeldt

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

Contributing
------------

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
