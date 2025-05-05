#!/bin/bash

# Проверка аргументов
if [ $# -ne 2 ]; then
    echo "Использование: $0 <имя_файла> <время_в_секундах>"
    exit 1
fi

output_file=$1
duration=$2

end_time=$((SECONDS + duration))

while [ $SECONDS -lt $end_time ]; do
    # Получаем текущую дату и время
    timestamp=$(date "+[%d.%m.%y %H:%M]")
    
    # Читаем среднюю нагрузку
    load=$(cat /proc/loadavg | awk '{print $1, $2, $3}')
    
    # Записываем в файл
    echo "$timestamp = $load" >> "$output_file"
    
    sleep 1
done
