FROM n8nio/n8n:1.113.3-alpine
USER root
RUN apk add --no-cache ffmpeg
USER node
