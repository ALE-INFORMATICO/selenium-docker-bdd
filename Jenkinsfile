pipeline {
    agent any
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
        stage("Docker-Compose UP"){
            steps{
                sh "docker-compose down -v"
            }
        }
    }
}
