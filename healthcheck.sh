#!/bin/bash

echo "........................................................."
echo "Chequeando si el HUB está listo para ejecutar las pruebas"
echo "Checking if hub is ready - $HUB_HOST"
echo "........................................................."

while [ "$(curl -s http://$HUB_HOST:4444/status | jq -r .value.nodes[0].availability)" != "UP" ]
do
        sleep 5
done

while [ "$(curl -s http://$HUB_HOST:4444/status | jq -r .value.nodes[1].availability)" != "UP" ]
do
        sleep 5
done

# start the java command
java -cp selenium-docker.jar:selenium-docker-tests.jar:classes/*:test-classes/*:lib/* io.cucumber.core.cli.Main