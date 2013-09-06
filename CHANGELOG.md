1.1.1 (Sep 6 2013)
------------------

* Bug fix: Fix name of temporary directory to store build products.


1.1.0 (Sep 6 2013)
------------------

* Bug fix: Create temporary directory to store Git source tarball if it does not
  exist.
* Better unit and integration tests.
* Remove comments from `git::source` recipe.
* Update gems.


1.0.9 (Aug 27 2013)
-------------------

* Update Git to version 1.8.4.
* Use [chef-bones](https://github.com/mlafeldt/chef-bones) gem for testing.
* Add serverspec integration test.
* No longer downgrade RubyGems on Travis.


1.0.8 (Apr 19 2013)
-------------------

Take over changes from [skeleton cookbook](https://github.com/mlafeldt/skeleton-cookbook):

* Update gem dependencies (berkshelf 1.4, foodcritic 2.0, chef 10.24).
* Remove Vagrant from gems; get it from http://downloads.vagrantup.com/.
* Update Vagrantfile to v2 syntax and enable the _vagrant-berkshelf_ plugin.
* Add new tasks to Rakefile, e.g. `clobber` and `test:integration`. Replace
  `COOKBOOKS_PATH` with `FIXTURES_PATH` which defaults to _fixtures_.
* Let Travis run tests against Ruby 2.0.0.


1.0.7 (Mar 18 2013)
-------------------

* Update Git to version 1.8.2.


1.0.6 (Jan 16 2013)
-------------------

* Update Git to version 1.8.1.
* Update gems.
* Update copyright year.
* Add this CHANGELOG file.


1.0.5 (Dec 20 2012)
-------------------

* Sort configuration entries so the content/checksum of `gitconfig` stays the
  same as long as `node['git']['config']` hasn't changed.
* Pass configuration entries to template in `config` variable.


1.0.4 (Dec 18 2012)
-------------------

* Use `Chef::Config[:file_cache_path]` as temporary folder to store Git tarball.
* Test that `build-essential` recipe gets included.


1.0.3 (Dec 16 2012)
-------------------

* Introduce Rake-powered test infrastructure.
* Update Git to version 1.8.0.
* Add LICENSE file.
* Add license header to attribute files.


1.0.2 (Nov 11 2012)
-------------------

* Fix `git::source` spec to use `Dir.tmpdir` instead of `/tmp`.
* Simply `require 'spec_helper'` in specs.
* Update to ChefSpec version 0.9.0.


1.0.1 (Oct 25 2012)
-------------------

* Add scripts and ChefSpec examples to test `git::source` and `git::config`
  recipes, locally and on Travis CI.


1.0.0 (Sep 18 2012)
-------------------

* First tagged version.
