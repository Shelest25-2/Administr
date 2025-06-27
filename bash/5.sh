#!/bin/bash
# Скрипт: 5.sh
# Использование: ./5.sh

outfile="logs.log"
> "$outfile"

for file in /var/log/*.log; do
  [ -f "$file" ] || continue
  lastline=$(tail -n 1 "$file")
  echo "$lastline" >> "$outfile"
done 