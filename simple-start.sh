#!/bin/bash

JAR=$(ls ${HOME}/*.jar | head -n1)

: ${JVM_HEAP_MEMORY =512m}
: ${JVM_METASPACE_SIZE=128M}
: ${JVM_MAX_METASPACE_SIZE=128M}
: ${CUSTOM_JAVA_OPTS=}

export JAVA_OPTS="-server"
export JAVA_OPTS="${JAVA_OPTS} -Xms${JVM_HEAP_MEMORY }"
export JAVA_OPTS="${JAVA_OPTS} -Xmx${JVM_HEAP_MEMORY }"
export JAVA_OPTS="${JAVA_OPTS} -XX:MetaspaceSize=${JVM_METASPACE_SIZE}"
export JAVA_OPTS="${JAVA_OPTS} -XX:MaxMetaspaceSize=${JVM_MAX_METASPACE_SIZE}"
export JAVA_OPTS="${JAVA_OPTS} -XX:+ExitOnOutOfMemoryError"
export JAVA_OPTS="${JAVA_OPTS} -XX:+PrintGCDetails"
export JAVA_OPTS="${JAVA_OPTS} -XX:+PrintGCTimeStamps"
export JAVA_OPTS="${JAVA_OPTS} -XX:+PrintGCDateStamps"
export JAVA_OPTS="${JAVA_OPTS} ${CUSTOM_JAVA_OPTS}"	 

trap 'kill -TERM ${JVM_PID}' TERM INT

echo "exec java ${JAVA_OPTS} -jar ${JAR}"
java ${JAVA_OPTS} -jar ${JAR} &

JVM_PID=$!

wait ${JVM_PID}
exit $?