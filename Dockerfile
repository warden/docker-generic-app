FROM oberthur/docker-ubuntu-java:openjdk-8u131b11

MAINTAINER Dawid Malinowski <d.malinowski@oberthur.com>

ENV HOME=/opt/app 

COPY start.sh simple-start.sh /opt/app/

WORKDIR /opt/app

