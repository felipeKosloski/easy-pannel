# Use a imagem base do Python
FROM python:3.9

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia o arquivo requirements.txt para o contêiner
COPY requirements.txt .

# Instala as dependências do Python
RUN pip install -r requirements.txt

# Copia o código-fonte da aplicação para o contêiner
COPY . .

# Expõe a porta 8000 para acesso externo
EXPOSE 8000

# Comando para iniciar o servidor Gunicorn com o Django
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "deploy.wsgi:application"]
