# Docker image containing Oracle JDK 8 with Java Cryptography Extension
Basic Docker image to run stand alone java applications as user app (499:499)

============================================================================================
Optionally start.sh can be used to execute java application jar with specificed parameters:

LOG_DIR   // default -> ${HOME}/logs (HOME=/opt/app as set in Dockerfile)

APP_PARAMS // default -> -d

LOGBACK_PATH // default -> ${HOME}/logback/logback.xml 

JAVA_CLASSPATH // default -> -cp ${HOME}/${APP_NAME}-${APP_VERSION}.jar:${HOME}/lib/*

Xms default -> 128m

Xms default -> 512m

MetaspaceSize default -> 128M

MaxMetaspaceSize default -> 128M

CUSTOM_JAVA_OPTS default -> empty

DEBUG_PORT default -> empty (setting this variable will start application in debug mode listening on specified port number)


Script mandatory parameters to be set in pom.xml:

\<env\>

   \<APP_NAME\>${project.artifactId}\</APP_NAME\>

   \<APP_VERSION\>${project.version}\</APP_VERSION\>

\</env\>

\<cmd\>["/opt/app/start.sh"]\</cmd\>