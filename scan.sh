#!/bin/bash

OUTPUT="${OUTPUT:-/output/}"

resolution=100
device="brother4:net1;dev0"
output_file="$OUTPUT/scan_"`date +%Y-%m-%d-%H%M%S`

echo "scan from $device to $output_file" > /scanner.log
scanadf --device-name "$device" --resolution $resolution -o "$output_file"_%04d.pnm
convert -page A4 -density 100 $output_file*.pnm "$output_file"".pdf"
rm -f "${output_file}"_{0001..0100}.pnm;
echo "done" > /scanner.log
