FROM alpine:3.24.0

ARG VERSION

# Install all runtime dependencies in one layer
RUN apk add --no-cache \
      python3=3.14.5-r0 \
      py3-pip=26.1.2-r0 \
      ffmpeg=8.1.1-r0 \
      deno=2.7.4-r2

# Download yt-dlp, symlink python3 as python, and install the EJS challenge plugin.
# py3-pip on Alpine enforces PEP 668; --break-system-packages is required in a container context.
RUN wget "https://github.com/yt-dlp/yt-dlp/releases/download/${VERSION}/yt-dlp" \
      -O /usr/local/bin/youtube-dl \
    && chmod a+rx /usr/local/bin/youtube-dl \
    && ln -s /usr/bin/python3 /usr/local/bin/python \
    && pip install --break-system-packages yt-dlp-ejs==0.8.0

# Set up working dir, placeholder start script, and non-root user
RUN mkdir -p /ytdl/start \
    && printf '#!/bin/sh\necho "Mount a volume to /ytdl/start replacing start.sh with your yt-dlp commands."\n' \
       > /ytdl/start/start.sh \
    && chmod +x /ytdl/start/start.sh \
    && adduser -D ytdl \
    && chown -R ytdl /ytdl

USER ytdl
WORKDIR /ytdl
CMD ["./start/start.sh"]
