# === ESTÁGIO 1: O Canteiro de Obras (Build) ===
FROM python:3.11-slim AS builder

WORKDIR /app

# Instala ferramentas necessárias para compilar dependências, se houver
RUN apt-get update && apt-get install -y --no-install-recommends gcc g++ && rm -rf /var/lib/apt/lists/*

# Copia e instala as dependências em uma pasta temporária isolada
COPY requirements.txt .
RUN pip install --no-cache-dir --user -r requirements.txt


# === ESTÁGIO 2: A Casa Pronta (Produção) ===
FROM python:3.11-slim AS runner

WORKDIR /app

# Copia APENAS as bibliotecas instaladas no estágio anterior (olha o truque aqui!)
COPY --from=builder /root/.local /root/.local
COPY . .

# Garante que o Python encontre as bibliotecas copiadas
ENV PATH=/root/.local/bin:$PATH
ENV PYTHONUNBUFFERED=1

EXPOSE 8000

# Comando para rodar em produção (com uvicorn)
CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "8000"]
