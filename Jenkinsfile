pipeline {
    agent any
    stages {
        stage('Make foo') {
            steps {
                sh '''
                    touch bar
                '''
            }
        }
        stage('Docker Install') {
            when {
                not{
                    return "test -f foo"
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