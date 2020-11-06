#!/bin/bash 

INTARFACE='wlx9444527c41e5'
PHY='phy1'

sudo iw dev mon0 del
sudo iw phy ${PHY} interface add ${INTERFACE} type managed
iw dev

iwconfig ${INTERFACE}
