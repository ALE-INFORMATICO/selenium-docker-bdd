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
                sh 'curl -L "https://github.com/docker/compose/releases/download/1.28.2/docker-compose-$(uname -s)-$(uname -m)" -o /home/test24122020/docker-compose'
                sh 'chmod +x /home/test24122020/docker-compose'
                sh 'docker-compose --version'
            }
        }
    }
}
