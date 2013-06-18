class denyhosts::service {

  service { $denyhosts::service_name:
    ensure     => $denyhosts::ensure,
    hasstatus  => true,
    hasrestart => true,
    enable     => true,
    require    => Class ['denyhosts::config'],
  }

}
