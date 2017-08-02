FROM oberthur/docker-ubuntu-java:jdk8_full_8.131.11

MAINTAINER Dawid Malinowski <d.malinowski@oberthur.com>

ENV HOME=/opt/app 

COPY start.sh simple-start.sh /opt/app/

WORKDIR /opt/app

