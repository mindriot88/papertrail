# papertrail
Puppet module for managing remote_syslog2 and in the future rsyslog

## Example

    $puppetDownloadMntPoint = "puppet:///modules/oradb/"

    papertrail{ 'install':
      log_host               => 'logs1234.papertrailapp.com',
      log_port               => '12345',
      extra_logs			 => ["/var/log/apache2/access.log"]
    }