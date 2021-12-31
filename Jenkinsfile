pipeline {
    agent any
    stages {
        stage('Docker Check') {
            steps {
                sh '''
                    if (systemctl is-active --quiet docker) ; then
                        env.dockerInstall=true
                        echo "Setting dockerInstall to 'true'"
                    else
                        env.dockerInstall=false
                        echo "Setting dockerInstall to 'false'"
                    fi
                '''
            }
        }
        stage('Var sanity check') {
            steps {
                sh '''
                    echo ${env.dockerInstall}
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
