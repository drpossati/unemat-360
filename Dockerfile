FROM ubuntu

# Autor
LABEL maintainer="Danilo R / Matheus Liedson"

# Criar a pasta
RUN mkdir -p /app/unemat-360

# Definir a pasta raiz de trabalho do container
WORKDIR /app/unemat-360

RUN apt update && apt upgrade --yes --fix-missing

RUN apt install python3 python3-venv python3-pip git --yes --fix-missing

RUN pip3 install flask

COPY . /app/unemat-360/

#RUN git clone https://github.com/matheus-liedson/unemat-360.git

# Instalar os pacotes essenciais
# RUN pip3 install -r requirements.txt

# Definir as porta liberada para uso do container
EXPOSE 5000

# Executar o app unemat-360
CMD [ "python3", "app.py" ]
