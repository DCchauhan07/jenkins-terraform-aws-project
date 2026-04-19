pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
        AWS_DEFAULT_REGION    = 'us-east-1'
        TF_IN_AUTOMATION      = 'true'
    }

    stages {
        stage('Terraform Init') {
            steps {
                sh 'terraform init -input=false'
            }
        }

        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Terraform Destroy') {
            steps {
                input message: 'Do you want to destroy Terraform-managed infrastructure?'
                sh 'terraform destroy -input=false -auto-approve'
            }
        }
    }

    post {
        success {
            echo 'Terraform destroy completed successfully'
        }
        failure {
            echo 'Terraform destroy failed'
        }
    }
}
