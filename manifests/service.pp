class papertrail::service{
  $service_name = 'remote_syslog'
  case $::osfamily {
    'Debian': {
      $hasstatus     = true
      $hasrestart    = false

      file { "/etc/init.d/${service_name}":
          ensure => 'link',
          target => '/lib/init/upstart-job',
          force  => true,
          notify  => Service[$service_name],
      }

      file { "/etc/init/${service_name}.conf":
        ensure  => present,
        force   => true,
        content => template("papertrail/etc/init/${service_name}.upstart.erb"),
        notify  => Service[$service_name],
      }
    }
    'RedHat': {
      if ($::operatingsystem == 'Fedora') or (versioncmp($::operatingsystemrelease, '7.0') >= 0) {
        file { "/etc/systemd/system/${service_name}.service":
	        ensure  => present,
	        force   => true,
	        content => template("papertrail/etc/systemd/system/${service_name}.systemd.erb"),
	        notify  => Service['remote_syslog'],
	      }
      } else {
        file { "/etc/init.d/${service_name}":
          ensure  => present,
          force   => true,
          content => template("papertrail/etc/init.d/${service_name}.initd.erb"),
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
  
  service { $service_name:
    ensure     => running,
    name       => $service_name,
    enable     => true,
    hasstatus  => $hasstatus,
    hasrestart => $hasrestart,
    provider   => $provider,
  }
 
}