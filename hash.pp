#using hashes
#works as a hash but each element of the hash can be stored and looked up by name,named the key.


$interface = {
  'name' => 'eth0',
  'ip'   => '192.168.0.1',
  'mac'  => '52:54:00:4a:60:07' 
}
notify { "(${interface['ip']}) at ${interface['mac']} on 
  ${interface['name']}": }