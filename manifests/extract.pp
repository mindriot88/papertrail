# Class: papertrail::extract
#
# This class manages the extaction of the remote_syslog binary from github
#
class papertrail::extract{
  archive::download { 'remote_syslog_linux_amd64.tar.gz':
    ensure           => present,
    url              => 'https://github.com/papertrail/remote_syslog2/releases/download/v0.13/remote_syslog_linux_amd64.tar.gz',
    follow_redirects => true,
    checksum         => false,
    src_target       => '/tmp'
  }
  archive::extract { 'remote_syslog_linux_amd64':
    src_target => '/tmp',
    target     => '/opt',
    root_dir   => 'remote_syslog'
  }
}