#!/bin/bash

: ${LOG_DIR=${HOME}/logs}
: ${APP_PARAMS=-d}
: ${LOGBACK_PATH=${HOME}/logback/logback.xml}
: ${JAVA_CLASSPATH=-cp ${HOME}/${APP_NAME}-${APP_VERSION}.jar:${HOME}/lib/*}
: ${Xms=128m}
: ${Xms=512m}
: ${MetaspaceSize=128M}
: ${MaxMetaspaceSize=128M}
: ${CUSTOM_JAVA_OPTS=}

JAR=$(ls ${HOME}/${APP_NAME}*.jar | head -n1)

shift

export JAVA_OPTS="${JAVA_OPTS} -verbose:gc -XX:+PrintGCDetails -Dsun.rmi.dgc.client.gcInterval=3600000 -Dsun.rmi.dgc.server.gcInterval=3600000"
export JAVA_OPTS="${JAVA_OPTS} -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=${LOG_DIR} -Xms${Xms} -Xmx${Xmx} -XX:MetaspaceSize=${MetaspaceSize} -XX:MaxMetaspaceSize=${MaxMetaspaceSize}"
export JAVA_OPTS="${JAVA_OPTS} -Duser.home=${HOME} -Dapp=${APP_NAME} -Dlogback.configurationFile=${LOGBACK_PATH} -Xloggc:${LOG_DIR}/${APP_NAME}-gc.log"
export JAVA_OPTS="${JAVA_OPTS} -XX:+UseCompressedOops -Djava.awt.headless=true -server -Dnet.sf.ehcache.skipUpdateCheck=true"
export JAVA_OPTS="${JAVA_OPTS} -Djava.security.egd=file:/dev/./urandom"
export JAVA_OPTS="${JAVA_OPTS} ${JAVA_CLASSPATH}"
export JAVA_OPTS="${JAVA_OPTS} ${CUSTOM_JAVA_OPTS}" 

if [[ !  -z  ${DEBUG_PORT}  ]]; then
   export JAVA_OPTS="${JAVA_OPTS} -Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=${DEBUG_PORT}" 
fi

echo "exec java ${JAVA_OPTS} -jar ${JAR} ${APP_PARAMS}"
exec java ${JAVA_OPTS} -jar ${JAR} ${APP_PARAMS}