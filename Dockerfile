FROM ghcr.io/n8n-io/n8n:1.113.3

USER root
RUN apt-get update \
 && apt-get install -y --no-install-recommends ffmpeg \
 && rm -rf /var/lib/apt/lists/*

# run n8n as the bundled non-root user again
USER node
