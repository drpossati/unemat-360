# Dockerfile Desenvolvimento
FROM ubuntu

# Autor
LABEL maintainer="Danilo R / Matheus Liedson"

# Criar a pasta
RUN mkdir -p /app

# Definir a pasta raiz de trabalho do container
WORKDIR /app

RUN apt update && apt upgrade --yes --fix-missing && apt install python3 python3-venv python3-pip --yes --fix-missing

RUN pip3 install flask

# RUN apt install git --yes --fix-missing

# RUN git clone https://github.com/drpossati/unemat-360.git

# Copiar todos os arquivos da pasta local para a Workdir do Container
COPY . ./unemat-360

# Definir as porta liberada para uso do container
EXPOSE 5000

# Executar o app unemat-360
CMD [ "python3", "./unemat-360/app.py" ]