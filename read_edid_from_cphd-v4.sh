#!/bin/bash

SERIAL_DEVICE="${1:-/dev/ttyS18}"
READ_FROM="${2:-SINK_H}"
#BLOCK_NUMBER="${2:-block0}"

DATE_SUFFIX=$(date '+%Y%m%d-%H%M%S')

#echo $DATE_SUFFIX

if [ -f rs232_config.sh ] ; then
        . ./rs232_config.sh "$SERIAL_DEVICE"
    else
            echo "Error: Can't find rs232_config.sh"
                exit 1
fi


echo "reading from $READ_FROM..."

for block in block0 block1
do
    echo "reading $block..."
    (read -rN700 -t4 RESP < $SERIAL_DEVICE; echo "$RESP" >> edid_read.$DATE_SUFFIX.hex)&

    sleep 1

    echo -ne "\$edid_read $READ_FROM,$block\r" > $SERIAL_DEVICE
    sleep 6

done


exit

