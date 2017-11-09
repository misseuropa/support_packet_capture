# Main file for the support_packet_capture Module

class support_packet_capture (
  # Create params and default values
  Boolean $remove = false,
  String $savedir = '/var/tmp/',
  $interface = undef,
  String $packetcount = '1000',
  String $port = '8140',
  String $hostname = "${facts[hostname]}",
){
  $package_ensure = $remove ? {
    true => absent,
    false => latest,
  }

  $file_ensure = $remove ? {
    true => absent,
    false => present,
  }

  package {'tcpdump':
    ensure => $package_ensure,
  }

  file {'capscript':
    ensure => $file_ensure,
    path => "/var/tmp/capscript.sh",
    content => epp('support_packet_capture/capscript.epp'),
    mode => "0755",
  }
}
