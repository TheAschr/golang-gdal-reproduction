FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:ubuntugis/ppa && \
    apt-get update && \
    apt-get install -y libpq-dev gdal-bin libgdal-dev wget

RUN wget --no-check-certificate https://go.dev/dl/go1.20.5.linux-amd64.tar.gz && \ 
    rm -rf /usr/local/go && \
    tar -C /usr/local -xzf go1.20.5.linux-amd64.tar.gz

ENV PATH=$PATH:/usr/local/go/bin

WORKDIR /app

ADD go.mod ./
ADD go.sum ./

ADD main.go ./
ADD 2010_Census_Blocks.gdb.zip .

CMD go run main.go

