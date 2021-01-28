pipeline {
    agent {
        docker {
            image 'maven:3-alpine'
            args '-v /root/.m2:/root/.m2'
        }
    }
    stages {
        stage('Build Image') {
            steps {
                script {
                    app = docker.build("alejandrocontreras/dockerbdd")
                }
            }
        }
        stage('Push Image') {
            steps {
                script {
        		    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
        			app.push("${BUILD_NUMBER}")
        			app.push("latest")
        			}
                }
            }
        }
        stage('Test') {
            steps {
                sh 'mvn clean test -DHUB_HOST=162.222.178.134'
            }
            post {
                always {
                    cucumber buildStatus: 'UNSTABLE',
                            failedFeaturesNumber: 1,
                            failedScenariosNumber: 1,
                            skippedStepsNumber: 1,
                            failedStepsNumber: 1,
                            reportTitle: 'Reporte Cucumber BDD',
                            jsonReportDirectory: 'target/cucumber-reports/json-reports/',
                            fileIncludePattern: '**/*.json',
                            sortingMethod: 'ALPHABETICAL',
                            trendsLimit: 100
                }
            }
        }
    }
}
