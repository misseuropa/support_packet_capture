#!/bin/bash

# Puppet Task Name: run_custom_capture
interface=""
savefile=""
packetcount=""
if [[ -z $PT_packetcount ]]
  then packetcount="-c 50"
elif [[ $PT_packetcount gt 0 ]]
  then packetcount="-c "$PT_packetcount
fi
if [[ ! -z $PT_interface  ]]
  then interface="-i "$PT_interface
fi
if [[ ! -z $PT_savefile  ]]
  then savefile="-w "$PT_savefile
fi

$(/usr/bin/which tcpdump) $interface $packetcount $savefile $PT_capturefilter
