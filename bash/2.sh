#!/bin/bash
# Скрипт: 2.sh
# Использование: ./2.sh <path>

if [ $# -ne 1 ]; then
  echo "Usage: $0 <path>"
  exit 1
fi

dir="$1"
if [ ! -d "$dir" ]; then
  echo "Error: path does not exist"
  exit 255
fi

for sub in "$dir"/*/; do
  [ -d "$sub" ] || continue
  name=$(basename "$sub")
  count=$(find "$sub" -mindepth 1 -maxdepth 1 | wc -l)
  echo "$count" > "$name"
done 