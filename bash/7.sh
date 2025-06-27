#!/bin/bash
# Скрипт: 7.sh
# Использование: ./7.sh

IFS=':' read -ra paths <<< "$PATH"
for p in "${paths[@]}"; do
  if [ -d "$p" ]; then
    count=$(find "$p" -maxdepth 1 -type f 2>/dev/null | wc -l)
    echo "$p => $count"
  fi
done