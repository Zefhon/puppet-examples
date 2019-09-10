#installs the following packages
#creates an array, with a resource for each element in the array.
$packages = [ 'ruby1.8-dev',
    'ruby1.8',
    'ri1.8',
    'rdoc1.8',
    'irb1.8',
    'libreadline-ruby1.8',
    'libruby1.8',
    'libopenssl-ruby' ]
package { $packages: ensure => installed }