class denyhosts::params {

  # These are standards.
  $package_name    = 'denyhosts'
  $service_name    = 'denyhosts'
  $config_WORK_DIR = '/var/lib/denyhosts'

  case $::osfamily {

    'RedHat': {
      $config_LOCK_FILE  = '/var/lock/subsys/denyhosts'
      $config_SECURE_LOG = '/var/log/secure'
    }

    'Debian':{
      $config_LOCK_FILE  = '/var/run/denyhosts'
      $config_SECURE_LOG = '/var/log/auth.log'
    }

    default:{
      fail("Module ${module_name} is not supported on ${::operatingsystem}")
    }

  }

}
