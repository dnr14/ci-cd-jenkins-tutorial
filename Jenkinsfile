pipeline {
    agent any
    stages {
        stage('======================start======================') {
            agent any
            steps {
                slackSend (channel: "${SLACK_CHANNEL}", color: '#FFFF00', message: "STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL}), 작업자 ${currentBuild.getBuildCauses()[0].shortDescription}")
            }
        }
        stage('======================build======================') {
            steps {
                echo 'build'
                sh 'ls -al'
                sh "sudo npm install"
                sh "sudo npm run build"
            }
        }
        stage('======================deploy======================') {
            steps {
                echo 'deploy'
                sh "ls -al"
                sh "docker rm -f `docker ps -a -q`"
                sh "docker rmi `docker images -q`"
                sh "docker-compose up -d"
            }
        }
    }
    post {
        success {
            slackSend (channel: "${SLACK_CHANNEL}", color: '#00FF00', message: "SUCCESSFUL: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL}), 작업자 ${currentBuild.getBuildCauses()[0].shortDescription}")
        }
        failure {
            slackSend (channel: "${SLACK_CHANNEL}", color: '#FF0000', message: "FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL}), 작업자 ${currentBuild.getBuildCauses()[0].shortDescription}")
        }
    }
}
