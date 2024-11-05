FROM openjdk:8-jdk-alpine

ARG Param
ARG JAVA_OPTS

ENV Param=${Param}
ENV JAVA_OPTS=${JAVA_OPTS}

ENV TimeZone=Asia/Shanghai

COPY  target/*.jar /opt/docker.jar

RUN ln -snf /usr/share/zoneinfo/$TimeZone /etc/localtime && echo $TimeZone > /etc/timezone && touch /opt/docker.jar

EXPOSE 8080

VOLUME [ "/tmp","/opt/logs/" ]

ENTRYPOINT [ "sh", "-c", "java -Djava.security.egd=file:/dev/./urandom $JAVA_OPTS -jar /opt/docker.jar $PARAMS" ]