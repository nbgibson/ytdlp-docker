pipeline {
    agent any
    stages {
        stage('Docker Install') {
            when {
                expression {
                    sh '''
                    if (systemctl is-active --quiet docker) {
                        return true
                    }
                    else {
                        return false
                    }
                    '''
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
