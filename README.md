# Docker image containing Oracle JDK 8 with Java Cryptography Extension
Basic Docker image to run stand alone java applications as user app (499:499)

============================================================================================
Optionally start.sh or simple-start.sh can be used to execute java application jar with specificed parameters:
Both scripts handle kill -TERM in trap
Both scripts use ExitOnOutOfMemoryError

------------------------------------------------------------
simple-start.sh - used globally with simplified approach

JVM_HEAP_MEMORY  // default -> 512m for JVM_XMS and JVM_XMX

JVM_METASPACE_SIZE // default -> 128M

JVM_MAX_METASPACE_SIZE // default -> 128M

POM_JAVA_OPTS // default -> empty

CUSTOM_JAVA_OPTS // default -> (empty)

------------------------------------------------------------

start.sh - used for projects dependent on ldz common components 

APP_NAME // default -> $APP_NAME_FROM_JAR (application jar filename parsed to get app name)

LOG_DIR // default -> ${HOME}/logs (HOME=/opt/app as set in Dockerfile)

LOGBACK_PATH // default -> ${HOME}/logback/logback.xml 

JAVA_CLASSPATH // default -> -cp ${JAR}:${HOME}/lib/*  // $JAR is the jar path

JVM_XMS // default -> 512m

JVM_XMS // default -> 512m

JVM_METASPACE_SIZE // default -> 128M

JVM_MAX_METASPACE_SIZE // default -> 128M

JAVA_SECURITY_EGD // default -> -Djava.security.egd=file:/dev/./urandom

POM_JAVA_OPTS // default -> empty

CUSTOM_JAVA_OPTS // default -> empty

APP_OPTS // default -> -d

DEBUG_PORT // default -> empty (setting this variable will start application in debug mode listening on specified port number)



Script mandatory to be set in docker maven plugin pom.xml:

\<cmd\>["/opt/app/simple-start.sh"]\</cmd\>

or 

\<cmd\>["/opt/app/start.sh"]\</cmd\>
