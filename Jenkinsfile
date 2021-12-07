pipeline {
    agent any
     tools {
        nodejs "node14"
        git "git"
    }
    stages {
        stage('전처리') {
            steps {
                echo 'prepare'
                git branch: "${BRANCH}", credentialsId: "GIT_ACCOUNT", url: 'https://github.com/dnr14/ci-cd-jenkins-tutorial.git'
                sh  'ls -al'
            }
        }
        stage('빌드') {
            steps {
                echo 'build'
                sh 'ls -al'
                sh "npm install"
                sh "CI=false npm run build"
            }
        }
        stage('배포') {
            steps {
                echo 'deploy'
                sh "ls -al"
            }
        }
    }
}
