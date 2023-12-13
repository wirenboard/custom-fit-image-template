#!/bin/sh

set -ex

## Install extra packages
# apt-get update && apt-get upgrade -y
# apt-get install -y wb-cloud-agent wb-mqtt-iec104 wb-mqtt-smartweb wb-mqtt-snmp wb-mqtt-urri wb-modbus-ext-scanner

## Change root password
# echo "root:<my-password>" | chpasswd

## Configure hardware modules
# cat > /etc/wb-hardware.conf <<EOF
# {
#     "wbc": {
#         "module": "wbc-4g-usb",
#         "options": {}
#     }
# }
# EOF

## Install helpers
# apt-get install -y crudini

## Change wb-ap SSID
# crudini --set /etc/systemd/system/NetworkManager.service.d/override.conf \
#   Service Environment "WB_AP_SSID_PREFIX=<my-ap-prefix>"

## Set wb-ap security
# crudini --set /usr/lib/NetworkManager/system-connections/wb-ap.nmconnection \
#   wifi-security key-mgmt wpa-psk
# crudini --set /usr/lib/NetworkManager/system-connections/wb-ap.nmconnection \
#   wifi-security psk <my-ap-password>
# crudini --set /usr/lib/NetworkManager/system-connections/wb-ap.nmconnection \
#   wifi-security wps-method 1

## Cleanup
# apt-get remove -y crudini
