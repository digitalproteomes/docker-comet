FROM ppatrick/gosu

MAINTAINER="Patrick Pedrioli"
LABEL Description="A container the comet search engine" Version="2019015"

## Let apt-get know we are running in noninteractive mode
ENV DEBIAN_FRONTEND noninteractive

WORKDIR /usr/local/bin

RUN apt-get update \
    && apt-get install -y unzip \
    && wget -O comet.zip https://sourceforge.net/projects/comet-ms/files/comet_2019015.zip/download \
    && unzip comet.zip \
    && chmod 755 *.linux.exe \
    && ln -s *.linux.exe comet
