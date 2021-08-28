#!/bin/bash

SERIAL_DEVICE="${1:-/dev/ttyS18}"

echo "SERIAL DEVICE: $SERIAL_DEVICE"

stty -F $SERIAL_DEVICE 115200 cs8 -cstopb -parenb
stty -F $SERIAL_DEVICE raw
stty -F $SERIAL_DEVICE -onlcr
stty -F $SERIAL_DEVICE -echo -echoe -echok -echoctl -echoke -iexten

