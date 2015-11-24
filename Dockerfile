FROM oberthur/docker-ubuntu-java:jdk8_8.65.17

MAINTAINER Dawid Malinowski <d.malinowski@oberthur.com>

ENV HOME=/opt/app

WORKDIR /opt/app

# Add user app
RUN echo "app:x:999:999::/opt/app:/bin/false" >> /etc/passwd; \
    echo "app:x:999:" >> /etc/group; \
    mkdir -p /opt/app/logs/archives; chown -R app:app /opt/app \
    # add executable
    && chmod +x /opt/jdk/bin/run-java \
    && ln -s /opt/app /home/app
