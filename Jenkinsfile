pipeline {
    agent {
        docker {
            image 'maven:3-alpine'
            args '-v /root/.m2:/root/.m2'
        }
    }
    stages {
        stage("Package"){
			steps{
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
    }
}
