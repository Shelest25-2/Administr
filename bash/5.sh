#!/bin/bash

output_file="logs.log"

# Очищаем файл перед записью
> "$output_file"

# Ищем все файлы .log в /var/log (без рекурсии)
find /var/log -maxdepth 1 -type f -name "*.log" | while IFS= read -r file; do
    # Извлекаем последнюю строку и добавляем в файл (игнорируем ошибки доступа)
    tail -n 1 "$file" 2>/dev/null >> "$output_file"
done

echo "Последние строки из файлов .log сохранены в $output_file"
