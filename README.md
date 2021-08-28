# Collection of scripts for CPHD-V4 (Cypress or broadata video analyzer/generator)

Aurélien Chiron, Aug 2021

Tested on WSL Debian and Archlinux

## Bash scripts

rs232_config.sh: configures the rs232 link with the right settings. This is called by other scripts

read_edid_from_cphd-v4.sh: read one edid config from the cpdh-v4

upload_edid_to_cphd-v4.sh: write edid config (C1 to C10 memory slots in the device)

## Minicom scripts

read_edid_c#_block#.runscripts are scripts that run within [minicom](https://en.wikipedia.org/wiki/Minicom).
