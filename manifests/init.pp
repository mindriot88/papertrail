# Class: papertrail
#
# This module manages papertrail
#
# Parameters: 
#
# [*log_port*]
#  The port number assigned by papertrail. Should reflect your the port in your account
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
  $papertrail_certificate = $papertrail::params::papertrail_certificate,
  $extra_logs             = $papertrail::params::extra_logs,
  $template               = $papertrail::params::template,
  $remote_syslog_location = $papertrail::params::remote_syslog_location,
  $remote_syslog_config   = $papertrail::params::remote_syslog_config
) inherits papertrail::params {
  
  validate_string($log_host)
  class {'papertrail::packages': } ->
  class {'papertrail::extract':  } ->
  class {'papertrail::install':  } ->
  class {'papertrail::service':  } ->
  Class['papertrail']
}
