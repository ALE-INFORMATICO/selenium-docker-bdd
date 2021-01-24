# PROYECTO SELENIUM DOCKER BDD #

Selenium Docker BDD con librerías actualizadas a 2021

### Tecnologías usadas ###

* [Java SE Development Kit 8](https://www.oracle.com/cl/java/technologies/javase/javase-jdk8-downloads.html)
* [Maven](https://maven.apache.org/)
* [Selenium](https://www.selenium.dev/)
* [Cucumber](https://cucumber.io/)
* [TestNG](https://testng.org/doc/)
* [Docker Selenium](https://github.com/SeleniumHQ/docker-selenium)

### Ejecución ###
* Levantar selenium grid con docker-compose: docker-compose up -d --scale chrome=x --scale firefox=y
* Empaquetar jar ejecutables y dependencias: mvn clean package
* Copiar jars, librerias y features a una imagen que contenga java para luego ejecutarlo con java CLI.
* Ejecutar pruebas en modo CLI con java: java -cp selenium-docker.jar:selenium-docker-tests.jar:lib/* io.cucumber.core.cli.Main features/ --glue com.test.stepdefs
* Para bajar selenium grid: docker-compose down | docker-compose down -v (si también queremos eliminar volumen)

### DATOS PERSONALES ###

* Alejandro Contreras | ale.innformatico@gmail.com

### Créditos ###

* Este proyecto es una modificación y actualización de librerías del proyecto creado por Vinoth Selvaraj
* Link del proyecto --> [https://github.com/vinsguru/selenium-docker-bdd](https://github.com/vinsguru/selenium-docker-bdd)
* Curso Udemy --> [selenium-webdriver-with-docker](https://www.udemy.com/course/selenium-webdriver-with-docker/)
