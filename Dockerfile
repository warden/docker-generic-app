FROM oberthur/docker-ubuntu-java:jdk7_7.80.15

MAINTAINER Dawid Malinowski <d.malinowski@oberthur.com>

ENV HOME=/opt/app

WORKDIR /opt/app

# Add user app
RUN groupadd -g 999 app \
    && useradd -u 999 app -g app -s /bin/false -M -d /opt/app \
    && mkdir -p /opt/app/logs/archives \
    && chown -R app:app /opt/app
