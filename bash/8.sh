#!/bin/bash
# Скрипт: 8.sh
# Использование: ./8.sh

values=()
while IFS='=' read -r name value; do
  if [[ $name == LC_* ]]; then
    values+=("$value")
  fi
done < <(env)

if [ ${#values[@]} -le 1 ]; then
  exit 0
fi

first="${values[0]}"
for v in "${values[@]}"; do
  if [ "$v" != "$first" ]; then
    echo "Error: LC_* variables have different values"
    exit 1
  fi
done 