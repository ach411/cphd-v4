#!/bin/bash

# this script does not show response from device
# Use `cat -v /dev/ttyS18` in a separate terminal to view response

DEBUG="y" # anything else than empty string activates DEBUG mode
DRY_RUN="" # anything else than empty string activates DRY_RUN mode (data are not effectively written to the device)

test $DRY_RUN || echo "no dry run"

set -euo pipefail

test $DRY_RUN || echo "no dry run"

EDID_BINARY="${1:-edid.bin}"
SERIAL_DEVICE="${2:-/dev/ttyS18}"
WRITE_TO="${3:-C1}"

WHICH_HEXDUMP="$(which hexdump)"

# check files

if ! [ -x "$WHICH_HEXDUMP" ] ; then
    echo "Error: Can't find or execute hexdump, please install it"
    exit 1
fi

if [ -f "$EDID_BINARY" ] ; then
    SIZE_EDID_BINARY=$(du -b "$EDID_BINARY" | cut -f 1)
    test $DEBUG && echo "The size of $EDID_BINARY is $SIZE_EDID_BINARY bytes"
    if [ $SIZE_EDID_BINARY -ne 256 ] && [ $SIZE_EDID_BINARY -ne 128 ] ; then
        echo "Error: $EDID_BINARY is not the right size, should be 128 or 256 bytes"
        exit 1
    fi
else
    echo "Error: Can't find binary file $EDID_BINARY"
    exit 1
fi

if [ -f rs232_config.sh ] ; then
    . ./rs232_config.sh "$SERIAL_DEVICE"
else
    echo "Error: Can't find rs232_config.sh"
    exit 1
fi

echo "Write in slot: $WRITE_TO"

# extract the block0 (the first 128 bytes of EDID) from binary file
block0=$(hexdump -n 128 -v -e '/1 "%02X "' $EDID_BINARY)
#block0=$(hexdump -n 128 -v -e '16/1 "%02X " "\n"' $EDID_BINARY)

test $DEBUG && echo "block0: $block0"

# write block0 to the device
test $DRY_RUN || echo -ne "\$edid_write $WRITE_TO,block0 \r\n$block0\r\n" > $SERIAL_DEVICE

if [ $SIZE_EDID_BINARY -eq 256 ] ; then

    sleep 3 # wait a bit to make sure device had time to process data from previous write

    # extract the block1 (the second 128 bytes of EDID) from binary file
    block1=$(hexdump -n 128 -s 128 -v -e '/1 "%02X "' $EDID_BINARY)
    #block1=$(hexdump -n 128 -s 128 -v -e '16/1 "%02X " "\n"' $EDID_BINARY)

    test $DEBUG && echo "block1: $block1"

    # write block1 to the device
    test $DRY_RUN || echo -ne "\$edid_write $WRITE_TO,block1 \r\n$block1\r\n" > $SERIAL_DEVICE
fi

