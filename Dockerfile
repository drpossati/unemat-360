# Dockerfile Produção
# Deploy web server python: https://faun.pub/deploy-flask-app-with-nginx-using-gunicorn-7fda4f50066a
FROM ubuntu

# Autor
LABEL maintainer="Danilo R"

# Criar a pasta
RUN mkdir -p /app

# Definir a pasta raiz de trabalho do container
WORKDIR /app

RUN apt update && apt upgrade --yes --fix-missing && apt install python3 python3-venv python3-pip python3-dev nginx --yes --fix-missing

# RUN apt install git --yes --fix-missing

# RUN git clone https://github.com/drpossati/unemat-360.git

# Copiar todos os arquivos da pasta local para a Workdir do Container
COPY . ./unemat-360

# Instalar os pacotes essenciais
RUN pip3 install -r ./unemat-360/requirements.txt

# Definir as porta liberada para uso do container
EXPOSE 5000

# Executar o app unemat-360
# CMD [ "python3", "./unemat-360/app.py" ]