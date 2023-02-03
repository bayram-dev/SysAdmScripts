#!/bin/bash
echo "Provisioning script $0"
nmcli connection modify "System eth1" ipv4.route-metric 1
systemctl restart NetworkManager
