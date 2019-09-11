#install git on the nodes that will download the repos from github
#so each node will download the repos and do 'puppet apply'
#just do git pull origin master
#ssh-keygen -t rsa -b 4096 -C "my_email@example.com"
#to test the ssh connection: ssh -T git@github.com
#the files are to be copied to /etc/puppet/myproject, you can change this path 

package {'git':
  ensure => 'installed'
}

#install the ssh to acces this git account, in the puppet user's home directory

File {
  owner => 'puppet',
  group => 'puppet',
}

file {'/var/lib/puppet/.ssh': 
  ensure => 'directory',
}

#ssh keys to acces the git accout
file {'/var/lib/puppet/.ssh/id_rsa':
  content => " 
-----BEGIN RSA PRIVATE KEY-----   
#insert github ssh-key here. located at ~/.ssh/id_rsa
-----END RSA PRIVATE KEY-----
",
  mode => 0600,
  require => File['/var/lib/puppet/.ssh']
}
#creates the directory to contain the git repository 
file {'/etc/puppet/myproject':
  ensure => 'directory',
}
#downloads the host key to the node
exec {'download git@github.com host key': 
  command => 'sudo -u puppet ssh-keyscan git@github.com >> /var/lib/puppet/.ssh/known_hosts',
  path    => '/usr/bin:/usr/sbin:/bin:/sbin',
  unless  => 'grep git@github.com /var/lib/puppet/.ssh/known_hosts',
}
#creates the directory to contain the files from github
file {'/var/lib/puppet/.ssh/known_hosts':
  owner   => 'puppet',
  group   => 'puppet',
  require => Exec['download git@github.com host key']
}
#clones the repository on the node, on the directory /etc/puppet/myproject
exec {'create myproject':
  command => 'sudo -u puppet git clone git@github.com:repos/puppet.git /etc/puppet/myproject',
  path    => '/usr/bin:/usr/sbin:/bin:/sbin',
  require => [Package['git'],File['/var/lib/puppet/.ssh/id_rsa'],Exec['download git@github.com host key']],
  unless  => 'test -f /etc/puppet/myproject/.git/config',
}




