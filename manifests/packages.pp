class papertrail::packages{
  
  $required_packages = ['rsyslog','curl']
  
  package{$required_packages:
          ensure => 'present'
  }
}