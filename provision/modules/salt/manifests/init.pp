# == Class: salt
#
# This class installs and manages the Salt Minion daemon.
#
# === Parameters
#
# === Actions
#
# - Install salt-minion package
# - Ensure salt-minion daemon is running
#
# === Requires
#
# === Sample Usage
#
#   class { 'salt': }
#
class salt {
  yumrepo {"epel":
        baseurl  => "http://mirror.aarnet.edu.au/pub/epel/6/x86_64",
        descr    => "Extra Packages for Enterprise Linux (EPEL)",
        enabled  => 1,
        gpgcheck => 1,
        gpgkey   => "http://mirror.aarnet.edu.au/pub/epel/RPM-GPG-KEY-EPEL-6",
  }

  package { 'salt-minion':
    ensure => latest,
  }

  service { 'salt-minion':
    enable  => true,
    ensure  => running,
    require => Package[ 'salt-minion' ],
  }

}
