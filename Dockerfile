FROM ubuntu 

LABEL maintainer="Carlo Barraco <carlobarraco@gmail.com>"
LABEL author="Carlo Barraco <carlobarraco@gmail.com>"
LABEL description="A neorouter server image based on the latest Ubuntu"

ENV LANG=en_US.utf8
ENV DEBIAN_FRONTEND=noninteractive

ARG VERSION=2.3.2.4450

RUN mkdir /data

VOLUME /data

RUN apt-get update && apt-get install -y wget

RUN wget http://download.neorouter.com/Downloads/NRFree/Update_$VERSION/Linux/Ubuntu/nrserver-$VERSION-free-ubuntu-amd64.deb && \
	dpkg -i nrserver-$VERSION-free-ubuntu-amd64.deb 

ADD init.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/init.sh

ENTRYPOINT /usr/local/bin/init.sh

EXPOSE 32976/tcp
