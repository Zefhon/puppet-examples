#case examples
#notifies the kind of OS
# ? is a selector
# ? chooses a value for the $systemtype variable, depending on the value of $::operatingsystem
$systemtype = $::operatingsystem ? {
  'Ubuntu' => 'debianlike',
  'Debian' => 'debianlike',  
  'RedHat' => 'redhatlike',  
  'Fedora' => 'redhatlike',  
  'CentOS' => 'redhatlike',
  default  => 'unknown',
}

notify {"your system is a ${systemtype} system": }

class debianlike {
  notify { 'Special manifest for Debian-like systems': }
}  
class redhatlike {
  notify { 'Special manifest for RedHat-like systems.Go team Red Hat': }
}

case $::operatingsystem {
'Ubuntu',
'Debian': {
   include debianlike
   }
'RedHat', 
'Fedora',
'CentOS',
'Springdale': {
    include redhatlike
}
default: {
    notify { "I don't know what kind of system you have!":
    }
  }
}    
