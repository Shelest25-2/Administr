#!/bin/bash

# Разделяем PATH на отдельные пути
echo "Анализ путей в переменной PATH:"
echo "-------------------------------"

# Обрабатываем каждый путь в PATH
echo "$PATH" | tr ':' '\n' | while IFS= read -r dir; do
    # Проверяем существование директории
    if [ -d "$dir" ]; then
        # Подсчитываем количество файлов (не включая директории)
        #count=$(find "$dir" -maxdepth 1 -type f 2>/dev/null | wc -l)
	#Если нужно считать не только файлики, но и ссылки и прочие приколы
	count=$(find "$dir" -maxdepth 1 \( -type f -o -type l \) 2>/dev/null | wc -l)
        printf "Путь: %-40s | Файлов: %d\n" "$dir" "$count"
    else
        printf "Путь: %-40s | ОШИБКА: Директория не существует\n" "$dir"
    fi
done
