class papertrail::service{
  $service_name = 'remote_syslog'
  case $::osfamily {
    'Debian': {
      $hasstatus     = true
      $hasrestart    = false

      file { '/etc/init.d/remote_syslog':
          ensure => 'link',
          target => '/lib/init/upstart-job',
          force  => true,
          notify => Service['remote_syslog'],
      }

      file { "/etc/init/${service_name}.conf":
        ensure  => present,
        force   => true,
        content => template('papertrail/etc/init/remote_syslog.upstart.erb'),
        notify  => Service['remote_syslog'],
      }
    }
    'RedHat': {
      if ($::operatingsystem == 'Fedora') or (versioncmp($::operatingsystemrelease, '7.0') >= 0) {
        file { '/etc/systemd/system/remote_syslog.service':
	        ensure  => present,
	        force   => true,
	        content => template("papertrail/etc/systemd/system/remote_syslog.systemd.erb"),
	        notify  => Service['remote_syslog'],
	      }
      } else {
        file { '/etc/init.d/remote_syslog':
          ensure  => present,
          force   => true,
          content => template("papertrail/etc/init.d/remote_syslog.initd.erb"),
          notify  => Service['remote_syslog'],
          mode    => '0755'
        }
      }
    }
    default: {
      fail('Remote_syslog needs a Debian, RedHat based system.')
    }
  }
  
  $provider = $::operatingsystem ? {
    'Ubuntu' => 'upstart',
    default  => undef,
  }

  service { 'remote_syslog':
    ensure     => running,
    name       => $service_name,
    enable     => true,
    hasstatus  => $hasstatus,
    hasrestart => $hasrestart,
    provider   => $provider,
  }
 
}