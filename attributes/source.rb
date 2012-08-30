git_version = "1.7.12"

default[:git] = {
  :version   => git_version,
  :url       => "https://github.com/gitster/git/tarball/v#{git_version}",
  :checksum  => "382a4627ea79",
  :prefix    => "/usr/local"
}
