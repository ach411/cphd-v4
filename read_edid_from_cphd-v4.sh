#!/bin/bash

IFS=$'\t\n'

DEBUG="" # anything else than empty string activates DEBUG mode

DATE_SUFFIX=$(date '+%Y%m%d-%H%M%S')

EDID_PREFIX="${1:-edid.$DATE_SUFFIX}"
EDID_BINARY="${EDID_PREFIX}.bin"
EDID_HEX="${EDID_PREFIX}.hex"

SERIAL_DEVICE="${2:-/dev/ttyS18}"
READ_FROM="${3:-SINK_H}"
#BLOCK_NUMBER="${2:-block0}"

#echo $DATE_SUFFIX

if [ -f rs232_config.sh ] ; then
        . ./rs232_config.sh "$SERIAL_DEVICE"
    else
            echo "Error: Can't find rs232_config.sh"
                exit 1
fi

test $DEBUG && echo "Will create $EDID_BINARY and $EDID_HEX"

echo "reading from $READ_FROM..."

for block in block0 block1
do
    echo "reading $block..."

    (
    declare -a resp_array
    while read -n700 -t5 line; do
        if [ -n "$line" ] ; then
            resp_array+=("${line}")
        fi
        test $DEBUG && echo "Response from Device: ${line}"
    done < "${SERIAL_DEVICE}"

    #for myline in "${resp_array[@]}" ; do
        #echo "Response from array: ${myline}"
    #done
    test $DEBUG && echo "length of array: ${#resp_array[@]}"
    #echo "ARRAY VALUE: ${resp_array[*]}"
    test $DEBUG && echo "ARRAY VALUE 1: ${resp_array[0]}"
    test $DEBUG && echo "ARRAY VALUE 2: ${resp_array[1]}"
    #(read -rN700 -t4 RESP < $SERIAL_DEVICE; echo "$RESP" >> edid_read.$DATE_SUFFIX.hex)&
    
    if [ ${#resp_array[@]} -ne 2 ] ; then
        echo "Error: Device did not return what was expected: ${resp_array[*]}"
        exit 1
    else
        echo "Response from device: ${resp_array[0]}"
        echo "${resp_array[1]}" >> "$EDID_HEX"
    fi
    )&

    sleep 1

    echo -ne "\$edid_read $READ_FROM,$block\r" > $SERIAL_DEVICE
    sleep 6

done

# convert hex to bin
xxd -r -p "$EDID_HEX" "$EDID_BINARY"

exit

