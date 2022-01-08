FROM alpine:latest
#Update packages and install dependencies
RUN apk update && apk upgrade && apk add --no-cache python3 && apk add ffmpeg
#Install ytdlp, brand it as ytdl, and fix Python command to use Python3
RUN wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -O /usr/local/bin/youtube-dl && chmod a+rx /usr/local/bin/youtube-dl && ln -s /usr/bin/python3 /usr/local/bin/python
#Create ytdl working dir
RUN mkdir -p /ytdl/start
#Copy in start script and make it executable
RUN echo $'------------ \n Please mount a volume to \'/ytdl/start\' to replace this file with a start.sh that contains the desired commands and parameters \n------------' >> /ytdl/start/start.sh
#Enable start.sh dummy file execution
RUN chmod +x /ytdl/start/start.sh
#Create ytdl user so root isn't executing
RUN adduser -D ytdl && chown -R ytdl /ytdl
#Change to ytdl user
USER ytdl
#Change to ytdl home
WORKDIR /ytdl
#Execute start script 
CMD ./start/start.sh
