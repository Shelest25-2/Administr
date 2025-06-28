# 2-stage build без gcc
FROM python:3.11-slim as builder

WORKDIR /app

# Установить только необходимые build зависимости
RUN apt-get update && apt-get install -y \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

# Копировать и установить зависимости
COPY pyproject.toml .
RUN pip install --no-cache-dir --only-binary=all .

# Финальный образ
FROM python:3.11-slim

WORKDIR /app

# Установить только runtime зависимости
RUN apt-get update && apt-get install -y \
    libpq5 \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

# Копировать установленные пакеты
COPY --from=builder /usr/local/lib/python3.11/site-packages /usr/local/lib/python3.11/site-packages
COPY --from=builder /usr/local/bin /usr/local/bin

# Копировать только необходимые файлы приложения
COPY src/ ./src/

# Expose port
EXPOSE 8090

# Run the application
CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "8090"]