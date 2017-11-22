# Class: papertrail::service
#
# This class manages the service which runs remote_syslog
#
class papertrail::service{
  $service_name = 'remote_syslog'

  file { "/etc/systemd/system/${service_name}.service":
    ensure  => present,
    force   => true,
    content => template("papertrail/etc/systemd/system/${service_name}.systemd.erb"),
    notify  => Service['remote_syslog'],
  }

  $hasstatus     = true
  $hasrestart    = false

  service { $service_name:
    ensure     => running,
    name       => $service_name,
    enable     => true,
    hasstatus  => $hasstatus,
    hasrestart => $hasrestart,
    provider   => 'systemd',
  }

}
