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
        stage('Docker Install') {
            when {
                not{
                    expression { return "test -f foo" }
                }
            }
            steps {
                sh '''
                    echo "Installing docker..."
                '''
            }
        }
    }
}