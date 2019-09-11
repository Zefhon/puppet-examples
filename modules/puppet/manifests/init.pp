class puppet {
	file { '/usr/local/bin/papply':
	  source => 'puppet:///modules/puppet/papply.sh',
	  mode   =>  '0755',
	}
}

file { '/usr/local/bin/pull-updates':
  source => 'puppet:///modules/puppet/pull-updates.sh',
	mode   => '0755',
}
#creates a cron job that pulls the repository every 10 minutes
#so it pulls every change and applies them to this node
cron { 'run-puppet':
  ensure  => 'present',
	user    => 'puppet',
	command => '/usr/local/bin/pull-updates',
	minute  => '*/10',
	hour    => '*',
}
