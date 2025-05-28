#!/bin/bash

# Проверка количества аргументов
if [ $# -ne 1 ]; then
    echo "Использование: $0 <путь>"
    exit 1
fi

path="$1"
output_dir="for_2$(date +%Y-%m-%d_%H-%M-%S)"

# Создаём папку для результатов
mkdir -p "$output_dir" || exit 1  # Если не удалось создать — завершаем скрипт

# Проверка существования пути
if [ ! -d "$path" ]; then
    echo "Ошибка: Путь '$path' не существует"
    exit 1
fi

# Перебор подкаталогов
for dir in "$path"/*/; do
    # Убираем слеши из пути (чтобы получить чистое имя)
    dir_name=$(basename "$dir")

    # Считаем количество элементов (исключая . и ..)
    count=$(ls -1q "$dir" | wc -l)

    # Создаём файл с именем подкаталога
    echo "$count" > "$output_dir/${dir_name}.txt"
done
