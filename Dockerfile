FROM oberthur/docker-ubuntu-java:jdk8_8.121.13_V2

MAINTAINER Dawid Malinowski <d.malinowski@oberthur.com>

ENV HOME=/opt/app 

COPY start.sh simple-start.sh /opt/app/

WORKDIR /opt/app

