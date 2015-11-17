FROM oberthur/docker-ubuntu-java:jdk8_8.65.17

MAINTAINER Dawid Malinowski <d.malinowski@oberthur.com>

ENV HOME=/opt/app \
    JVM_OPTS="-server -Xms512m -Xmx512m -XX:MetaspaceSize=128M -XX:MaxMetaspaceSize=128M" \
    _JAVA_OPTIONS="-Duser.home=/opt/app"

ADD run-java /opt/jdk/bin/run-java

WORKDIR /opt/app

# Add user app
RUN echo "app:x:999:999::/opt/app:/bin/false" >> /etc/passwd; \
    echo "app:x:999:" >> /etc/group; \
    mkdir -p /opt/app/logs/archives; chown -R app:app /opt/app \
    # add executable
    && chmod +x /opt/jdk/bin/run-java
