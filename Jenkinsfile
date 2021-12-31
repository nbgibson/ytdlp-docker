pipeline {
    agent any
    stages {
        stage('Docker Check') {
            steps {
                sh '''
                    if (systemctl is-active --quiet docker) {
                        export dockerInstall=true
                    }
                    else {
                        export dockerIntall=false
                    }
                '''
            }
        }
        
        stage('Docker Install') {
            when { environment name: 'dockerInstall', value: 'false' }
            steps {
                sh '''
                    echo "Installing docker..."
                '''
            }
        }
    }
}
