default[:git][:config] = {
  :color => {:ui => 'true'},
  :push  => {:default => 'simple'},
  :diff  => {:renames => 'copies'},
  :alias => {:ci => 'commit -v', :di => 'diff', :st => 'status -sb'}
}
