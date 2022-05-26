pipeline {
    agent any/*{
        kubernetes {
            yaml '''
                apiVersion: v1
                kind: Pod
                spec:
                  containers:
                  - name: buildagent
                    image: nbgibson/dockerbuildagent:1.1
                    tty: true
                  imagePullSecrets:
                  - name: regcred
            '''
        }
  }*/

    environment {
        DOCKERUSER = credentials('dockerUsername')
        DOCKERTOKEN = credentials('dockerToken')
        VERSION = ""
    }
    stages {
        stage('Determine latest ytdlp version') {
            steps {
                sh '''
                curl https://api.github.com/repos/yt-dlp/yt-dlp/releases/latest -s | jq .name -r | cut -c 8- > version
                cat version
                ${env.VERSION} = version
                echo "env.VERSION = ${env.VERSION}" 
                '''
            }
        }
        /*stage('Docker Build') {
            steps {
                sh '''
                echo $DOCKERUER
                cat version
                echo "$DOCKERTOKEN" | docker login -u $DOCKERUSER --password-stdin 
                docker build --build-arg VERSION="${VERSION}" . --label build_date=$(date +%Y-%m-%d) -t $(echo $DOCKERUSER)/ytdl:$(cat version)
                docker push $(echo $DOCKERUSER)/ytdl:$(cat version)
                docker build --build-arg VERSION="${VERSION}" . --label build_date=$(date +%Y-%m-%d) -t $(echo $DOCKERUSER)/ytdl:latest
                docker push $(echo $DOCKERUSER)/ytdl:latest
                '''
            }
        }*/
    }
}
