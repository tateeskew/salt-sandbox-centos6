# == Class: mirrors::yum
#
# This class installs the Fedora People Salt YUM repository.
#
# === Parameters
#
# === Actions
#
# - Install fedorapeople salt repository
# - Perform initial sync to update package database
#
# === Requires
#
# === Sample Usage
#
#   class { 'mirrors::yum': }
#
class mirrors::yum {

  file { 'epel.repo':
    ensure  => present,
    path    => '/etc/yum.repos.d/epel.repo',
    owner   => root,
    group   => root,
    mode    => '0644',
    source  => 'puppet:///modules/mirrors/epel.repo',
  }
  
  file { 'RPM-GPG-KEY-EPEL-6':
    ensure => present,
    path => '/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6',
    owner => root,
    group => root,
    mode => '0644',
    source => 'puppet:///modules/mirrors/RPM-GPG-KEY-EPEL-6',
  }

  exec { 'yum_makecache':
    command     => '/usr/bin/yum makecache',
    subscribe   => File[ 'epel.repo' ],
    refreshonly => true,
  }

}
