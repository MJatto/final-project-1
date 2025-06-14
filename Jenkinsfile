pipeline {
    agent any

    environment {
        EC2_USER = 'ec2-user'
        EC2_HOST = '44.219.221.221'
        EC2_APP_PATH = '/home/ec2-user/final-project-1'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'project-2', url: 'https://github.com/MJatto/final-project-1.git'
            }
        }

        stage('Deploy to EC2') {
            steps {
                sshagent(credentials: ['chat-ec2-key']) {
                    sh """
                        ssh -o StrictHostKeyChecking=no $EC2_USER@$EC2_HOST 'mkdir -p $EC2_APP_PATH'
                        rsync -avz -e "ssh -o StrictHostKeyChecking=no" . $EC2_USER@$EC2_HOST:$EC2_APP_PATH
                        ssh $EC2_USER@$EC2_HOST '
                            cd $EC2_APP_PATH &&
                            npm install &&
                            pm2 start app.js --name chat-app || pm2 restart chat-app &&
                            pm2 save
                        '
                    """
                }
            }
        }
    }
}

