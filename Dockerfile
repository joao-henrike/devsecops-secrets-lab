# Base limpa e reduzida
FROM python:3.11-slim

# Define o diretório de trabalho
WORKDIR /app

# Copia estritamente os arquivos da aplicação (barrados pelo .dockerignore)
COPY app/ /app/

# Garante que o output do Python não fique preso no buffer do contêiner
ENV PYTHONUNBUFFERED=1

# O processo principal aguarda a injeção do ambiente no momento da execução
CMD ["python", "main.py"]
