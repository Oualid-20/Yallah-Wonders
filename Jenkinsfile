pipeline {
    agent any
    
    environment {
        GIT_REPO = "Oualid-20/Yallah-Wonders"
        IMAGE_NAME = "oualidbellaoui/yallah-wonders:latest"
        APP_SERVICE = "php-apache mysql phpmyadmin"
        REMOTE_HOST = "192.168.136.128"  
        REMOTE_USER = "oualid"           
        REMOTE_PATH = "/home/oualid/QualiteProjet"
    }

    stages {
    
        stage("Cloner le projet") {
            steps {
                script {
                    checkout scm
                }
            }
        }
        
        stage("Build en image Docker") {
            steps {
               script {
                    sh "docker-compose build ${env.APP_SERVICE}"

                    sh "docker tag yallah-wonders ${env.IMAGE_NAME}"
                }
            }
        }
        
        stage("Pusher l'image sur DockerHub") {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'DockerHub', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                        sh "echo \$DOCKER_PASSWORD | docker login -u \$DOCKER_USERNAME --password-stdin"
                        
                        sh "docker push ${env.IMAGE_NAME}"
                    }
                }
            }
        }

        stage("Deploiement Serveur Ubuntu") {
            steps {
                script {
                    sshagent(['MyServer']) {
                        sh """
                            ssh -o StrictHostKeyChecking=no ${env.REMOTE_USER}@${env.REMOTE_HOST} "cd ${env.REMOTE_PATH} && 
                            git pull origin main && docker pull ${env.IMAGE_NAME} && docker-compose up -d"
                        """
                    }
                }
            }
        }
    }
    
    post {
        always {
            sh "docker logout"
        }
    }
}

