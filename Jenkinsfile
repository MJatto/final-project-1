pipeline {
  agent any

  environment {
    AWS_REGION = 'us-east-1'
    BUCKET_NAME = 'project3-upload-bucket-enesi'
  }

  stages {
    stage('Checkout') {
      steps {
        git branch: 'project-3', url: 'https://github.com/MJatto/final-project-1.git'
      }
    }

    stage('Zip Lambda') {
      steps {
        sh 'zip lambda_function.zip lambda_function.py'
      }
    }

    stage('Terraform Init') {
      steps {
        dir('terraform') {
          sh 'terraform init'
        }
      }
    }

    stage('Terraform Apply') {
      steps {
        dir('terraform') {
          sh 'terraform apply -auto-approve'
        }
      }
    }
  }
}
