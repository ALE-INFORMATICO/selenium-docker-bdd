#!/bin/bash

echo "........................................................."
echo "Chequeando si el HUB está listo para ejecutar las pruebas"
echo "IP del hub es -> $HUB_HOST"
echo "........................................................."

while [ "$(curl -s http://162.222.178.134:4444/status | jq -r .value.nodes[0].availability)" != "UP" ]
do
        sleep 10
done

# start the java command
java -cp selenium-docker-bdd.jar:selenium-docker-bdd-tests.jar:classes/:test-classes/:libs/* -DHUB_HOST=162.222.178.134 io.cucumber.core.cli.Main