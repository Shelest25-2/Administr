#!/bin/bash

# Проверка аргументов
# Не хочу чтобы можно было дописать строчки в файлики с заданием
if [ $# -ne 2 ] || [[ "$1" =~ ^[1-8]\.sh$ ]]; then
    echo "Использование: $0 <имя_файла_для_записи> <время_в_секундах>"
    exit 1
fi

output_file=$1
duration=$2

end_time=$((SECONDS + duration))

while [ $SECONDS -lt $end_time ]; do
    # Получаем текущую дату и время
    timestamp=$(date "+[%d.%m.%y %H:%M]")
    
    # Читаем среднюю нагрузку
    load=$(awk '{print $1, $2, $3}' /proc/loadavg)
    
    # Записываем в файл
    echo "$timestamp = $load" >> "$output_file"
    
    sleep 1
done
