#!/bin/bash

IFS=$'\t\n'

set -euo pipefail

DEBUG="" # anything else than empty string activates DEBUG mode

DATE_SUFFIX=$(date '+%Y%m%d-%H%M%S')

EDID_PREFIX="${1:-edid.$DATE_SUFFIX}"
EDID_BINARY="${EDID_PREFIX}.bin"
EDID_HEX="${EDID_PREFIX}.hex"

RPI4_ADDR="${2:-10.1.1.223}"
RPI4_HOST="${3:-pi}"

EDID_SYS_FS_PATH="/sys/devices/platform/gpu/drm/card1/card1-HDMI-A-1/edid"

test $DEBUG && echo "Will create $EDID_BINARY and $EDID_HEX"

ssh -l $RPI4_HOST $RPI4_ADDR "cp -f $EDID_SYS_FS_PATH /tmp/edidtest.bin"
scp ${RPI4_HOST}@${RPI4_ADDR}:/tmp/edidtest.bin "./$EDID_BINARY"

# extract the block0 (the first 128 bytes of EDID) from binary file
block0=$(hexdump -n 128 -v -e '/1 "%02X "' $EDID_BINARY)
block1=$(hexdump -n 128 -s 128 -v -e '/1 "%02X "' $EDID_BINARY)

echo $block0 | sed 's/\([a-fA-F0-9 ]\{48\}\)/\1\n/g' > "$EDID_HEX"
echo $block1 | sed 's/\([a-fA-F0-9 ]\{48\}\)/\1\n/g' >> "$EDID_HEX"
