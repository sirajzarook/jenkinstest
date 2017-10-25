pipeline {
    agent any
    stages {
        stage('Build Container') {
            steps {
                echo 'step build'
                checkout scm
                bat 'each hello'
            }
        }
        stage('Run Tests') {
            steps {
                echo 'step test'

            }
        }
        stage('Results') {
            steps {
                echo 'step result'
            }
        }
        stage('Remove Test Containers') {
            steps {
                echo 'remove container'

            }
        }

    }
}