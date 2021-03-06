# == Class: zendserver::params
#  Parameters class for zendserver class
#
class zendserver::params {
  $accept_eula = true
  $admin_password = 'changeme'
  $manage_repos = true
  $webserver = 'apache'
  $phpversion = '5.5'
  $license_name = undef
  $license_key = undef
  $zend_server_version = '7.0'
  $join_cluster = false
  $admin_api_key_name = undef
  $admin_api_key_secret = undef
  $admin_api_target_name = 'puppet'
  $admin_email = "root@${::fqdn}"
  $create_facts = true

  # Make sure that Zend Server is in the path of every exec
  Exec {
    environment => "PATH=/usr/local/zend/bin:${::path}" }

  case $::osfamily {
    'Debian' : { $package_lsbrelease = 'lsb-release' }
    'RedHat' : { $package_lsbrelease = 'redhat-lsb' }
    default  : { fail("${module_name} is not supported on ${::osfamily}") }
  }
}
