1.0.6 (WIP)
-----------

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
