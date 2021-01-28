pipeline {
    agent none
    stages {
        stage('Build Jar') {
            agent {
                docker {
                    image 'maven:3-alpine'
                    args '-v /root/.m2:/root/.m2'
                }
            }
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }
        stage('Build Image') {
            steps {
                script {
                	app = docker.build("alejandrocontreras/seleniumdockerbdd")
                }
            }
        }
        stage('Build Jar 2') {
            agent {
                docker {
                    image 'alejandrocontreras/seleniumdockerbdd'
                }
            }
            steps {
                sh 'docker run -it --entrypoint /bin/bash alejandrocontreras/seleniumdockerbdd'
                sh 'ls -al'
                sh 'docker-compose up -d --scale chrome=2 --scale firefox=2'
            }
        }
    }
}
