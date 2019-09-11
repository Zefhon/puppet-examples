
#!/bin/sh  
sudo puppet apply /etc/puppet/myproject/manifests/site.pp \  --modulepath=/etc/puppet/cookbook/modules $*
#change the path to your corresponding path
#so when we need to run puppet apply, just do papply instead of puppet apply
#location to the directory is /etc/puppet/myproject