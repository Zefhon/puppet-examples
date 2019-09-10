#install http and ensures the service is running
service {'httpd':
  ensure => running,
  require => Package['httpd'],
}

package {'httpd':
  ensure => installed,
}

#creates a /etc/httpd/conf.d/omarsilva.conf config file. the /etc/httpd/conf.d directory will not exist until the httpd package is installed. 
#the require metaparameter tells puppet this file requires the httpd package installed, before it is created.

file {'/etc/httpd/conf.d/omarsilva.conf':
  content => "<VirtualHost *:80>\nServername 
      omarsilva\nDocumentRoot
        /var/www/omarsilva\n</VirtualHost>\n",
  require => Package['httpd'],
  notify => Service['httpd'],
}
#creates the directory /var/www/omarsilva and then creates an index.html in /var/www/omarsilva
#do not use / at the end
file {'/var/www/omarsilva':
    ensure => directory,
}
file {'/var/www/omarsilva/index.html':
  content => "<html><h1>Hello World!</h1></html>\n",
  require => File['/var/www/omarsilva'],
}

 
