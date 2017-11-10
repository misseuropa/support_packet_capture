#!/bin/bash

# Puppet Task Name: run_custom_capture
interface=""
savefile=""
if [[ -z $PT_packetcount ]]
  then PT_packetcount="-c 50"
elif [[ $PT_packetcount == "none" ]]
  then PT_packetcount=""
fi
if [[ ! -z $PT_interface  ]]
  then interface="-i "$PT_interface
fi
if [[ ! -z $PT_savefile  ]]
  then savefile="-w "$PT_savefile
fi

$(/usr/bin/which tcpdump) $interface $PT_packetcount $savefile $PT_capturefilter
