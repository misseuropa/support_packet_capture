
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

This module will help sysadmins to capture simple network traces as requested by Puppet Support during diagnosis of issues in Support Tickets for Puppet Enterprise. It may also be useful for anyone taking their first steps in network analysis using tcpdump and/or Wireshark.

## Setup

### Setup Requirements

This module has no dependencies, other than the ability to install the tcpdump utility from configured system repositories.
The Tasks require Puppet Enterprise 2017.3.z or later.

### Beginning with support_packet_capture  

Once the module is installed, to use it simply classify any Linux node with the provided `support_packet_capture` class.
The Tasks can be accessed in the Tasks sidebar of the PE Console.

## Usage

The default instance of this module creates a Bash script (`capscript.sh`) in `/var/tmp/` which, when run, captures 1000 packets on the primary network interface, filtered on TCP port 8140. The packets are written to a file in `/var/tmp/`, the name of which is defined as `${facts[hostname]}.pcap`.
The function can be customised using the following parameters:

* port: Providing a port value applies a capture filter on a different TCP port.
* interface: Providing the name of an interface allows you to capture on a specific network interface.
* packetcount: Allows you to specify the number of packets to capture before exiting.
* savedir: Allows customisation of the directory the packet captures are saved to. The directory must exist on the target system.
* remove: If set to `true`, the next Puppet run will uninstall tcpdump and remove `/var/tmp/capscript.sh`. Any pcap files captured using the script will *NOT* be removed.

This module also includes 3 Tasks:
* A task to run the `capscript.sh` provided by this module.
* A task to kill a running tcpdump.
* A task to run a custom tcpdump, where the interface, number of packets, the save file and the capture filter can all be passed in as parameters. The interface parameter is passed to the `-i` flag in tcpdump, and should be the interface name as found in `ip link show`. The number of packets is passed to the `-c` flag in tcpdump if it is an integer, and disables the default packet capture limit if it is "none". The save file is passed to tcpdump's `-w` flag and should be a path where any required directories exist. The capture filter should be a valid tcpdump capture filter.

The custom tcpdump capture task has a default packet limit of 50 packets, to avoid an open-ended capture filling a disk. To change the number of packets captured, simply pass the required number of packets as a parameter. Passing "none" as the `packetcount` parameter removes the default 50 packet limit and should be done with **extreme caution**.

## Reference

This module provides a single class, with 2 resources which install the tcpdump package and create the Bash script which actually does the capture.
It also provides the three tasks outlined above.

## Limitations

This module works with all Debian or Enterprise Linux based distributions.
It *should* be compatible with all versions of Puppet, but is designed for Puppet 4 and Puppet 5 specifically.
The Tasks will only be available for PE 2017.3 and above.

## Development

To contibute, please raise PRs on this module's Github page.
