
#!/bin/sh  
sudo puppet apply /etc/puppet/myfiles/manifests/site.pp \  --modulepath=/etc/puppet/cookbook/modules $*
#change the path to your corresponding path