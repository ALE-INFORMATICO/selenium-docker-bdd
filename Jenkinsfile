pipeline {
    agent {
        docker {
            image 'maven:3-alpine' 
            args '-v /root/.m2:/root/.m2' 
        }
    }
    stages {
        stage("Start Grid"){
			steps{
				sh "docker-compose up -d --scale chrome=3 --scale firefox=3"
			}
		}
        stage("Check healthcheck"){
			steps{
				sh "healthcheck.sh"
			}
		}
        stage('Build') { 
            steps {
                sh 'mvn clean test' 
            }
        }
    }
    post{
		always{
			junit 'target/surefire-reports/*.xml'
			sh "docker-compose down -v"
		}
	}
}
