FROM oberthur/docker-ubuntu-java:jdk8_8.112.15

MAINTAINER Dawid Malinowski <d.malinowski@oberthur.com>

ENV HOME=/opt/app 

ADD start.sh /opt/app
ADD simple-start.sh /opt/app

WORKDIR /opt/app

