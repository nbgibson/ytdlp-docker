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
                expression { return readFile('foo').contains('') }
            }
            steps {
                sh '''
                    echo "bar"
                '''
            }
        }
    }
}