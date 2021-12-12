pipeline {
    agent any
    environment { 
        SLACK_CHANNEL = '#ci-cd-test'   
        USER = "${currentBuild.getBuildCauses()[0].shortDescription}"
        GIT_BRANCH_NAME ="${env.GIT_BRANCH}"
        MESSAGE = "${env.JOB_NAME} [${env.BUILD_NUMBER}] \n URL: ${env.BUILD_URL} \n branch : ${GIT_BRANCH_NAME} \n ${USER}(${GIT_BRANCH_NAME}) "
        SUCCESS_MESSAGE = "SUCCESSFUL: ${MESSAGE}"
        ERROR_MESSAGE = "FAILED: ${MESSAGE}"
        START_MESSAGE = "STARTED: ${MESSAGE}"
    }
    stages {
        // CI 시작
        stage('start') {
            steps {
                echo '=====================start====================='
                slackSend (channel: "${SLACK_CHANNEL}", color: '#FFFF00', message: "${START_MESSAGE}")
            }
        }
        // 리액트 프로젝트 빌드 시작
        stage('build') {
            steps {
                script {
                    try{
                          echo '=====================build====================='
                          sh 'ls -al'
                          sh "sudo npm install"
                          sh "sudo npm run build"
                    }catch(Exception e){
                        slackSend (channel: "${SLACK_CHANNEL}", color: '#FF0000', message: "${ERROR_MESSAGE}")
                    }
                }
            }
        }
        // 리액트 프로젝트 도커에 deploy 
        stage('deploy') {
            steps {
                script {
                    try{
                         echo '=====================deploy====================='
                         sh "ls -al"
                         sh "docker rm -f `docker ps -a -q`"
                         sh "docker rmi `docker images -q`"
                         sh "docker-compose up -d"
                    }catch(Exception e){
                        slackSend (channel: "${SLACK_CHANNEL}", color: '#FF0000', message: "${ERROR_MESSAGE}")
                    }
                }
            }
        }
    }
    post {
        success {
            slackSend (channel: "${SLACK_CHANNEL}", color: '#00FF00', message: "${SUCCESS_MESSAGE}")       
        }
        failure {
            slackSend (channel: "${SLACK_CHANNEL}", color: '#FF0000', message: "${ERROR_MESSAGE}")       
        }
    }
}
