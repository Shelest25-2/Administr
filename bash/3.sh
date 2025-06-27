#!/bin/bash
# Скрипт: 3.sh
# Использование: ./3.sh <file1> <file2> ...

if [ $# -lt 1 ]; then
  echo "Usage: $0 <file1> <file2> ..."
  exit 1
fi

for file in "$@"; do
  if [ ! -f "$file" ]; then
    echo "$file => not found"
    continue
  fi
  count=$(wc -l < "$file")
  echo "$file => $count"
done 