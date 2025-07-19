pipeline {
    agent any
    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build('flask-jenkins-demo')
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                script {
                    sh 'docker rm -f flask-app || true'
                    sh 'docker run -d -p 5000:5000 --name flask-app flask-jenkins-demo'
                }
            }
        }
    }
}
