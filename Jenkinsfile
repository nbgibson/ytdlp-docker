pipeline {
    agent any
    
    environment {
        DOCKERUSER = credentials('dockerUsername')
        DOCKERTOKEN = credentials('dockerToken')
    }
    stages {
        stage('Determine latest ytdlp version') {
            steps {
                sh '''
                    curl https://api.github.com/repos/yt-dlp/yt-dlp/releases/latest -s | jq .name -r | cut -c 8- >> version
                    cat version
                '''
            }
        }
        stage('Docker Build') {
            steps {
                sh '''
                    echo "$DOCKERTOKEN" | docker login -u $DOCKERUSER --password-stdin 
                    docker build . --label build_date=$(date +%Y-%m-%d) -t $DOCKERUSER/$(cat version)
                '''
            }
        }
    }
}
