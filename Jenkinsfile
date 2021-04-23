pipeline {
  environment {
    registry = "octumn/realworld_backend"
    registryCredential = 'dockerhub'
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        checkout scm
      }
    }
    stage('Building image') {
      steps {
        sh "docker build -t octumn/realworld_backend:v1.1.$BUILD_NUMBER ."
      }
    }
    stage('Pushing image') {
      steps{
        
        withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'usr', passwordVariable: 'pwd')]) {
            sh "docker login --username=usr --password=pwd"
            sh "docker push octumn/realworld_backend:v1.0.$BUILD_NUMBER"
        }
      }
    }
  }
}
