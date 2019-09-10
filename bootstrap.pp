package {'git':
  ensure => 'isntalled'
}

#install the ssh to acces this git account, in the puppet user's home directory

File {
  owner => 'puppet',
  group => 'puppet',
}

file {'/var/lib/puppet/.ssh': 
  ensure => 'directory',
}


file {'/var/lib/puppet/.ssh/id_rsa':
  content => " 
-----BEGIN RSA PRIVATE KEY-----   
#insert github ssh-key here. located at ~/.ssh/id_rsa
-----END RSA PRIVATE KEY-----
",
  mode => 0600,
  require => File['/var/lib/puppet/.ssh']
}





