#!/bin/bash
# Скрипт: 4.sh
# Использование: ./4.sh <planet>

if [ $# -ne 1 ]; then
  echo "Usage: $0 <planet>"
  exit 1
fi

planet=$(echo "$1" | tr '[:upper:]' '[:lower:]')
case "$planet" in
  mercury) echo 0 ;;
  venus) echo 0 ;;
  earth) echo 1 ;;
  mars) echo 2 ;;
  jupiter) echo 95 ;;
  saturn) echo 146 ;;
  uranus) echo 28 ;;
  neptune) echo 16 ;;
  *) echo "Error: no such planet" ; exit 1 ;;
esac 