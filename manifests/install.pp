# Class: papertrail::install
#
# This class manages the installation of the remote_syslog binary
#
class papertrail::install{
  file { $papertrail::remote_syslog_location:
    ensure => present,
    path   => $papertrail::remote_syslog_location,
    source => '/opt/remote_syslog/remote_syslog',
  }
  file { $papertrail::remote_syslog_config:
    ensure  => present,
    path    => $papertrail::remote_syslog_config,
    content => template('papertrail/etc/log_files.yml.erb'),
    notify  => Service['remote_syslog']
  }
}