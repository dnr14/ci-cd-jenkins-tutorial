pipeline {
    agent any
    stages {
        stage('빌드') {
            steps {
                echo 'build'
                sh 'ls -al'
                sh "sudo npm install"
                sh "sudo npm run build"
            }
        }
        stage('배포') {
            steps {
                echo 'deploy'
                sh "ls -al"
                sh "docker rm -f `docker ps -a -q`"
                sh "docker rmi `docker images -q`"
                sh "docker-compose up -d"
            }
        }
    }
}
