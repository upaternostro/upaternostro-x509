class x509 (
  $ensure = present,
  $basedir = '/etc/x509',
  $basedir_owner = 'root',
  $basedir_group = 'root',
  $basedir_mode = 0755,
  $keysdir = 'keys',
  $keysdir_owner = 'root',
  $keysdir_group = 'ssl-cert',
  $keysdir_mode = 0710,
  $certsdir = 'certs',
  $certsdir_owner = 'root',
  $certsdir_group = 'root',
  $certsdir_mode = 0755,
  $cadir = 'ca',
  $cadir_owner = 'root',
  $cadir_group = 'root',
  $cadir_mode = 0755,
) {
  validate_re($ensure, ['present','absent'], 'Valid values are: present, absent. WARNING: If set to absent the conf file is removed.')

  if $ensure == "present" {
    file { "${basedir}":
      ensure => directory,
      owner  => "${basedir_owner}",
      group  => "${basedir_group}",
      mode   => "${basedir_mode}",
    }

    file { "${basedir}/${keysdir}":
      ensure  => directory,
      owner   => "${keysdir_owner}",
      group   => "${keysdir_group}",
      mode    => "${keysdir_mode}",
      require => File["${basedir}"],
    }
    
    file { "${basedir}/${certsdir}":
      ensure  => directory,
      owner   => "${certsdir_owner}",
      group   => "${certsdir_group}",
      mode    => "${certsdir_mode}",
      require => File["${basedir}"],
    }
    
    file { "${basedir}/${cadir}":
      ensure  => directory,
      owner   => "${cadir_owner}",
      group   => "${cadir_group}",
      mode    => "${cadir_mode}",
      require => File["${basedir}"],
    }
  } else {
    file { "${basedir}/${cadir}":
      ensure  => absent,
      recurse => true,
      purge   => true,
      force   => true,
    }

    file { "${basedir}/${certsdir}":
      ensure  => absent,
      recurse => true,
      purge   => true,
      force   => true,
    }

    file { "${basedir}/${keysdir}":
      ensure  => absent,
      recurse => true,
      purge   => true,
      force   => true,
    }

    file { "${basedir}":
      ensure  => absent,
      recurse => true,
      purge   => true,
      force   => true,
      require => File["${basedir}/${keysdir}", "${basedir}/${certsdir}", "${basedir}/${cadir}"]
    }
  }
}
