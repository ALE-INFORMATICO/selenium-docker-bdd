FROM openjdk:8u191-jre-alpine3.8

RUN apk add curl jq

# Workspace
WORKDIR /usr/share/udemy

# ADD .jar under target from host into this image
ADD target/selenium-docker-bdd.jar selenium-docker-bdd.jar
ADD target/selenium-docker-bdd-tests.jar selenium-docker-bdd-tests.jar
ADD target/classes/ classes/
ADD target/test-classes/ test-classes/
ADD target/libs/ libs/
ADD src/test/resources/features features/
ADD src/test/java/com/test/stepdefs/ stepdefs/
ADD healthcheck.sh healthcheck.sh

ENTRYPOINT sh healthcheck.sh