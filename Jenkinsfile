pipeline {
    agent any
    stages {
        stage('Build Container') {
            steps {
                echo 'step build'
                sh build-unittest.sh
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