FROM ubuntu 

LABEL maintainer="Carlo Barraco <carlobarraco@gmail.com>"
LABEL author="Carlo Barraco <carlobarraco@gmail.com>"
LABEL description="A neorouter server image based on the latest Ubuntu"

ENV LANG=en_US.utf8
ENV DEBIAN_FRONTEND=noninteractive

ARG VERSION=2.3.1.4360

RUN mkdir /data

RUN apt-get update && apt-get install -y wget

RUN wget http://download.neorouter.com/Downloads/NRFree/Update_$VERSION/Linux/Ubuntu/nrserver-$VERSION-free-ubuntu-amd64.deb && \
	dpkg -i nrserver-$VERSION-free-ubuntu-amd64.deb && \
	mv /usr/local/ZebraNetworkSystems/NeoRouter/* /data/

ENTRYPOINT /usr/bin/nrserver -run --dbroot /data/

EXPOSE 32976/tcp

VOLUME /data/
