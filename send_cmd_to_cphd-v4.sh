#!/bin/bash

IFS=$'\t\n'

DEBUG="y" # anything else than empty string activates DEBUG mode

SERIAL_DEVICE="${1:-/dev/ttyS8}"
CMD="${2:-help}"

if [ -f rs232_config.sh ] ; then
        . ./rs232_config.sh "$SERIAL_DEVICE"
    else
            echo "Error: Can't find rs232_config.sh"
                exit 1
fi

test $DEBUG && echo -e "Send the following command to the device: \$${CMD}"

(read -N2600 -t4 RESP < $SERIAL_DEVICE; echo "Response from device: $RESP")&
echo -ne "\$${CMD}\r" > $SERIAL_DEVICE

sleep 5

