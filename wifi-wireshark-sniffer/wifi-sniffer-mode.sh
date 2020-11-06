#!/bin/bash


INTERFACE='wlp2s0'
#FREQ=2422
#INTERFACE='wlx9444527c41e5'
FREQ=2437
 
sudo ifconfig ${INTERFACE} down
sudo iwconfig ${INTERFACE} mode monitor
sudo iw phy phy0 interface add mon0 type monitor
sudo iw dev ${INTERFACE} del
sudo ifconfig mon0 up
sudo iw dev mon0 set freq ${FREQ}
 
#launch airmon
sudo airmon-ng start ${INTERFACE}
 
# launch wireshark
sudo wireshark
