#!/bin/bash

IFS=$'\t\n'

DEBUG="" # anything else than empty string activates DEBUG mode

SERIAL_DEVICE="${1:-/dev/ttyS8}"
SELECT_SLOT="${2:-C1}"

if [ -f rs232_config.sh ] ; then
        . ./rs232_config.sh "$SERIAL_DEVICE"
    else
            echo "Error: Can't find rs232_config.sh"
                exit 1
fi

test $DEBUG && echo "Will select $SELECT_SLOT as EDID for the HDMI In (Rx) of the device"


(read -n25 -t5 RESP < $SERIAL_DEVICE; echo "Response from device: $RESP")&
echo -ne "\$edid_rx $SELECT_SLOT\r" > $SERIAL_DEVICE

sleep 6
