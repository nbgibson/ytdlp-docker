pipeline {
    agent any
    stages {
        stage('Docker Check') {
            steps {
                sh '''
                    if (systemctl is-active --quiet docker) ; then
                        export dockerInstall=true
                    else
                        export dockerInstall=false
                    fi
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
