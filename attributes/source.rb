git_version = "1.7.12-rc3"

default[:git] = {
  :version   => git_version,
  :url       => "https://github.com/gitster/git/tarball/v#{git_version}",
  :checksum  => "1ea2d52f20f2",
  :prefix    => "/usr/local"
}
