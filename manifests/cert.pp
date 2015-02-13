define x509::cert (
  $ensure = present,
  $basedir = '/etc/x509',
  $certsdir = 'certs',
  $certsfile_owner = 'root',
  $certsfile_group = 'root',
  $certsfile_mode = 0644,
  $content = file("x509/${fqdn}/certs/${title}.crt"),
) {
  include x509

  validate_re($ensure, ['present','absent'], 'Valid values are: present, absent. WARNING: If set to absent the conf file is removed.')

  if $ensure == "present" {
    file { "${basedir}/${certsdir}/${title}.crt":
      ensure  => present,
      owner   => "${certsfile_owner}",
      group   => "${certsfile_group}",
      mode    => "${certsfile_mode}",
      content => "${content}",
      require => File["${basedir}/${certsdir}"],
    }
  } else {
    file { "${basedir}/${certsdir}/${title}.crt":
      ensure  => absent,
    }
  }
}
