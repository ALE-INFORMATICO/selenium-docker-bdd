FROM openjdk:8u191-jre-alpine3.8

RUN apk add curl jq

# Workspace
WORKDIR /usr/share/udemy

# ADD .jar under target from host into this image
ADD target/selenium-docker.jar 			selenium-docker.jar
ADD target/selenium-docker-tests.jar 	selenium-docker-tests.jar
ADD target/classes                      classes
ADD target/test-classes                 test-classes
ADD target/libs							libs
ADD healthcheck.sh                      healthcheck.sh

ENTRYPOINT sh healthcheck.sh