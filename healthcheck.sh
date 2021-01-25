#!/bin/bash

echo "........................................................."
echo "Chequeando si el HUB está listo para ejecutar las pruebas"
echo "IP del hub es -> $HUB_HOST"
echo "........................................................."

while [ "$(curl -s http://localhost:4444/status | jq -r .value.nodes[0].availability)" != "UP" ]
do
        sleep 5
done

while [ "$(curl -s http://localhost:4444/status | jq -r .value.nodes[1].availability)" != "UP" ]
do
        sleep 5
done

# start the java command
java -cp selenium-docker-bdd.jar:selenium-docker-bdd-tests.jar:classes/:test-classes/:libs/* io.cucumber.core.cli.Main features/ --glue stepdefs/