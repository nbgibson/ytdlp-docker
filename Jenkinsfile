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
                expression { return "test -f foo" }
            }
            steps {
                sh '''
                    echo "bar"
                '''
            }
        }
    }
}