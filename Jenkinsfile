pipeline {
    agent any
    stages {
        stage('Build Container') {
            steps {
                echo 'Building $BRANCH_NAME'
                echo 'Current directory ${params:currentPath}'
                sh build-unittest.sh
            }


        }
        stage('Run Tests') {
            steps {
                echo 'Running Tests $BRANCH_NAME'
            }
        }
        stage('Results') {
            steps {
                step([
                  
                ])
            }
        }
        stage('Remove Test Containers') {
            steps {
                echo 'Current directory ${params:currentPath}'

            }
        }
        stage('Deploy DB To Support') {
                echo 'Current directory ${params:currentPath}'
        }
        stage('Deploy To Support') {
                echo 'Current directory ${params:currentPath}'
        }
    }
}