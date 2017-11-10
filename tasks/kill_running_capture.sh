#!/bin/sh

# Puppet Task Name: kill_running_capture
$(/usr/bin/which pkill) tcpdump
