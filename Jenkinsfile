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
                sh 'ls -al'
                sh 'curl -L "https://github.com/docker/compose/releases/download/1.28.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose'
                sh 'chmod +x /usr/local/bin/docker-compose'
                sh 'docker-compose --version'
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
                            reportTitle: 'My report',
                            jsonReportDirectory: 'target/cucumber-reports/json-reports/',
                            fileIncludePattern: '**/*.json',
                            sortingMethod: 'ALPHABETICAL',
                            trendsLimit: 100
                }
            }
        }
    }
}
