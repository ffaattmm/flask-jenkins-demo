
pipeline {
    agent any
    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("ffaattmm/flask-jenkins-demo")
                }
            }
        }

        stage('Push to DockerHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    script {
                        sh "docker login -u $DOCKER_USER -p $DOCKER_PASS"
                        sh "docker push ffaattmm/flask-jenkins-demo"
                    }
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    sh 'docker rm -f flask-app || true'
                    sh 'docker run -d -p 5000:5000 --name flask-app ffaattmm/flask-jenkins-demo'
                }
            }
        }
    }
}
