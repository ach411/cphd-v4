# Collection of EDID management scripts for both CPHD-V4 (Cypress or broadata video analyzer/generator) and RPi4

Aurélien Chiron, Aug 2021

Tested on WSL Debian and Archlinux

## Bash scripts

rs232_config.sh: configures the rs232 link with the right settings. This is called by other scripts

read_edid_from_cphd-v4.sh: read one edid config from the cpdh-v4

upload_edid_to_cphd-v4.sh: write edid config (C1 to C10 memory slots in the device)

select_rx_edid_of_cphd-v4.sh: self-explanatory

send_cmd_to_cphd-v4.sh: draft of a script to send any command to the CPHD-V4

read_edid_from_rpi4.sh: connect the RPi4 to an HDMI sink and read the EDID from that sink

## Minicom scripts

read_edid_c#_block#.runscripts are scripts that run within [minicom](https://en.wikipedia.org/wiki/Minicom).

## Useful software to parse EDID structure

Analog way EDID editor

http://www.edidreader.com/

