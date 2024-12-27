pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo "building"
        sleep 2
      }
    }
    stage('Test') {
      steps {
        echo "testing"
      }
    }

stage("pusher l'image en DockerHub") {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'DockerHub', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {

                        sh "echo \$DOCKER_PASSWORD | docker login -u \$DOCKER_USERNAME --password-stdin"
                      
                    }
                }
            }
        }


    
    stage('Test SSH Connection') {
            steps {
                sshagent(["MyServer"]) {
                    sh 'ssh -o StrictHostKeyChecking=no oualid@192.168.136.128 "echo SSH connection successful!"'
                }
            }
        }
    stage('Deploy') {
      steps {
        echo "deploying"
      }
    }
  }
   post {
        always {
            sh "docker logout"
        }
    }
}
