
# support_packet_capture

#### Table of Contents

1. [Description](#description)
2. [Setup - Getting started with support_packet_capture](#setup)
    * [Setup requirements](#setup-requirements)
    * [Start using support_packet_capture](#start-using-support_packet_capture)
3. [Usage - Configuration options and functionality](#usage)
4. [Reference - What the module is doing and how it is doing it](#reference)
5. [Limitations - OS compatibility](#limitations)
6. [Development - Contribute to the module](#development)

## Description

This module simplifies installing tcpdump and capturing network traffic on Debian and EL based Linux distros.

You can use this module when Puppet Support requests simple network traces while helping you troubleshoot Puppet Enterprise. It is also useful when you're taking your first steps in network analysis using tcpdump and/or Wireshark.

## Setup

### Setup Requirements

The ability to install the tcpdump utility from configured system repositories.

Using tasks (optional) requires Puppet Enterprise 2017.3.z or later.

### Beginning with support_packet_capture

Once the module is installed, you can use it to classify any Linux node with the `support_packet_capture` class.

Three tasks are included to simplify the capture. You can find them in the PE console in the Tasks sidebar.

## Usage - Configuration options and functionality

By default this module creates a bash script (`capscript.sh`) in `/var/tmp/`. When you run the script, 1000 packets on the primary network interface are captured, filtered on TCP port 8140. The packets are written to a file in `/var/tmp/`, named  `${facts[hostname]}.<timestamp>.pcap`.

You can customize the function using these parameters.

* port: The TCP port you want to capture traffic on.
* interface: The name of the network interface to capture.
* packetcount: The number of packets to capture.
* savedir: The directory the packet captures are saved to. You must create the directory before you can capture network traffic.
* remove: When set to `true`, the next Puppet run uninstalls tcpdump and removes `/var/tmp/capscript.sh`. This will not remove pcap files captured using the script.

This module also includes 3 tasks that can be used to simplify the capture. You can find them in the PE console in the Tasks sidebar.

* run_capture runs the bash script created by this module.

* kill_running_capture kills a running tcpdump.

* run_custom_capture runs a custom tcpdump, where the interface (string), number of packets (integer), the save file (string) and the capture filter (string) can be passed in as parameters.

    The interface parameter is passed to tcpdump's `-i` flag, and should be the interface name as found in `ip link show`.

    The number of packets is passed tcpdump's `-c` flag if it is a positive integer. Using 0 disables the task's default 50 packet capture limit.

    **Warning:** Passing 0 removes the default 50 packet limit and should be done with extreme caution. The limit prevents an open-ended capture from filling the disk.

    The save file location is passed to tcpdump's `-w` flag. The location must exist before you begin collecting packets.

    The capture filter must be a valid tcpdump capture filter.

## Reference

This module provides a single class with two resources. It installs the tcpdump package and creates a bash script that does a network capture. It also provides the three optional tasks to simplify the captures.

## Limitations

This module works with all Debian or Enterprise Linux based distributions.

It is designed to work with Puppet 4 and Puppet 5, but should be compatible with all versions of Puppet.

Tasks will only be available for PE 2017.3 and above.

## Development

To contibute, please open PRs on this module's GitHub page.