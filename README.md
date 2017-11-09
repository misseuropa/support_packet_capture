
# support_packet_capture

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with support_packet_capture](#setup)
    * [Setup requirements](#setup-requirements)
    * [Beginning with support_packet_capture](#beginning-with-support_packet_capture)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Description

This module is designed to simplify installing tcpdump and capturing network traffic on Debian and EL based Linux distros.   

This module will help sysadmins to capture simple network traces as requested by Puppet Support during diagnosis of issues in Support Tickets for Puppet Enterprise. It may also be useful for anyone taking their first steps in network analysis using tcpdum and/or Wireshark.

## Setup

### Setup Requirements

This module has no dependencies, other than the ability to install the tcpdump utility from configured system repositories.

### Beginning with support_packet_capture  

Once the module is installed, to use it simply classify any Linux node with the provided `support_packet_capture` class.

## Usage

The default instance of this module creates a Bash script (`capscript.sh`) in `/var/tmp/` which, when run, captures 1000 packets on the primary network interface, filtered on TCP port 8140. The packets are written to a file in `/var/tmp/`, the name of which is defined as `${facts[hostname]}.pcap`.
The function can be customised using the following parameters:

* port: Providing a port value applies a capture filter on a different TCP port.
* interface: Providing the name of an interface allows you to capture on a specific network interface.
* packetcount: Allows you to specify the number of packets to capture before exiting.
* savedir: Allows customisation of the directory the packet captures are saved to. The directory must exist on the target system.
* remove: If set to `true`, the next Puppet run will uninstall tcpdump and remove `/var/tmp/capscript.sh`. Any pcap files captured using the script will *NOT* be removed.

## Reference

This module only provides a single class, with 2 resources.

## Limitations

This module works with all Debian or Enterprise Linux based distributions.
It *should* be compatible with all versions of Puppet, but is designed for Puppet 4 and Puppet 5 specifically.

## Development

To contibute, please raise PRs on this module's Github page.
