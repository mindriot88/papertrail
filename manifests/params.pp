# Class: papertrail::params
#
# This class manages papertrail parameters
#
class papertrail::params{
  $log_port               = ''
  $log_host               = ''
  $extra_logs             = []
  $remote_syslog_location = '/usr/local/bin/remote_syslog'
  $remote_syslog_config   = '/etc/log_files.yml'
}