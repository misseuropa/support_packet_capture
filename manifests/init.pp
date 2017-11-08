# Main file for the support_packet_capture Module

class packetcapprep (
  # Create params and default values
  $savedir = '/var/tmp/',
  $interface = undef,
  $packetcount = '10000',
  $port = '8140',
  $hostname = ${facts[hostname]},
){
  package {'tcpdump':
    ensure => latest,
  }

  file {'capscript':
    ensure => present,
    path => "/var/tmp/capscript.sh",
    content => epp(support_packet_capture/capscript.epp),
    mode => "0755",
  }
}
