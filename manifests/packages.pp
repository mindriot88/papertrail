# Class: papertrail
#
# This class manages the required packages for papertrail
#
class papertrail::packages{
  
  $required_packages = ['rsyslog','curl']
  
  package{$required_packages:
          ensure => 'present'
  }
}