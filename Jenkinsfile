pipeline {
    agent any
    stages {
        stage('Docker Check') {
            steps {
                sh '''
                    touch dockerStatus
                    if (systemctl is-active --quiet docker) ; then
                        echo 'true' >> dockerStatus
                        echo "Setting dockerInstall to 'true'"
                    else
                        echo 'false' >> dockerStatus
                        echo "Setting dockerInstall to 'false'"
                    fi
                '''
            }
        }
        stage('Var sanity check') {
            steps {
                sh '''
                    cat dockerStatus
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
