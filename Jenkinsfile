pipeline {
    agent any
    stages {
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