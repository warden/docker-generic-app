FROM oberthur/docker-ubuntu-java:jdk8_8.74.02

MAINTAINER Dawid Malinowski <d.malinowski@oberthur.com>

ENV HOME=/opt/app

WORKDIR /opt/app

# Add user app
RUN useradd -u 999 app -U -s /bin/false -M -d /opt/app \
    && mkdir -p /opt/app/logs/archives \
    && chown -R app:app /opt/app
