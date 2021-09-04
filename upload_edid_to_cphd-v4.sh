#!/bin/bash

# this script does not show response from device
# Use `cat -v /dev/ttyS18` in a separate terminal to view response

SERIAL_DEVICE="${1:-/dev/ttyS18}"
WRITE_TO="${2:-C1}"

if [ -f rs232_config.sh ] ; then
    . ./rs232_config.sh "$SERIAL_DEVICE"
else
    echo "Error: Can't find rs232_config.sh"
    exit 1
fi

#echo -ne '$help\r' > $SERIAL_DEVICE

## data for Candidate 1

WRITE_TO="C1"
echo "writing to $WRITE_TO..."

echo -ne "\$edid_write $WRITE_TO,block0 \r\n\
00 ff ff ff ff ff ff 00 4f 2b 01 01 59 95 4e 0e \
00 1e 01 03 a0 40 24 78 06 73 30 a5 53 3c b0 27 \
0f 55 55 20 00 00 81 c0 01 01 01 01 01 01 01 01 \
01 01 01 01 01 01 08 e8 00 30 f2 70 5a 80 b0 58 \
8a 00 ba 88 21 00 00 1e 02 3a 80 18 71 38 2d 40 \
58 2c 45 00 ba 88 21 00 00 1e 00 00 00 fc 00 53 \
59 4e 4b 34 4b 20 54 58 0a 20 20 20 00 00 00 fd \
00 3b 3d 23 96 3c 01 0a 20 20 20 20 20 20 01 f7\r\n" > $SERIAL_DEVICE

sleep 2

echo -ne "\$edid_write $WRITE_TO,block1 \r\n\
02 03 20 c1 23 09 07 07 83 01 00 00 68 03 0c 00 \
00 00 00 77 00 67 d8 5d c4 01 00 80 00 42 61 90 \
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 5a\r\n" > $SERIAL_DEVICE

sleep 2

## data for candidate 2

WRITE_TO="C2"
echo "writing to $WRITE_TO..."

echo -ne "\$edid_write $WRITE_TO,block0 \r\n\
00 ff ff ff ff ff ff 00 4f 2b 02 01 59 95 4e 0e \
00 1e 01 03 a0 40 24 78 06 73 30 a5 53 3c b0 27 \
0f 55 55 20 00 00 81 c0 01 01 01 01 01 01 01 01 \
01 01 01 01 01 01 08 e8 00 30 f2 70 5a 80 b0 58 \
8a 00 ba 88 21 00 00 1e 02 3a 80 18 71 38 2d 40 \
58 2c 45 00 ba 88 21 00 00 1e 00 00 00 fc 00 53 \
59 4e 4b 34 4b 20 54 58 0a 20 20 20 00 00 00 fd \
00 3b 3d 23 96 3c 01 0a 20 20 20 20 20 20 01 f6\r\n" > $SERIAL_DEVICE

sleep 2

echo -ne "\$edid_write $WRITE_TO,block1 \r\n\
02 03 20 c1 23 09 07 07 83 01 00 00 68 03 0c 00 \
00 00 00 77 00 67 d8 5d c4 01 00 80 00 42 61 90 \
f9 1c 00 72 51 d0 1e 20 70 28 55 00 ba 88 21 00 \
00 1e 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 06\r\n" > $SERIAL_DEVICE

sleep 2

## data for candidate 3

WRITE_TO="C3"
echo "writing to $WRITE_TO..."

echo -ne "\$edid_write $WRITE_TO,block0 \r\n\
00 ff ff ff ff ff ff 00 4f 2b 01 01 59 95 4e 0e \
00 1e 01 03 a0 40 24 78 06 73 30 a5 53 3c b0 27 \
0f 55 55 20 00 00 81 c0 01 01 01 01 01 01 01 01 \
01 01 01 01 01 01 08 e8 00 30 f2 70 5a 80 b0 58 \
8a 00 ba 88 21 00 00 1e 02 3a 80 18 71 38 2d 40 \
58 2c 45 00 ba 88 21 00 00 1e 00 00 00 fc 00 53 \
59 4e 4b 34 4b 20 54 58 0a 20 20 20 00 00 00 fd \
00 3b 3d 23 96 3c 01 0a 20 20 20 20 20 20 01 f7\r\n" > $SERIAL_DEVICE

sleep 2

echo -ne "\$edid_write $WRITE_TO,block1 \r\n\
02 03 20 c1 23 09 07 07 83 01 00 00 68 03 0c 00 \
00 00 00 77 00 67 d8 5d c4 01 00 80 00 42 61 90 \
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 5a\r\n" > $SERIAL_DEVICE

sleep 2

### data for candidate 3* (repeating the same block twice as it is the behaviour from original SYNK Tx)

#WRITE_TO="C3"
#echo "writing to $WRITE_TO..."

#echo -ne "\$edid_write $WRITE_TO,block0 \r\n\
#00 ff ff ff ff ff ff 00 4f 2b 03 00 22 95 4e 0e \
#01 17 01 04 80 00 01 78 af e4 c6 a3 59 4a 97 23 \
#12 4f 54 21 08 00 31 40 a9 40 81 c0 d1 c0 81 80 \
#00 00 00 00 00 00 02 3a 80 18 71 38 2d 40 58 2c \
#45 00 ba 88 21 00 00 1e 00 00 00 10 00 00 2a 40 \
#30 70 13 00 87 6c 00 00 00 1e 00 00 00 10 00 d0 \
#1e 20 6e 28 55 00 c0 6c 00 00 00 1e 00 00 00 10 \
#00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 27\r\n" > $SERIAL_DEVICE

#sleep 2

#echo -ne "\$edid_write $WRITE_TO,block1 \r\n\
#00 ff ff ff ff ff ff 00 4f 2b 03 00 22 95 4e 0e \
#01 17 01 04 80 00 01 78 af e4 c6 a3 59 4a 97 23 \
#12 4f 54 21 08 00 31 40 a9 40 81 c0 d1 c0 81 80 \
#00 00 00 00 00 00 02 3a 80 18 71 38 2d 40 58 2c \
#45 00 ba 88 21 00 00 1e 00 00 00 10 00 00 2a 40 \
#30 70 13 00 87 6c 00 00 00 1e 00 00 00 10 00 d0 \
#1e 20 6e 28 55 00 c0 6c 00 00 00 1e 00 00 00 10 \
#00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 27\r\n" > $SERIAL_DEVICE

#sleep 2

## data for candidate 4* (repeating the same block twice as it is the behaviour from original SYNK Tx)

WRITE_TO="C4"
echo "writing to $WRITE_TO..."

echo -ne "\$edid_write $WRITE_TO,block0 \r\n\
00 ff ff ff ff ff ff 00 4f 2b 04 00 22 95 4e 0e \
01 17 01 04 80 00 01 78 af e4 c6 a3 59 4a 97 23 \
12 4f 54 21 08 00 31 40 a9 40 81 c0 d1 c0 01 00 \
01 00 01 00 01 00 02 3a 80 18 71 38 2d 40 58 2c \
45 00 ba 88 21 00 00 1e 00 00 00 10 00 00 2a 40 \
30 70 13 00 87 6c 00 00 00 1e 00 00 00 10 00 d0 \
1e 20 6e 28 55 00 c0 6c 00 00 00 1e 00 00 00 10 \
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 23\r\n" > $SERIAL_DEVICE

sleep 2

echo -ne "\$edid_write $WRITE_TO,block1 \r\n\
00 ff ff ff ff ff ff 00 4f 2b 04 00 22 95 4e 0e \
01 17 01 04 80 00 01 78 af e4 c6 a3 59 4a 97 23 \
12 4f 54 21 08 00 31 40 a9 40 81 c0 d1 c0 01 00 \
01 00 01 00 01 00 02 3a 80 18 71 38 2d 40 58 2c \
45 00 ba 88 21 00 00 1e 00 00 00 10 00 00 2a 40 \
30 70 13 00 87 6c 00 00 00 1e 00 00 00 10 00 d0 \
1e 20 6e 28 55 00 c0 6c 00 00 00 1e 00 00 00 10 \
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 23\r\n" > $SERIAL_DEVICE

sleep 2

## data for candidate 5* (repeating the same block twice as it is the behaviour from original SYNK Tx)

WRITE_TO="C5"
echo "writing to $WRITE_TO..."

echo -ne "\$edid_write $WRITE_TO,block0 \r\n\
00 ff ff ff ff ff ff 00 4f 2b 05 00 22 95 4e 0e
01 17 01 04 80 00 01 78 af e4 c6 a3 59 4a 97 23
12 4f 54 21 08 00 31 40 a9 40 81 c0 d1 c0 01 00
01 00 01 00 01 00 01 1d 00 72 51 d0 1e 20 6e 28
55 00 c0 6c 00 00 00 1e 00 00 00 10 00 00 2a 40
30 70 13 00 87 6c 00 00 00 1e 00 00 00 10 00 d0
1e 20 6e 28 55 00 c0 6c 00 00 00 1e 00 00 00 10
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 32\r\n" > $SERIAL_DEVICE

sleep 2

echo -ne "\$edid_write $WRITE_TO,block1 \r\n\
00 ff ff ff ff ff ff 00 4f 2b 05 00 22 95 4e 0e \
01 17 01 04 80 00 01 78 af e4 c6 a3 59 4a 97 23 \
12 4f 54 21 08 00 31 40 a9 40 81 c0 d1 c0 01 00 \
01 00 01 00 01 00 01 1d 00 72 51 d0 1e 20 6e 28 \
55 00 c0 6c 00 00 00 1e 00 00 00 10 00 00 2a 40 \
30 70 13 00 87 6c 00 00 00 1e 00 00 00 10 00 d0 \
1e 20 6e 28 55 00 c0 6c 00 00 00 1e 00 00 00 10 \
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 32\r\n" > $SERIAL_DEVICE

sleep 2

## data for candidate 6* (repeating the same block twice as it is the behaviour from original SYNK Tx)

WRITE_TO="C6"
echo "writing to $WRITE_TO..."

echo -ne "\$edid_write $WRITE_TO,block0 \r\n\
00 ff ff ff ff ff ff 00 4f 2b 06 00 22 95 4e 0e \
01 17 01 04 80 00 01 78 af e4 c6 a3 59 4a 97 23 \
12 4f 54 21 08 00 31 40 a9 40 81 c0 d1 c0 01 00 \
01 00 01 00 01 00 f9 1c 00 72 51 d0 1e 20 70 28 \
55 00 c0 6c 00 00 00 1e 00 00 00 10 00 00 2a 40 \
30 70 13 00 87 6c 00 00 00 1e 00 00 00 10 00 d0 \
1e 20 6e 28 55 00 c0 6c 00 00 00 1e 00 00 00 10 \
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 38\r\n" > $SERIAL_DEVICE

sleep 2

echo -ne "\$edid_write $WRITE_TO,block1 \r\n\
00 ff ff ff ff ff ff 00 4f 2b 06 00 22 95 4e 0e \
01 17 01 04 80 00 01 78 af e4 c6 a3 59 4a 97 23 \
12 4f 54 21 08 00 31 40 a9 40 81 c0 d1 c0 01 00 \
01 00 01 00 01 00 f9 1c 00 72 51 d0 1e 20 70 28 \
55 00 c0 6c 00 00 00 1e 00 00 00 10 00 00 2a 40 \
30 70 13 00 87 6c 00 00 00 1e 00 00 00 10 00 d0 \
1e 20 6e 28 55 00 c0 6c 00 00 00 1e 00 00 00 10 \
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 38\r\n" > $SERIAL_DEVICE

sleep 2

## data for candidate 7

WRITE_TO="C7"
echo "writing to $WRITE_TO..."

echo -ne "\$edid_write $WRITE_TO,block0 \r\n\
00 ff ff ff ff ff ff 00 4f 2b 07 01 59 95 4e 0e \
00 1e 01 03 a0 40 24 78 06 73 30 a5 53 3c b0 27 \
0f 55 55 20 00 00 81 c0 01 01 01 01 01 01 01 01 \
01 01 01 01 01 01 08 e8 00 30 f2 70 5a 80 b0 58 \
8a 00 ba 88 21 00 00 1e 02 3a 80 18 71 38 2d 40 \
58 2c 45 00 ba 88 21 00 00 1e 00 00 00 fc 00 53 \
59 4e 4b 34 4b 20 54 58 0a 20 20 20 00 00 00 fd \
00 3b 3d 23 96 3c 01 0a 20 20 20 20 20 20 01 f1\r\n" > $SERIAL_DEVICE

sleep 2

echo -ne "\$edid_write $WRITE_TO,block1 \r\n\
02 03 20 c1 23 09 07 07 83 01 00 00 68 03 0c 00 \
00 00 00 77 00 67 d8 5d c4 01 00 80 00 42 61 90 \
01 1d 00 72 51 d0 1e 20 6e 28 55 00 ba 88 21 00 \
00 1e 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ff\r\n" > $SERIAL_DEVICE

sleep 2

## data for candidate 8

WRITE_TO="C8"
echo "writing to $WRITE_TO..."

echo -ne "\$edid_write $WRITE_TO,block0 \r\n\
00 ff ff ff ff ff ff 00 4f 2b 08 01 59 95 4e 0e
00 1e 01 03 a0 40 24 78 06 73 30 a5 53 3c b0 27
0f 55 55 20 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 08 e8 00 30 f2 70 5a 80 b0 58
8a 00 ba 88 21 00 00 1e 01 1d 00 72 51 d0 1e 20
6e 28 55 00 ba 88 21 00 00 1e 00 00 00 fc 00 53
59 4e 4b 34 4b 20 54 58 0a 20 20 20 00 00 00 fd
00 3b 3d 23 96 3c 01 0a 20 20 20 20 20 20 01 08\r\n" > $SERIAL_DEVICE

sleep 2

echo -ne "\$edid_write $WRITE_TO,block1 \r\n\
02 03 20 c1 23 09 07 07 83 01 00 00 68 03 0c 00 \
00 00 00 77 00 67 d8 5d c4 01 00 80 00 42 61 90 \
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 5a\r\n" > $SERIAL_DEVICE

sleep 2

## data for candidate 9

#WRITE_TO="C9"
#echo "writing to $WRITE_TO..."

#echo -ne "\$edid_write $WRITE_TO,block0 \r\n\
#00 ff ff ff ff ff ff 00 4f 2b 08 01 59 95 4e 0e
#00 1e 01 03 a0 40 24 78 06 73 30 a5 53 3c b0 27
#0f 55 55 20 00 00 01 01 01 01 01 01 01 01 01 01
#01 01 01 01 01 01 08 e8 00 30 f2 70 5a 80 b0 58
#8a 00 ba 88 21 00 00 1e 01 1d 00 72 51 d0 1e 20
#6e 28 55 00 ba 88 21 00 00 1e 00 00 00 fc 00 53
#59 4e 4b 34 4b 20 54 58 0a 20 20 20 00 00 00 fd
#00 3b 3d 23 96 3c 01 0a 20 20 20 20 20 20 01 08\r\n" > $SERIAL_DEVICE

#sleep 2

#echo -ne "\$edid_write $WRITE_TO,block1 \r\n\
#02 03 20 c1 23 09 07 07 83 01 00 00 68 03 0c 00 \
#00 00 00 77 00 67 d8 5d c4 01 00 80 00 42 61 90 \
#00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
#00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
#00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
#00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
#00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
#00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 5a\r\n" > $SERIAL_DEVICE

sleep 2

## data for candidate 10

WRITE_TO="C10"
echo "writing to $WRITE_TO..."

echo -ne "\$edid_write $WRITE_TO,block0 \r\n\
00 ff ff ff ff ff ff 00 4f 2b 10 01 59 95 4e 0e \
00 1e 01 03 a0 40 24 78 06 73 30 a5 53 3c b0 27 \
0f 55 55 20 00 00 01 01 01 01 01 01 01 01 01 01 \
01 01 01 01 01 01 f9 1c 00 72 51 d0 1e 20 70 28 \
55 00 ba 88 21 00 00 1e 08 e8 00 30 f2 70 5a 80 \
b0 58 8a 00 ba 88 21 00 00 1e 00 00 00 fc 00 53 \
59 4e 4b 34 4b 20 54 58 0a 20 20 20 00 00 00 fd \
00 3b 3d 23 96 3c 01 0a 20 20 20 20 20 20 01 07\r\n" > $SERIAL_DEVICE

sleep 2

echo -ne "\$edid_write $WRITE_TO,block1 \r\n\
02 03 20 c1 23 09 07 07 83 01 00 00 68 03 0c 00 \
00 00 00 77 00 67 d8 5d c4 01 00 80 00 42 61 90 \
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 5a\r\n" > $SERIAL_DEVICE


