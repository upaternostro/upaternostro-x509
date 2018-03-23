define x509::key (
  $ensure = present,
  $basedir = '/etc/x509',
  $keysdir = 'keys',
  $keyfile_owner = 'root',
  $keyfile_group = 'ssl-cert',
  $keyfile_mode = '0640',
  $content = file("x509/${fqdn}/keys/${title}.key"),
) {
  include x509

  validate_re($ensure, ['present','absent'], 'Valid values are: present, absent. WARNING: If set to absent the conf file is removed.')

  if $ensure == "present" {
    file { "${basedir}/${keysdir}/${title}.key":
      ensure  => present,
      owner   => "${keyfile_owner}",
      group   => "${keyfile_group}",
      mode    => "${keyfile_mode}",
      content => "${content}",
      require => File["${basedir}/${keysdir}"],
    }
  } else {
    file { "${basedir}/${keysdir}/${title}.key":
      ensure  => absent,
    }
  }
}
