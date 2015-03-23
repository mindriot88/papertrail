# Class: papertrail
#
# This module manages papertrail
#
# Parameters: 
#
# [*log_port*]
#  The port number assigned by papertrail
#  This should reflect your the port in your account
#  There is no default as it should be changed in any situation
#
# [*log_host*]
#  The host assigned by papertrail. Should reflect your the host in your account
#  There is no default as it should be changed in any situation
#
# [*extra_logs*]
#  Array with log files to push to papertrail. Also supports wildcards
#
# Actions:
#
# Requires: see Modulefile
#
class papertrail(
  $log_port               = $papertrail::params::log_port,
  $log_host               = $papertrail::params::log_host,
  $extra_logs             = $papertrail::params::extra_logs,
) inherits papertrail::params {
  
  validate_string($log_host)
  class {'papertrail::packages': } ->
  class {'papertrail::extract':  } ->
  class {'papertrail::install':  } ->
  class {'papertrail::service':  } ->
  Class['papertrail']
}
