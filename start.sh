#!/bin/bash


IP="${IP:-unknown}"
OUTPUT="${OUTPUT:-/output/}"

if [ ! -d "$OUTPUT" ]; then
  echo "$OUTPUT" is not a valid directory.
  exit 1
fi

if [ "$IP" = "unknown" ]; then
  echo "IP of scanner not defined";
  exit 1
fi

echo "OUTPUT Directory: $OUTPUT"
echo "Scanner IP: $IP"

/opt/brother/scanner/brscan4/brsaneconfig4 -a name=brother-scanner model=MFC ip="$IP"

echo "Scanner configured to ip $IP" > /scanner.log
echo "Start scan with: "
echo " docker exec brscan /scan.sh"
#/scan.sh &
tail -f /scanner.log


