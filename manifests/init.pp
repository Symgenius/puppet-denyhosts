# == Class: denyhosts
#
# Manages denyhosts, supports CentOS & Debian
#
# === Parameters
#
# [*config_something*]
#   These parameters directly set stuff in denyhosts.conf.
#   Theyr meaning should be looked up within denyhosts.
#
# [*ensure*]
#   Whether we want to manage denyhosts startup & running behaviour
#
# === Examples
#
#  class { denyhosts:
#    config_ADMIN_EMAIL => 'you@yourdomain.com'
#  }
#
# === Authors
#
# Christian Reiß
# Alexander Bien <abien@gmx.net>
#
# === Copyright
#
# Copyright 2013 Symgenius GmbH & Co. KG
#
class denyhosts (

  # Set default variables, override via heira.
  $config_ADMIN_EMAIL                          = 'root@localhost',
  $config_BLOCK_SERVICE                        = 'sshd',
  $config_DAEMON_LOG                           = '/var/log/denyhosts',
  $config_DAEMON_PURGE                         = '1h',
  $config_DAEMON_SLEEP                         = '30s',
  $config_DENY_THRESHOLD_INVALID               = '5',
  $config_DENY_THRESHOLD_RESTRICTED            = '1',
  $config_DENY_THRESHOLD_ROOT                  = '1',
  $config_DENY_THRESHOLD_VALID                 = '10',
  $config_HOSTS_DENY                           = '/etc/hosts.deny',
  $config_PURGE_DENY                           = '1w',
  $config_RESET_ON_SUCCESS                     = 'yes',
  $config_SYNC_DOWNLOAD                        = 'yes',
  $config_SYNC_INTERVAL                        = '1h',
  $config_SYNC_SERVER                          = 'http://xmlrpc.denyhosts.net:9911',
  $config_SYNC_UPLOAD                          = 'no',
  $config_SYSLOG_REPORT                        = 'yes',
  $config_file                                 = '/etc/denyhosts.conf',
  $ensure                                      = 'running',

  # These are looked up.
  $package_name                                = $denyhosts::params::package_name,
  $service_name                                = $denyhosts::params::service_name,
  $config_LOCK_FILE                            = $denyhosts::params::config_LOCK_FILE,
  $config_SECURE_LOG                           = $denyhosts::params::config_SECURE_LOG,
  $config_WORK_DIR                             = $denyhosts::params::config_WORK_DIR,

) inherits denyhosts::params {

  # Include the Subclasses.
  include denyhosts::install
  include denyhosts::config
  include denyhosts::service

}
