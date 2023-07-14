#!/bin/sh

# Generates a random WiFi password that matches the regex ^[0-9]{8}$
# and saves it to a text file. Works on OpenWrt only!

# TODO: Input the WiFi interface and text file from the script's
# argument
new_password=$(tr -dc '0-9' < /dev/urandom | head -c8)

uci set wireless.@wifi-iface[0].key=$new_password
uci commit wireless
reload_config
echo $new_password > wifi_password.txt
