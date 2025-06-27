#!/bin/bash
# Скрипт: 6.sh
# Использование: ./6.sh <filename>

if [ "$FOO" = "5" ] && [ "$BAR" = "1" ]; then
  echo "Error: script execution is forbidden when FOO=5 and BAR=1"
  exit 1
fi

filename="${1:-fix.txt}"

while [ ! -f "$filename" ]; do
  sleep 1
done

echo "File $filename appeared!" 