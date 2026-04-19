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

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -input=false -out=tfplan'
            }
        }

        //stage('Terraform Apply') {
        //    steps {
       //        input message: 'Do you want to apply Terraform changes?'
      //        sh 'terraform apply -input=false -auto-approve tfplan'
     //      }
    //   }
    }

    post {
        success {
            echo 'Infrastructure provisioned successfully'
        }
        failure {
            echo 'Pipeline failed'
        }
    }
}
