pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
        AWS_DEFAULT_REGION    = 'us-east-1'
        TF_INPUT              = '0'
    }

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/DCchauhan07/jenkins-terraform-aws-project.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh '''
                    terraform init -input=false
                '''
            }
        }

        stage('Terraform Validate') {
            steps {
                sh '''
                    terraform validate
                '''
            }
        }

        stage('Terraform Plan') {
            steps {
                sh '''
                    terraform plan -input=false -no-color
                '''
            }
        }

        stage('Approval for Apply') {
            steps {
                input message: 'Approve Terraform Apply?'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh '''
                    terraform apply -auto-approve -input=false
                '''
            }
        }
    }

    post {
        success {
            echo '✅ Infrastructure provisioned successfully in us-east-1'
        }
        failure {
            echo '❌ Pipeline failed'
        }
    }
}
