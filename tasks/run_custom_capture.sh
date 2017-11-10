#!/bin/sh

# Puppet Task Name: run_custom_apture
$(/usr/bin/which tcpdump) $PT_interface $PT_packetcount $PT_savefile $PT_capturefilter
