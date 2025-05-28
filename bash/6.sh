#!/bin/sh

if [ "$FOO" = "5" ] && [ "$BAR" = "1" ]; then
    echo "Ошибка: Выполнение скрипта запрещено"
    exit 1
fi

# Сохраняем список файлов в файл
ls -1 > initial_files.txt

echo "Ожидаю появления нового файла..."
echo "Для выхода нажмите Ctrl+C"

while true; do
    for file in *; do
        # Пропускаем каталоги
        [ -d "$file" ] && continue
        
        # Проверяем, есть ли файл в исходном списке
        if ! grep -qFx "$file" initial_files.txt; then
            echo "Обнаружен новый файл: $file"
            exit 0
        fi
    done
    sleep 1
done
