class papertrail::params{
  # Both $log_port and $log_host need to be updated
  $log_port               = ''
  $log_host               = ''
  $papertrail_certificate = 'puppet:///modules/papertrail/papertrail.crt'
  $extra_logs             = []
  $template               = 'papertrail/rsyslog.conf.erb'
  $remote_syslog_location = '/usr/local/bin/remote_syslog'
  $remote_syslog_config   = '/etc/log_files.yml'
}