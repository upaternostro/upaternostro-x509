define x509::ca (
  $ensure = present,
  $basedir = '/etc/x509',
  $cadir = 'ca',
  $cafile_owner = 'root',
  $cafile_group = 'root',
  $cafile_mode = '0644',
  $content = file("x509/${fqdn}/ca/${title}.crt"),
) {
  include x509

  validate_re($ensure, ['present','absent'], 'Valid values are: present, absent. WARNING: If set to absent the conf file is removed.')

  if $ensure == "present" {
    file { "${basedir}/${cadir}/${title}.crt":
      ensure  => present,
      owner   => "${cafile_owner}",
      group   => "${cafile_group}",
      mode    => "${cafile_mode}",
      content => "${content}",
      require => File["${basedir}/${cadir}"],
    }
  } else {
    file { "${basedir}/${cadir}/${title}.crt":
      ensure  => absent,
    }
  }
}
