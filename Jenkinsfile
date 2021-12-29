pipeline {
    agent any
    stages {
        stage('Docker Setup') {
            steps {
                script {
                    //Condition Check logic
                    echo "Hi mom"
                    systemctl is-active --quiet docker || echo "Service is not running"
                    
                    //Steps to perform
                    /* 
                    apt update
                    apt install apt-transport-https ca-certificates curl gnupg2 software-properties-common
                    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
                    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
                    apt update
                    apt-cache policy docker-ce
                    apt install docker-ce
                    systemctl status docker 
                    */
                }
            }
        }
    }
}