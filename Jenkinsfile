pipeline {
    agent any
    stages {
        stage('Make foo') {
            steps {
                sh '''
                    touch foo
                '''
            }
        }
        stage('Check foo') {
            when {
                return expression { test -f foo == true }
            }
            steps {
                sh '''
                    echo "bar"
                '''
            }
        }
    }
}