# Class: papertrail
#
# This module manages papertrail
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
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
