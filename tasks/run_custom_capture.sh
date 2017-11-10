#!/bin/sh

# Puppet Task Name: run_custom_capture
if [[ -z $PT_packetcount ]]
  then PT_packetcount="-c 50"
elif [[ $PT_packetcount == "none" ]]
  then PT_packetcount=""
fi

interface="-i "$PT_interface
savefile="-w "$PT_savefile

$(/usr/bin/which tcpdump) $interface $PT_packetcount $savefile $PT_capturefilter
