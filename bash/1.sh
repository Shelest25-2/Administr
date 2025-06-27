#!/bin/bash
# Скрипт: 1.sh
# Использование: ./1.sh <output_file> <seconds>

if [ $# -ne 2 ]; then
  echo "Usage: $0 <output_file> <seconds>"
  exit 1
fi

outfile="$1"
timeframe="$2"

for ((i=0; i<timeframe; i++)); do
  timestamp=$(date '+%d.%m.%y %H:%M')
  loadavg=$(cat /proc/loadavg)
  echo "$timestamp = $loadavg" >> "$outfile"
  sleep 1
done 