FROM digitalproteomes/gosu:version-1.0

LABEL maintainer="Patrick Pedrioli" description="A container the comet search engine" version="2021010"

## Let apt-get know we are running in noninteractive mode
ENV DEBIAN_FRONTEND noninteractive

WORKDIR /usr/local/bin

RUN apt-get update \
    && apt-get install -y --no-install-recommends unzip=6.0-21ubuntu1 \
    && mkdir /tmp/Comet \
    && wget -O /tmp/Comet/comet.zip https://sourceforge.net/projects/comet-ms/files/comet_2021010.zip/download \
    && unzip /tmp/Comet/comet.zip -d /tmp/Comet \
    && chmod 755 /tmp/Comet/*.linux.exe \
    && cp /tmp/Comet/*.linux.exe /usr/local/bin \
    && rm -rf /tmp/Comet \
    && rm -rf /var/lib/apt/lists/*
