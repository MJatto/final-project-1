pipeline {
  agent any

  environment {
    IMAGE_NAME = "mjatto/java-webapp-calculator"
    TAG = "${BUILD_NUMBER}"
  }

  stages {
    stage('Build') {
      steps {
        sh 'mvn clean package'
      }
    }

    stage('Docker Build & Push') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
          sh '''
            docker build -t $IMAGE_NAME:$TAG .
            echo "$PASS" | docker login -u "$USER" --password-stdin
            docker push $IMAGE_NAME:$TAG
          '''
        }
      }
    }

    stage('Deploy to EKS') {
      steps {
        sh '''
          export KUBECONFIG=/var/lib/jenkins/.kube/config
          kubectl set image deployment/java-webapp webapp=$IMAGE_NAME:$TAG --namespace=default
        '''
      }
    }
  }
}
