class denyhosts::install {

  package { 'denyhosts':
    ensure => installed,
    name   => $denyhosts::package_name,
  }

}
