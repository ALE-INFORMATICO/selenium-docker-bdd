#!/bin/bash

echo "........................................................."
echo "Chequeando si el HUB está listo para ejecutar las pruebas"
echo "IP del hub es -> $HUB_HOST"
echo "........................................................."

while [ "$(curl -s http://162.222.178.134:4444/status | jq -r .value.nodes[0].availability)" != "UP" ]
do
        sleep 5
done

while [ "$(curl -s http://162.222.178.134:4444/status | jq -r .value.nodes[1].availability)" != "UP" ]
do
        sleep 5
done

# start the java command
java -cp selenium-docker-bdd:selenium-docker-bdd-tests.jar:classes/:test-classes/:libs/* io.cucumber.core.cli.Main