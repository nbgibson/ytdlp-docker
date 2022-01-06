pipeline {
    agent any
    stages {
        stage('Docker Check') {
            steps {
                sh '''
                    cat Dockerfile
                '''
            }
        }
    }
}
