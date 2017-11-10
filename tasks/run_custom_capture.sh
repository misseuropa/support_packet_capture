#!/bin/sh

# Puppet Task Name: run_custom_capture
if [[ -z $PT_packetcount ]]
 then PT_packetcount="-c 50"
fi
$(/usr/bin/which tcpdump) $PT_interface $PT_packetcount $PT_savefile $PT_capturefilter
