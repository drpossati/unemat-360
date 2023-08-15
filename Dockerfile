# Dockerfile Produção
# Deploy web server python: https://faun.pub/deploy-flask-app-with-nginx-using-gunicorn-7fda4f50066a
FROM ubuntu

# Autor
LABEL maintainer="Danilo R"

RUN apt update && apt upgrade --yes --fix-missing && apt install python3 python3-venv python3-pip python3-dev --yes --fix-missing

# RUN apt install git --yes --fix-missing

# criando usuário para ser usado no sistema
RUN useradd -d /home/possati -s /bin/bash -m possati

# Criar a pasta
# RUN mkdir -p /app

# Definir a pasta raiz de trabalho do container
WORKDIR /home/possati

# Definindo um volume para arquivos temporários
VOLUME [ "/tmp" ]

# RUN git clone https://github.com/drpossati/unemat-360.git

# Copiar todos os arquivos da pasta local para a Workdir do Container
COPY . ./unemat-360

# Instalar os pacotes essenciais
RUN pip3 install -r ./unemat-360/requirements.txt

# Definir as porta liberada para uso do container
EXPOSE 5000

# definindo usuário do sistema
USER possati

# Executar o app no diretório unemat-360 via gunicorn
# CMD [ "/app/unemat-360" ]
ENTRYPOINT [ "gunicorn", "--chdir", "./unemat-360/", "--bind", "0.0.0.0:5000", "wsgi:app" ]
