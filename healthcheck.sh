#!/bin/bash

echo "........................................................."
echo "Chequeando si el HUB está listo para ejecutar las pruebas"
echo "IP del hub es -> $HUB_HOST"
echo "........................................................."

while [ "$(curl -s http://$HUB_HOST:4444/status | jq -r .value.nodes[0].availability)" != "UP" ]
do
        sleep 3
done

# start the java command
java -cp selenium-docker-bdd.jar:selenium-docker-bdd-tests.jar:classes/:test-classes/:libs/* -DHUB_HOST=$HUB_HOST io.cucumber.core.cli.Main --plugin json:./report/report.json
