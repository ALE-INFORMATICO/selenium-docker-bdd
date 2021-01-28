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
                	app = docker.build("alejandrocontreras/dockerbdd")
                }
            }
        }
        /*stage('Push Image') {
            steps {
                script {
			        docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
			        	app.push("${BUILD_NUMBER}")
			            app.push("latest")
			        }
                }
            }
        }
        stage("Pull Latest Image") {
        	steps{
        	    sh "docker pull alejandrocontreras/dockerbdd"
        	}
        }*/
        stage("Start Grid") {
        	steps{
        	    sh "docker-compose up -d"
        	}
        }
        stage ("waiting grid") {
        	steps{
        		echo 'Waiting 10 seconds'
        		sleep 10
        	}
        }
        stage("Run Test") {
        	steps{
        		sh "docker run -e HUB_HOST=162.222.178.134 alejandrocontreras/dockerbdd"
        	}
        }
    }
    post{
        always{
            sh "docker-compose down -v"
            cucumber buildStatus: 'UNSTABLE',
                            failedFeaturesNumber: 1,
                            failedScenariosNumber: 1,
                            skippedStepsNumber: 1,
                            failedStepsNumber: 1,
                            reportTitle: 'My report',
                            jsonReportDirectory: 'target/cucumber-reports/json-reports/',
                            fileIncludePattern: '**/*.json',
                            sortingMethod: 'ALPHABETICAL',
                            trendsLimit: 100
        }
    }
}

